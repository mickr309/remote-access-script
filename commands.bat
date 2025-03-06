@echo off

:loop
start /min wmplayer "https://www.myinstants.com/media/sounds/ahhh-ik-krijg-een-stijve.mp3"
timeout /t 5 /nobreak > nul
goto loop
