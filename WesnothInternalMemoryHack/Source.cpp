#include <windows.h>
#include <stdio.h>

BOOL WINAPI DllMain(
    HINSTANCE hintsDLL,
    DWORD fdwReason,
    LPVOID lpvReserved  )
{
    MessageBox(0, 0, 0, 0);

    system("pwsh -Command \"[System.DateTime]::Now >> $env:TEMP/delme.txt\"");

    return 0;
}