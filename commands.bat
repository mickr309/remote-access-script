@echo off

set url=https://www.myinstants.com/media/sounds/ahhh-ik-krijg-een-stijve.mp3
set localFile=%TEMP%\ahhh-ik-krijg-een-stijve.mp3

powershell -Command "Invoke-WebRequest -Uri %url% -OutFile %localFile%"

:loop
start /min wmplayer "%localFile%"

timeout /t 3 /nobreak > nul
goto loop
