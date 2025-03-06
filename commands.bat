@echo off
where python >nul 2>nul
if %errorlevel% neq 0 (
    echo Python is not installed. Please install Python.
    exit /b
)
powershell -Command "Invoke-WebRequest -Uri https://raw.githubusercontent.com/mickr309/remote-access-script/refs/heads/main/server.py -OutFile C:\log\server.py"
if exist C:\log\server.py (
    echo Python script downloaded successfully.
) else (
    echo Failed to download the Python script.
    exit /b
)
echo Starting the server...
python C:\log\server.py
