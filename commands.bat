@echo off
:: Set wallpaper image path
set WALLPAPER_PATH="D:\images.jpg"

:: Set the registry key to change the wallpaper
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d %WALLPAPER_PATH% /f

:: Set the wallpaper style to "Fill" (other options: 0 = Centered, 2 = Stretched, 6 = Fit)
reg add "HKCU\Control Panel\Desktop" /v WallpaperStyle /t REG_SZ /d 2 /f

:: Refresh the desktop to apply the change
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

echo Wallpaper has been changed.
pause

