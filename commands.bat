@echo off
:loop
echo 
powershell -c (New-Object Media.SoundPlayer "C:\Windows\Media\Windows Foreground.wav").PlaySync()
goto loop

