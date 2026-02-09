DefinitionBlock ("", "SSDT", 2, "HACK", "PTSWAK", 0x00000000)
{
    External (_SB_.PCI0.RP05.PXSX._DSM, MethodObj)
    External (_SB_.PCI0.RP05.PXSX._PS0, MethodObj)
    External (_SB_.PCI0.RP05.PXSX._PS3, MethodObj)
    External (XPTS, MethodObj)
    External (XWAK, MethodObj)

    Scope (\)
    {
        Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
        {
            If (_OSI ("Darwin") && CondRefOf (\_SB.PCI0.RP05.PXSX._PS0))
            {
                \_SB.PCI0.RP05.PXSX._PS0 ()
            }

            XPTS (Arg0)
        }

        Method (_WAK, 1, Serialized)  // _WAK: Wake
        {
            If (_OSI ("Darwin"))
            {
                If ((Arg0 < One) || (Arg0 > 0x05))
                {
                    Arg0 = 0x03
                }

                Local0 = XWAK (Arg0)
                If (CondRefOf (\_SB.PCI0.RP05.PXSX._DSM) && CondRefOf (\_SB.PCI0.RP05.PXSX._PS3))
                {
                    \_SB.PCI0.RP05.PXSX._DSM (ToUUID ("a486d8f8-0bda-471b-a72b-6042a6b5bee0"), 0x0100, 0x1A, Buffer (0x04)
                        {
                             0x01, 0x00, 0x00, 0x03
                        })
                    \_SB.PCI0.RP05.PXSX._PS3 ()
                }

                Return (Local0)
            }

            Return (XWAK (Arg0))
        }
    }
}
