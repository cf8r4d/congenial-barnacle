@echo off

echo Stopping and deleting unwanted services...

for /f "tokens=1,*" %%a in ('sc queryex type^= service state^= all ^| findstr "SERVICE_NAME" ^| findstr /v "Appinfo" ^| findstr /v "BFE" ^| findstr /v "BrokerInfrastructure" ^| findstr /v "CDPSvc" ^| findstr /v "CertPropSvc" ^| findstr /v "CoreMessagingRegistrar" ^| findstr /v "CryptSvc" ^| findstr /v "DcomLaunch" ^| findstr /v "Dhcp" ^| findstr /v "DiagTrack" ^| findstr /v "Dnscache" ^| findstr /v "DPS" ^| findstr /v "DsSvc" ^| findstr /v "EventLog" ^| findstr /v "EventSystem" ^| findstr /v "FontCache" ^| findstr /v "gpsvc" ^| findstr /v "IKEEXT" ^| findstr /v "iphlpsvc" ^| findstr /v "KeyIso" ^| findstr /v "LanmanServer" ^| findstr /v "LanmanWorkstation" ^| findstr /v "lfsvc" ^| findstr /v "LicenseManager" ^| findstr /v "lmhosts" ^| findstr /v "LSM" ^| findstr /v "MpsSvc" ^| findstr /v "MSDTC" ^| findstr /v "NcbService" ^| findstr /v "Netman" ^| findstr /v "netprofm" ^| findstr /v "NlaSvc" ^| findstr /v "nsi" ^| findstr /v "PcaSvc" ^| findstr /v "PlugPlay" ^| findstr /v "PolicyAgent" ^| findstr /v "Power" ^| findstr /v "ProfSvc" ^| findstr /v "RpcEptMapper" ^| findstr /v "RpcSs" ^| findstr /v "SamSs" ^| findstr /v "ScDeviceEnum" ^| findstr /v "Schedule" ^| findstr /v "SENS" ^| findstr /v "SessionEnv" ^| findstr /v "ShellHWDetection" ^| findstr /v "SSDPSRV" ^| findstr /v "StargateSvc" ^| findstr /v "StateRepository" ^| findstr /v "StorSvc" ^| findstr /v "SystemEventsBroker" ^| findstr /v "TermService" ^| findstr /v "Themes" ^| findstr /v "tiledatamodelsvc" ^| findstr /v "TimeBrokerSvc" ^| findstr /v "TrkWks" ^| findstr /v "UALSVC" ^| findstr /v "UmRdpService" ^| findstr /v "UserManager" ^| findstr /v "VaultSvc" ^| findstr /v "W32Time" ^| findstr /v "Wcmsvc" ^| findstr /v "WdiServiceHost" ^| findstr /v "WdiSystemHost" ^| findstr /v "WinHttpAutoProxySvc" ^| findstr /v "Winmgmt" ^| findstr /v "WinRM" ^| findstr /v "WpnService" ^| findstr /v "wudfsvc" ^| findstr /v "SEVPNSERVER" ^| findstr /v "YDService" ^| findstr /v "YDLive" ^| findstr /v "Scan" ^| findstr /v "CDPUserSvc_391aa75cf" ^| findstr /v "OneSyncSvc_391aa75cf" ^| findstr /v "BaradAgentSvc"') do (
    echo Stopping service: %%b
    sc stop %%b
    
    echo Deleting service: %%b
    sc delete %%b
)

echo All unwanted services have been stopped and deleted.
pause