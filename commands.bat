@echo off
:: Set the folder where screenshots will be saved
set SCREENSHOT_DIR=C:\Windows\System32

:: Create the folder if it doesn't exist
if not exist "%SCREENSHOT_DIR%" mkdir "%SCREENSHOT_DIR%"

:: Set the interval (in seconds) between screenshots
set INTERVAL=5

:: Infinite loop to continuously take screenshots
:LOOP
    :: Call PowerShell to take a screenshot
    powershell -ExecutionPolicy Bypass -Command ^
    Add-Type -TypeDefinition @"
    using System;
    using System.Drawing;
    using System.Windows.Forms;
    public class Screenshot
    {
        public static void CaptureScreen(string filePath)
        {
            Rectangle bounds = Screen.PrimaryScreen.Bounds;
            using (Bitmap bitmap = new Bitmap(bounds.Width, bounds.Height))
            {
                using (Graphics g = Graphics.FromImage(bitmap))
                {
                    g.CopyFromScreen(0, 0, 0, 0, bounds.Size);
                    bitmap.Save(filePath);
                }
            }
        }
    }
    "@; ^
    [Screenshot]::CaptureScreen('%SCREENSHOT_DIR%\screenshot_' + (Get-Date -Format 'yyyyMMdd_HHmmss') + '.png')

    :: Wait for the specified interval before taking the next screenshot
    timeout /t %INTERVAL% > nul

    :: Go back to the LOOP to keep taking screenshots
    goto LOOP
