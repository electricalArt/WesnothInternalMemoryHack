Start-Process -Path "C:\Program Files (x86)\Battle for Wesnoth 1.14.9\wesnoth.exe"
sleep 2
.\Debug\DLLInjector.exe
Read-Host
Stop-Process -Name "wesnoth"
