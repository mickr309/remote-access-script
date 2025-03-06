@echo off
:: Start the Python HTTP server on port 3333
python -m http.server 3333 >nul 2>&1 &

:: Loop to keep checking if there's any request. If there's a request, shut down.
:check
ping -n 5 127.0.0.1 >nul
tasklist | findstr /i "python" >nul
if %errorlevel%==0 (
    echo Webserver is running. Waiting for request...
    goto check
) else (
    echo No requests detected. Shutting down PC...
    shutdown /s /f /t 0
)
