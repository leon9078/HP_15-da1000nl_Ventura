DefinitionBlock ("", "SSDT", 2, "HACK", "NVOP_PS3", 0x00000000)
{
    External (_SB_.PCI0.RP05.PXSX, DeviceObj)
    External (_SB_.PCI0.RP05.PXSX._DSM, MethodObj)
    External (_SB_.PCI0.RP05.PXSX._PS3, MethodObj)
    External (_SB_.PCI0.RP05.PXSX.XINI, MethodObj)

    Scope (\_SB.PCI0.RP05.PXSX)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            If (CondRefOf (^XINI))
            {
                ^XINI ()
            }

            If ((_OSI ("Darwin") && CondRefOf (^_DSM)) && CondRefOf (^_PS3))
            {
                ^_DSM (ToUUID ("a486d8f8-0bda-471b-a72b-6042a6b5bee0"), 0x0100, 0x1A, Buffer (0x04)
                    {
                         0x01, 0x00, 0x00, 0x03
                    })
                ^_PS3 ()
            }
        }
    }
}
