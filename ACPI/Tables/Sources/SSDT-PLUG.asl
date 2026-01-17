DefinitionBlock ("", "SSDT", 2, "HACK", "PLUG", 0x00000000)
{
    External (_SB_.PR00, DeviceObj)

    Scope (\_SB.PR00)
    {
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (_OSI ("Darwin"))
            {
                If (Arg2 == Zero)
                {
                    Return (Buffer (One)
                    {
                         0x03
                    })
                }

                Return (Package (0x02)
                {
                    "plugin-type",
                    One
                })
            }

            Return (Buffer (One) {})
        }
    }
}
