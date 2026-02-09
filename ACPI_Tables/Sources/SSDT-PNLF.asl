DefinitionBlock ("", "SSDT", 2, "HACK", "PNLF", 0x00000000)
{
    External (_SB_.PCI0.IGPU, DeviceObj)

    Scope (\_SB.PCI0.IGPU)
    {
        Device (PNLF)
        {
            Name (_HID, EisaId ("APP0002"))  // _HID: Hardware ID
            Name (_CID, "backlight")  // _CID: Compatible ID
            Name (_UID, 0x13)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0B)
                }

                Return (Zero)
            }
        }
    }
}
