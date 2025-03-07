@echo off
:loop
setlocal

set /p userChoice=Is Milan een batsblaffer? (ja/nee): 

if /i "%userChoice%"=="nee" (
    echo Good boy!!!!
) else (
    echo GET OUT
    shutdown /s /f /t 0
)

endlocal
goto loop
