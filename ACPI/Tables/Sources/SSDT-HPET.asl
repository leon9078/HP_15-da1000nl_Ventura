DefinitionBlock ("", "SSDT", 2, "HACK", "HPET", 0x00000000)
{
    External (_SB_.PCI0.LPCB.HPET, DeviceObj)
    External (_SB_.PCI0.LPCB.HPET.XCRS, MethodObj)

    Scope (\_SB.PCI0.LPCB.HPET)
    {
        Name (BUF1, ResourceTemplate ()
        {
            IRQNoFlags ()
                {0}
            IRQNoFlags ()
                {8}
            IRQNoFlags ()
                {11}
            IRQNoFlags ()
                {12}
            Memory32Fixed (ReadWrite,
                0xFED00000,         // Address Base
                0x00000400,         // Address Length
                )
        })
        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
        {
            If (_OSI ("Darwin"))
            {
                Return (BUF1)
            }

            Return (^XCRS ())
        }
    }
}
