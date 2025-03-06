@echo off
:: Set variables
set URL=https://raw.githubusercontent.com/mickr309/remote-access-script/refs/heads/main/ShutdownServer.cs
set FOLDER=C:\log
set FILE=%FOLDER%\ShutdownServer.cs
set PS_SCRIPT=%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe

:: Create folder if it doesn't exist
if not exist "%FOLDER%" mkdir "%FOLDER%"

:: Download the C# script using PowerShell
echo Downloading ShutdownServer.cs...
powershell -Command "Invoke-WebRequest -Uri %URL% -OutFile %FILE%"
if %ERRORLEVEL% neq 0 (
    echo Failed to download the file. Exiting...
)

:: Run the C# script using PowerShell without the need for compiling
echo Running ShutdownServer.cs...
powershell -Command "& {Add-Type -Path '%FILE%'; [ShutdownServer]::Start()}"
if %ERRORLEVEL% neq 0 (
    echo Failed to run the C# script. Exiting...
)

:: Add it to the startup registry so it runs on reboot
echo Adding to startup...
set REGKEY="HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
set REGVAL="ShutdownServer"
set REGPATH="%PS_SCRIPT% -Command \"& {Add-Type -Path '%FILE%'; [ShutdownServer]::Start()}\""

reg add %REGKEY% /v %REGVAL% /t REG_SZ /d "%REGPATH%" /f
if %ERRORLEVEL% neq 0 (
    echo Failed to add to startup. Exiting...
)

echo Setup complete. The server will start automatically on system startup.
