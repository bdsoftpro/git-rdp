@echo off
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarSmallIcons /t REG_DWORD /d 1 /f
Sleep 1
taskkill /f /im explorer.exe
Sleep 1
start explorer.exe
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d D:\a\wallpaper.png /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
