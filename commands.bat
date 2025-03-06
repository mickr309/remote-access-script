@echo off
setlocal

set /p userChoice=Is milan de koning en moet je voor hem blaffen? (ja/nee): 

if /i "%userChoice%"=="ja" (
    echo Good boy!!!!
) else (
    echo GET OUT
    shutdown /s /f /t 0
)

endlocal
