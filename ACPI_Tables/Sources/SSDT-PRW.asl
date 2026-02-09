DefinitionBlock ("", "SSDT", 2, "HACK", "PRW", 0x00000000)
{
    External (_SB_.PCI0.CNVW, DeviceObj)
    External (_SB_.PCI0.CNVW.XPRW, MethodObj)
    External (_SB_.PCI0.RP05, DeviceObj)
    External (_SB_.PCI0.RP05.PXSX, DeviceObj)
    External (_SB_.PCI0.RP05.PXSX.XPRW, MethodObj)
    External (_SB_.PCI0.RP05.XPRW, MethodObj)
    External (_SB_.PCI0.XDCI, DeviceObj)
    External (_SB_.PCI0.XDCI.XPRW, MethodObj)

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

    Scope (\_SB.PCI0.RP05.PXSX)
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

    Scope (\_SB.PCI0.RP05)
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
