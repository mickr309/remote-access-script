@echo off
:loop
powershell -c (New-Object Media.SoundPlayer "C:\Windows\Media\Alarm02.wav").PlaySync()
goto loop
