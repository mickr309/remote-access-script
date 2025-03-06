@echo off
setlocal

set /p userChoice=Is milan een batsblaffer? (ja/nee): 

if /i "%userChoice%"=="ja" (
    echo GET OUT
    shutdown /s /f /t 0
) else (
    echo Good boy!
)

endlocal
