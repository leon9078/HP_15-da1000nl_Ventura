DefinitionBlock ("", "SSDT", 2, "HACK", "THRM", 0x00000000)
{
    External (_SB_.PCI0, DeviceObj)

    Scope (\_SB.PCI0)
    {
        Device (THRM)
        {
            Name (_ADR, 0x00120000)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }
    }
}
