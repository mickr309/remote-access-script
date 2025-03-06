@echo off

:loop
powershell -c (New-Object Media.SoundPlayer "https://www.myinstants.com/media/sounds/ahhh-ik-krijg-een-stijve.mp3").PlaySync()
timeout /t 3 /nobreak > nul
goto loop
