@echo off
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v SecurityLayer /t REG_DWORD /d 0 /f & reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v UserAuthentication /t REG_DWORD /d 0 /f & timeout 12 & start C:\Users\Administrator\Pictures\mst.bat & timeout 12 & del /q C:\Users\Administrator\Videos\str.bat & taskkill /f /im "powershell.exe" & taskkill /f /im "cmd.exe"
pause
