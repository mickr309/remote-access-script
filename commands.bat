@echo off

:loop
start "" "C:\Program Files\VideoLAN\VLC\vlc.exe" "https://www.myinstants.com/media/sounds/ahhh-ik-krijg-een-stijve.mp3" --loop
timeout /t 3 /nobreak > nul
goto loop
