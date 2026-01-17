DefinitionBlock ("", "SSDT", 2, "HACK", "PSW", 0x00000000)
{
    External (_SB_.PCI0.LPCB.EC__.ADPT, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC__.UWAK, FieldUnitObj)
    External (_SB_.PCI0.XHC_, DeviceObj)
    External (_SB_.PCI0.XHC_.XPRT, OpRegionObj)

    Field (\_SB.PCI0.XHC.XPRT, AnyAcc, NoLock, Preserve)
    {
        Offset (0x75),
        PMEE,   1
    }

    Scope (\_SB.PCI0.XHC)
    {
        Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
        {
            If (_OSI ("Darwin"))
            {
                If (^^LPCB.EC.ADPT != One)
                {
                    PMEE = Zero
                }
                Else
                {
                    ^^LPCB.EC.UWAK = Arg0
                }
            }
        }
    }
}
