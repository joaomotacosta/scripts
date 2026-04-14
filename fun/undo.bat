@echo off

:: Restore mouse buttons
rundll32 user32.dll,SwapMouseButton

:: Show desktop icons again
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideIcons /t REG_DWORD /d 0 /f
taskkill /f /im explorer.exe
start explorer.exe

:: Reset wallpaper (optional)
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

msg * "All back to normal 👍"