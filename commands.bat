@echo off
:: Set the number of rows and columns for the grid
set ROWS=10
set COLS=10

:: Set the name for the text files (without extension)
set FILENAME=nigger

:: Set the folder for the text files to be created (Desktop folder)
set DESKTOP=%USERPROFILE%\Desktop

:: Set the default content of the text files (optional)
set FILECONTENT=This is a text file

:: Create the grid of text files
for /L %%i in (1, 1, %ROWS%) do (
    for /L %%j in (1, 1, %COLS%) do (
        :: Generate the file name
        setlocal enabledelayedexpansion
        set "FILENAME_TEXT=%FILENAME%_%%i_%%j.txt"
        echo %FILECONTENT% > "%DESKTOP%\!FILENAME_TEXT!"
        endlocal
    )
)

echo Desktop is now filled with text files.
pause
