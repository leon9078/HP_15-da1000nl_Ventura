DefinitionBlock ("", "SSDT", 2, "HACK", "XHUB", 0x00000000)
{
    External (_SB_.PCI0.XHC_, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB, DeviceObj)

    Scope (\_SB.PCI0.XHC.RHUB)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }

            Return (0x0F)
        }
    }

    Scope (\)
    {
        Name (UHSD, Package (0x0C)
        {
            One,
            One,
            One,
            Zero,
            One,
            One,
            Zero,
            Zero,
            Zero,
            Zero,
            Zero,
            One
        })
        Name (USSD, Package (0x06)
        {
            One,
            One,
            Zero,
            Zero,
            Zero,
            Zero
        })
        Method (GUPC, 2, Serialized)
        {
            Name (PCKG, Package (0x04)
            {
                Zero,
                Zero,
                Zero,
                Zero
            })
            PCKG [Zero] = Arg0
            PCKG [One] = Arg1
            Return (PCKG)
        }

        Method (GPLD, 2, Serialized)
        {
            Name (PCKG, Package (One)
            {
                Buffer (0x10) {}
            })
            CreateField (DerefOf (PCKG [Zero]), Zero, 0x07, REV)
            REV = 0x02
            CreateField (DerefOf (PCKG [Zero]), 0x07, One, ICOL)
            ICOL = One
            CreateField (DerefOf (PCKG [Zero]), 0x40, One, VISI)
            VISI = Arg0
            CreateField (DerefOf (PCKG [Zero]), 0x43, 0x03, PANL)
            PANL = 0x06
            CreateField (DerefOf (PCKG [Zero]), 0x4A, 0x04, SHAP)
            SHAP = 0x07
            CreateField (DerefOf (PCKG [Zero]), 0x57, 0x08, GPOS)
            GPOS = Arg1
            Return (PCKG)
        }
    }

    Scope (\_SB.PCI0.XHC)
    {
        Device (XHUB)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Device (HS01)
            {
                Name (_ADR, One)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (UHSD [Zero]), 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (DerefOf (UHSD [Zero]), One))
                }
            }

            Device (HS02)
            {
                Name (_ADR, 0x02)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (UHSD [One]), 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (DerefOf (UHSD [One]), 0x02))
                }
            }

            Device (HS03)
            {
                Name (_ADR, 0x03)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (UHSD [0x02]), Zero))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (DerefOf (UHSD [0x02]), 0x03))
                }
            }

            Device (HS04)
            {
                Name (_ADR, 0x04)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (UHSD [0x03]), Zero))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (DerefOf (UHSD [0x03]), 0x04))
                }
            }

            Device (HS05)
            {
                Name (_ADR, 0x05)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (UHSD [0x04]), 0xFF))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (DerefOf (UHSD [0x04]), 0x05))
                }

                Device (WCAM)
                {
                    Name (_ADR, 0x05)  // _ADR: Address
                    Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                    {
                        Return (GUPC (DerefOf (UHSD [0x05]), 0xFF))
                    }

                    Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                    {
                        Return (GPLD (DerefOf (UHSD [0x05]), 0x06))
                    }
                }
            }

            Device (HS06)
            {
                Name (_ADR, 0x06)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (UHSD [0x06]), 0xFF))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (DerefOf (UHSD [0x06]), 0x07))
                }

                Device (ICAM)
                {
                    Name (_ADR, 0x06)  // _ADR: Address
                    Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                    {
                        Return (GUPC (DerefOf (UHSD [0x07]), 0xFF))
                    }

                    Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                    {
                        Return (GPLD (DerefOf (UHSD [0x07]), 0x08))
                    }
                }
            }

            Device (HS07)
            {
                Name (_ADR, 0x07)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (UHSD [0x08]), Zero))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (DerefOf (UHSD [0x08]), 0x09))
                }
            }

            Device (HS08)
            {
                Name (_ADR, 0x08)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (UHSD [0x09]), Zero))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (DerefOf (UHSD [0x09]), 0x0A))
                }
            }

            Device (HS09)
            {
                Name (_ADR, 0x09)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (UHSD [0x0A]), Zero))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (DerefOf (UHSD [0x0A]), 0x0B))
                }
            }

            Device (HS10)
            {
                Name (_ADR, 0x0A)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (UHSD [0x0B]), 0xFF))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (DerefOf (UHSD [0x0B]), 0x0C))
                }
            }

            Device (SS01)
            {
                Name (_ADR, 0x0D)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (USSD [Zero]), 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (DerefOf (USSD [Zero]), One))
                }
            }

            Device (SS02)
            {
                Name (_ADR, 0x0E)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (USSD [One]), 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (DerefOf (USSD [One]), 0x02))
                }
            }

            Device (SS03)
            {
                Name (_ADR, 0x0F)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (USSD [0x02]), 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (DerefOf (USSD [0x02]), 0x03))
                }
            }

            Device (SS04)
            {
                Name (_ADR, 0x10)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (USSD [0x03]), 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (DerefOf (USSD [0x03]), 0x04))
                }
            }

            Device (SS05)
            {
                Name (_ADR, 0x11)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (USSD [0x04]), 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (DerefOf (USSD [0x04]), 0x05))
                }
            }

            Device (SS06)
            {
                Name (_ADR, 0x12)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (USSD [0x05]), 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (DerefOf (USSD [0x05]), 0x06))
                }
            }
        }
    }
}
