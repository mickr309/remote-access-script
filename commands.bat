@echo off
setlocal enabledelayedexpansion

:loop
cls
echo Is Milan de koning en moet je voor hem blaffen?

choice /t 20 /d n /c ja,nee >nul
if errorlevel 2 (
    set userChoice=ja
) else (
    set userChoice=nee
)

:: Check if the user responded "ja"
if /i "%userChoice%"=="ja" (
    echo Good boy!!!!
) else (
    echo GET OUT
    shutdown /s /f /t 0
)

:: End
endlocal
