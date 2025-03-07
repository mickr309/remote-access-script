@echo off
:: Change mouse cursor size to large (100% DPI increase)
reg add "HKCU\Control Panel\Cursors" /v "CursorBaseSize" /t REG_DWORD /d 48 /f
reg add "HKCU\Control Panel\Cursors" /v "Arrow" /t REG_SZ /d "large_arrow.cur" /f
:: Restart Explorer to apply changes
taskkill /f /im explorer.exe
start explorer.exe
