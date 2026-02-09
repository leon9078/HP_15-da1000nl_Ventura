ACPI revision: 6.1
This are all the ACPI tables that I need for my hackintosh build!
I'm using RehabMan version of MaciASL, just because it includes the same iasl version as my original OEM tables extract from the BIOS with UEFITool.
Compiler version is 22 of April 2016.

In order to decompile with RehabMan iasl, you must be on macOS environment.

Make sure the compiler is executable:
% chmod +x iasl61

To decompile:
% ./iasl61 -Rd -d SSDT-RTC.aml

This will generate an ASCII decompiled file (*.dsl)

To compile a source file:
% ./iasl61 -Rd SSDT-RTC.dsl

This will generate the binary file (*.aml)

To create a listing file of the source, type:
% ./iasl61 -Rd -l SSDT-RTC.asl

This will generate 2 files:
1) binary file (*.aml)
2) listing file (*.lst)
