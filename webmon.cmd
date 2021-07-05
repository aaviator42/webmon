@echo off
:: webmon.cmd v1 by @aaviator42

set uri="https://example.com"
set logfile="webmon-log.txt"

REM STATUS: 0 is ok, non-0 is error
set previous_status=1111111111

echo [!] webmon.cmd v1 by @aaviator42
echo [!] URI is %uri%
echo [!] Logfile is %logfile%
echo [!] Starting monitoring...
echo [!] %date% %time% URI is %uri% >> %logfile%
echo [!] %date% %time% Starting monitoring... >> %logfile%

:main
curl -sSf %uri% > nul 2>&1
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
