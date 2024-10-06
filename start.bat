@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
net config server /srvcomment:"Windows Server 2023 Md Delwar Hossain" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f /v Wallpaper /t REG_SZ /d D:\a\wallpaper.bat
net user %1 %2 /add >nul
net localgroup administrators %1 /add >nul
net user %1 /active:yes >nul
net user installer /delete
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant %1:F >nul
ICACLS C:\Windows\installer /grant %1:F >nul
echo Installation Successful! If RDP is Dead, Please Rebuild Again, Ok!
echo Username: %1
echo Password: %2
echo Md Delwar Hossain
ping -n 10 127.0.0.1 >nul
