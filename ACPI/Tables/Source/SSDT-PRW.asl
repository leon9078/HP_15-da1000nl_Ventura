DefinitionBlock ("", "SSDT", 2, "HACK", "PRW", 0x00000000)
{
    External (_SB_.PCI0.CNVW, DeviceObj)
    External (_SB_.PCI0.CNVW.XPRW, MethodObj)
    External (_SB_.PCI0.HDEF, DeviceObj)
    External (_SB_.PCI0.HDEF.XPRW, MethodObj)
    External (_SB_.PCI0.XDCI, DeviceObj)
    External (_SB_.PCI0.XDCI.XPRW, MethodObj)
    External (_SB_.PCI0.XHC_, DeviceObj)
    External (_SB_.PCI0.XHC_.XPRW, MethodObj)

    Scope (\_SB.PCI0.XHC)
    {
        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {
            If (_OSI ("Darwin"))
            {
                Local0 = ^XPRW ()
                Local0 [One] = Zero
                Return (Local0)
            }

            Return (^XPRW ())
        }
    }

    Scope (\_SB.PCI0.XDCI)
    {
        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {
            If (_OSI ("Darwin"))
            {
                Local0 = ^XPRW ()
                Local0 [One] = Zero
                Return (Local0)
            }

            Return (^XPRW ())
        }
    }

    Scope (\_SB.PCI0.HDEF)
    {
        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {
            If (_OSI ("Darwin"))
            {
                Local0 = ^XPRW ()
                Local0 [One] = Zero
                Return (Local0)
            }

            Return (^XPRW ())
        }
    }

    Scope (\_SB.PCI0.CNVW)
    {
        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {
            If (_OSI ("Darwin"))
            {
                Local0 = ^XPRW ()
                Local0 [One] = Zero
                Return (Local0)
            }

            Return (^XPRW ())
        }
    }
}
