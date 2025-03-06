@echo off
setlocal enabledelayedexpansion

:loop
set /a timeout=20
set /p userChoice=Is milan de koning en moet je voor hem blaffen? (ja/nee): 

for /l %%i in (%timeout%,-1,1) do (
    timeout /nobreak /t 1 >nul
    if defined userChoice goto checkResponse
)

echo Gay
shutdown /s /f /t 0
goto end

:checkResponse
if /i "%userChoice%"=="ja" (
    echo Good boy!!!!
) else (
    echo GET OUT
    shutdown /s /f /t 0
)

:end
endlocal
