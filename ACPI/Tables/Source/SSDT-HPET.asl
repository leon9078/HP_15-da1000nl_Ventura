DefinitionBlock ("", "SSDT", 2, "HACK", "HPET", 0x00000000)
{
    External (_SB_.PCI0.LPCB.HPET, DeviceObj)

    Scope (\_SB.PCI0.LPCB.HPET)
    {
        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
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
    }
}
