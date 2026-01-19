DefinitionBlock ("", "SSDT", 2, "HACK", "PINI", 0x00000000)
{
    External (_SB_.PCI0, DeviceObj)

    Scope (\_SB.PCI0)
    {
        Method (PINI, 0, NotSerialized)
        {
        }
    }
}
