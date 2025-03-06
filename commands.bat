@echo off
:: Set the path to the image
set IMAGE_PATH=D:\images.jpg

:: Set the path to the VBS script
set VBS_PATH=%TEMP%\move_image.vbs

:: Create the VBS script dynamically
echo Set WshShell = CreateObject("WScript.Shell") > "%VBS_PATH%"
echo Set objIE = CreateObject("InternetExplorer.Application") >> "%VBS_PATH%"
echo objIE.Visible = True >> "%VBS_PATH%"
echo objIE.navigate "%IMAGE_PATH%" >> "%VBS_PATH%"
echo Do While objIE.Busy Or objIE.ReadyState <> 4 >> "%VBS_PATH%"
echo     WScript.Sleep 100 >> "%VBS_PATH%"
echo Loop >> "%VBS_PATH%"
echo Dim x, y >> "%VBS_PATH%"
echo x = 0 >> "%VBS_PATH%"
echo y = 0 >> "%VBS_PATH%"
echo Do >> "%VBS_PATH%"
echo     objIE.document.parentWindow.scrollTo x, y >> "%VBS_PATH%"
echo     x = x + 10 >> "%VBS_PATH%"
echo     y = y + 10 >> "%VBS_PATH%"
echo     WScript.Sleep 100 >> "%VBS_PATH%"
echo     If x > 1000 Then x = 0 >> "%VBS_PATH%"
echo     If y > 1000 Then y = 0 >> "%VBS_PATH%"
echo Loop >> "%VBS_PATH%"

:: Run the VBS script
cscript //nologo "%VBS_PATH%"

:: Delete the VBS script after execution
del "%VBS_PATH%"
