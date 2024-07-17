#include <windows.h>
#include <tlhelp32.h>
#include <stdio.h>

void ExitError(const char* szcMsg) {
    puts(szcMsg);
    getchar();
    exit(1);
}

//  Finds the game process. Returns found game process handle.
HANDLE GetProcessHandle(const wchar_t* szcGameName) {
    DWORD wProcessId = 0;
    HANDLE hSnapshot = 0;
    PROCESSENTRY32 processEntry = { 0 };

    processEntry.dwSize = sizeof(PROCESSENTRY32);
    hSnapshot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, NULL);
    Process32First(hSnapshot, &processEntry);
    do {
        if (wcscmp(processEntry.szExeFile, szcGameName) == 0) {
            wProcessId = processEntry.th32ProcessID;
            break;
        }
    } while (Process32Next(hSnapshot, &processEntry));

    HANDLE hProcess = OpenProcess(PROCESS_ALL_ACCESS, true, wProcessId);

    return hProcess;
}

//  Writes string that contains hack .dll path to the game process. Stores written memory
//  address to `lpProcessSzcDllPath` variable.
LPVOID WriteHackDllToProcess(HANDLE hProcess, const char* szcDllPath) {
    LPVOID lpProcessSzcDllPath = VirtualAllocEx(
        hProcess,
        NULL,
        strlen(szcDllPath) + 1,
        MEM_COMMIT,
        PAGE_READWRITE );
    if (lpProcessSzcDllPath == NULL) {
        ExitError("ERROR: lpProcessSzcDllPath is NULL");
    }
    SIZE_T cbWritten = 0;
    WriteProcessMemory(
        hProcess,
        lpProcessSzcDllPath,
        szcDllPath,
        strlen(szcDllPath) + 1,
        &cbWritten);

    return lpProcessSzcDllPath;
}

//  Creates remote thread in the game process. This thread starts hack .dll.
HANDLE CreateHackThread(HANDLE hProcess, LPVOID lpProcessSzcDllPath) {
    HMODULE hKernel32base = GetModuleHandleA("kernel32.dll");
    if (hKernel32base == NULL) {
        ExitError("hKernel32base is NULL");
    }
    auto lpThreadStartAddress = (LPTHREAD_START_ROUTINE)GetProcAddress(hKernel32base, "LoadLibraryA");
    DWORD wThreadId = 0;
    HANDLE hThread = CreateRemoteThread(
        hProcess,
        NULL,
        0,
        lpThreadStartAddress,
        lpProcessSzcDllPath,
        0,
        &wThreadId);
    if (hThread == NULL) {
        ExitError("ERROR: hThread is NULL");
    }
    printf("wThreadId: %d\n", wThreadId);

    return hThread;
}

//  Waits for the thread to finish
void WaitThread(HANDLE hThread) {
    DWORD wThreadExitCode = 0;
    WaitForSingleObject(hThread, INFINITE);
    GetExitCodeThread(hThread, &wThreadExitCode);
    printf("wThreadExitCode: %d\n", wThreadExitCode);
    if (wThreadExitCode == 0) {
        printf("THREAD ERROR: %d\n", GetLastError());
    }
}

int main(int argc, char** argv) {
    const wchar_t* szcGameName =
        L"wesnoth.exe";
        //L"tanksblitz.exe";
        //L"notepad.exe";
    const char* szcDllPath =
        "C:\\Users\\musli\\ArtHome\\Projects\\GameCheats\\Wesnoth\\WesnothInternalMemoryHack\\Debug\\WesnothInternalMemoryHack.dll";

    HANDLE hProcess = GetProcessHandle(szcGameName);
    LPVOID lpProcessSzcDllPath = WriteHackDllToProcess(hProcess, szcDllPath);
    HANDLE hThread = CreateHackThread(hProcess, lpProcessSzcDllPath);
    WaitThread(hThread);

    VirtualFreeEx(
        hProcess,
        lpProcessSzcDllPath,
        0,
        MEM_RELEASE);
    CloseHandle(hThread);
    CloseHandle(hProcess);

    //getchar();

    return 0;
}