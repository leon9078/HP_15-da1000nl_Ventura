DefinitionBlock ("", "SSDT", 2, "HACK", "INI", 0x00000000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.RP05.PXSX._DSM, MethodObj)
    External (_SB_.PCI0.RP05.PXSX._PS3, MethodObj)
    External (_SB_.PCI0.XINI, MethodObj)

    Scope (\_SB.PCI0)
    {
        Method (_INI, 0, Serialized)  // _INI: Initialize
        {
            ^XINI ()
            If (_OSI ("Darwin") && (CondRefOf (^RP05.PXSX._DSM) && CondRefOf (^RP05.PXSX._PS3)))
            {
                ^RP05.PXSX._DSM (ToUUID ("a486d8f8-0bda-471b-a72b-6042a6b5bee0"), 0x0100, 0x1A, Buffer (0x04)
                    {
                         0x01, 0x00, 0x00, 0x03
                    })
                ^RP05.PXSX._PS3 ()
            }
        }
    }
}
