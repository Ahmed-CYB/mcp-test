@echo off
REM RDP Configuration Script for Development Environment
REM Enable Remote Desktop
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f

REM Configure RDP port (default 3389)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v PortNumber /t REG_DWORD /d 3389 /f

REM Allow RDP through firewall
netsh advfirewall firewall set rule group="remote desktop" new enable=Yes

REM Configure Network Level Authentication (disabled for dev)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v UserAuthentication /t REG_DWORD /d 0 /f

REM Set session timeout (extended for development)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v MaxConnectionTime /t REG_DWORD /d 0 /f

REM Restart Terminal Services
net stop TermService /y
net start TermService

echo RDP Configuration Complete
echo Server accessible at: DEVBOX01:3389
echo WARNING: NLA disabled for development - re-enable for production
pause