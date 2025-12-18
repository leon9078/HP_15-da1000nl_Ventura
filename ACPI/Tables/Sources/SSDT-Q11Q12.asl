DefinitionBlock ("", "SSDT", 2, "HACK", "Q11Q12", 0x00000000)
{
    External (_SB_.PCI0.LPCB.EC__, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__.XQ11, MethodObj)
    External (_SB_.PCI0.LPCB.EC__.XQ12, MethodObj)
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)

    Scope (\_SB.PCI0.LPCB.EC)
    {
        Method (_Q11, 0, NotSerialized)  // _Qxx: EC Query
        {
            If (_OSI ("Darwin"))
            {
                Notify (^^PS2K, 0x0205)
                Notify (^^PS2K, 0x0285)
            }

            ^XQ11 ()
        }

        Method (_Q12, 0, NotSerialized)  // _Qxx: EC Query
        {
            If (_OSI ("Darwin"))
            {
                Notify (^^PS2K, 0x0206)
                Notify (^^PS2K, 0x0286)
            }

            ^XQ12 ()
        }
    }
}
