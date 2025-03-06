@echo off
:loop
powershell -c (New-Object Media.SoundPlayer "C:\Windows\Media\Alarm01.wav").PlaySync()
goto loop
