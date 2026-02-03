DefinitionBlock ("", "SSDT", 2, "HACK", "XOSI", 0x00000000)
{
    Scope (\)
    {
        Method (XOSI, 1, NotSerialized)
        {
            If (_OSI ("Darwin") && (Arg0 == "Windows 2017.2"))
            {
                Return (Ones)
            }
            Else
            {
                Return (_OSI (Arg0))
            }
        }
    }
}
