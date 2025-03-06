@echo off
:: Set variables
set URL=https://raw.githubusercontent.com/mickr309/remote-access-script/refs/heads/main/ShutdownServer.cs
set FOLDER=C:\log
set FILE=%FOLDER%\ShutdownServer.cs
set EXE=%FOLDER%\ShutdownServer.exe
set CSC=%SystemRoot%\Microsoft.NET\Framework64\v4.0.30319\csc.exe

:: Create folder if it doesn't exist
if not exist "%FOLDER%" mkdir "%FOLDER%"

:: Download the C# code
echo Downloading ShutdownServer.cs...
powershell -Command "Invoke-WebRequest -Uri %URL% -OutFile %FILE%"

:: Compile the C# file
echo Compiling ShutdownServer.cs...
"%CSC%" "%FILE%" /out:"%EXE%"

:: Run the executable immediately after compiling
if exist "%EXE%" (
    echo Server started. It will listen on port 8080 for shutdown requests.
    start "" "%EXE%"
) else (
    echo Compilation failed.
)

:: Make it run on startup
echo Adding to startup...
set REGKEY="HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
set REGVAL="ShutdownServer"
set REGPATH="%EXE%"

reg add %REGKEY% /v %REGVAL% /t REG_SZ /d "%REGPATH%" /f

echo Setup complete. The server will start automatically on system startup.
exit
