@echo off
:loop
start chrome https://www.youtube.com/watch?v=8WVBT7FrgJI
timeout /t 2 /nobreak
goto loop

