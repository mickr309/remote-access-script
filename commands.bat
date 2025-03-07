@echo off
:loop
msg * "This is a test pop-up message. Press OK to continue."
timeout /t 5 /nobreak >nul
goto loop

