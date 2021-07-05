@echo off
:: pingmon.cmd v1 by @aaviator42

set hostname="1.1.1.1"
set logfile="pingmon-log.txt"

REM STATUS: 0 is ok, non-0 is error
set previous_status=1111111111

echo [!] pingmon.cmd v1 by @aaviator42
echo [!] Hostname is %hostname%
echo [!] Logfile is %logfile%
echo [!] Starting monitoring...
echo [!] %date% %time% Hostname is %hostname% >> %logfile%
echo [!] %date% %time% Starting monitoring... >> %logfile%

:main
ping -n 1 %hostname% > nul 2>&1
if %errorlevel%==%previous_status% goto main
if %errorlevel%==0 (
	echo %date% %time% ALL OK >> %logfile%
	echo %date% %time% ALL OK 
) else (
	echo %date% %time% ERROR CODE: %errorlevel% >> %logfile%
	echo %date% %time% ERROR CODE: %errorlevel% 
)
set previous_status=%errorlevel%
goto :main
