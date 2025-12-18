DefinitionBlock ("", "SSDT", 2, "HACK", "RTC", 0x00000000)
{
    External (_SB_.AWAC, DeviceObj)
    External (_SB_.PCI0.LPCB.RTC_, DeviceObj)

    Scope (\_SB.AWAC)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }

            Return (0x0F)
        }
    }

    Scope (\_SB.PCI0.LPCB.RTC)
    {
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
