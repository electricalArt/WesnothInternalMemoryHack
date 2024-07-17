#include <windows.h>
#include <stdio.h>

void LogMessage(const char* szMessage) {
    char szCmd[256] = {0};
    sprintf_s(szCmd, "pwsh -Command \"(%s) >> $env:TEMP/delme.txt\"", szMessage);
    system(szCmd);
}

void LogStarting() {
    LogMessage("[System.DateTime]::Now");
}

void ListenKeyboardToHack() {
    LogMessage("'Hello from thread2'");

    DWORD* pdwPlayerBase = (DWORD*)(0x017EED18);
    DWORD* pdwGameBase = (DWORD*)(*pdwPlayerBase + 0xA90);
    DWORD* pdwGold = (DWORD*)(*pdwGameBase + 0x4);

    char szMessage[255] = {0};
    sprintf_s(szMessage, "'pdwPlayerBase: %p'", pdwPlayerBase);
    LogMessage(szMessage);
    sprintf_s(szMessage, "'pdwGameBase: %p'", pdwGameBase);
    LogMessage(szMessage);
    sprintf_s(szMessage, "'pdwGold: %p'", pdwGold);
    LogMessage(szMessage);

    while (true) {
        SHORT nKeyPressed = GetAsyncKeyState('M');

        if (nKeyPressed) {
            *pdwGold = 999;
        }

        Sleep(100);
    }
}

BOOL WINAPI DllMain(
    HINSTANCE hintsDLL,
    DWORD fdwReason,
    LPVOID lpvReserved  )
{
    if (fdwReason == DLL_PROCESS_ATTACH) {
        LogMessage("[System.DateTime]::Now");
        LogMessage("'_Start_'");

        HANDLE hThread = CreateThread(
            NULL,
            0,
            (LPTHREAD_START_ROUTINE)ListenKeyboardToHack,
            NULL,
            0,
            NULL );

        LogMessage("'_End_'");
    }

    return true;
}