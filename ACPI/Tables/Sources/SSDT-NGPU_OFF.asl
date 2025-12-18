DefinitionBlock ("", "SSDT", 2, "HACK", "NGPU_OFF", 0x00000000)
{
    External (_SB_.PCI0.RP05.PXSX, DeviceObj)
    External (_SB_.PCI0.RP05.PXSX._OFF, MethodObj)
    External (_SB_.PCI0.RP05.PXSX.XINI, MethodObj)

    If (CondRefOf (\_SB.PCI0.RP05.PXSX.XINI) && CondRefOf (\_SB.PCI0.RP05.PXSX._OFF))
    {
        Scope (\_SB.PCI0.RP05.PXSX)
        {
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                ^XINI ()
                If (_OSI ("Darwin"))
                {
                    ^_OFF ()
                }
            }
        }
    }
}
