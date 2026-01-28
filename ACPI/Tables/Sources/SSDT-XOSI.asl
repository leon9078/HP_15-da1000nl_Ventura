DefinitionBlock ("", "SSDT", 2, "HACK", "XOSI", 0x00000000)
{
    Scope (\)
    {
        Method (XOSI, 1, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Return ((Match (Package (One)
                            {
                                "Windows 2016"
                            }, MEQ, Arg0, MTR, Zero, Zero) != Ones))
            }
            Else
            {
                Return (_OSI (Arg0))
            }
        }
    }
}
