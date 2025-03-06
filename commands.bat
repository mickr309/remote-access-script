@echo off
:: Check if Python is installed
where python >nul 2>nul
if %errorlevel% neq 0 (
    echo Python is not installed. Please install Python.
    exit /b
)

:: Download the Python script from GitHub
echo Downloading server.py from GitHub...
curl -o server.py https://raw.githubusercontent.com/mickr309/remote-access-script/refs/heads/main/server.py

:: Check if the download was successful
if exist server.py (
    echo Python script downloaded successfully.
) else (
    echo Failed to download the Python script.
    exit /b
)

:: Start the Python server script
python server.py
