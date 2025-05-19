DefinitionBlock ("", "SSDT", 2, "HACK", "PRRE", 0x00000000)
{
    External (_SB_.PCI0.PRRE, DeviceObj)
    External (_SB_.PCI0.PRRE.XCRS, MethodObj)
    External (DSPM, FieldUnitObj)
    External (PCHL, IntObj)
    External (PCHS, FieldUnitObj)
    External (PMBS, FieldUnitObj)
    External (PSTP, FieldUnitObj)
    External (SBRG, FieldUnitObj)

    Scope (\_SB.PCI0.PRRE)
    {
        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
        {
            If (_OSI ("Darwin"))
            {
                Name (BUF0, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xFD000000,         // Address Base
                        0x006A0000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y01)
                    Memory32Fixed (ReadWrite,
                        0xFD6F0000,         // Address Base
                        0x00910000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFE200000,         // Address Base
                        0x00600000,         // Address Length
                        )
                    Memory32Fixed (ReadOnly,
                        0xFF000000,         // Address Base
                        0x01000000,         // Address Length
                        )
                    IO (Decode16,
                        0x0000,             // Range Minimum
                        0x0000,             // Range Maximum
                        0x01,               // Alignment
                        0xFF,               // Length
                        _Y00)
                })
                CreateWordField (BUF0, \_SB.PCI0.PRRE._CRS._Y00._MIN, AMIN)  // _MIN: Minimum Base Address
                CreateWordField (BUF0, \_SB.PCI0.PRRE._CRS._Y00._MAX, AMAX)  // _MAX: Maximum Base Address
                AMIN = PMBS
                AMAX = PMBS
                CreateDWordField (BUF0, \_SB.PCI0.PRRE._CRS._Y01._BAS, GBAS)  // _BAS: Base Address
                CreateDWordField (BUF0, \_SB.PCI0.PRRE._CRS._Y01._LEN, GLEN)  // _LEN: Length
                GBAS = (SBRG + 0x006B0000)
                GLEN = 0x00020000
                Name (BUF1, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00400000,         // Address Length
                        _Y02)
                })
                CreateDWordField (BUF1, \_SB.PCI0.PRRE._CRS._Y02._BAS, HDBA)  // _BAS: Base Address
                HDBA = DSPM
                If ((PCHS == PCHL) && (PSTP < 0x10))
                {
                    Return (ConcatenateResTemplate (BUF0, BUF1))
                }

                Return (BUF0)
            }

            Return (^XCRS ())
        }
    }
}
