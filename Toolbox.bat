@echo off
title Naem's Ultimate Toolbox v2.3
color 0A

:: Set password untuk akses toolbox
set "password=zigzag"

:: Login Screen
:login
cls
echo =========================================================
echo                  NAEM'S ULTIMATE TOOLBOX
echo =========================================================
set /p "userpass=Enter Password: "
if "%userpass%"=="%password%" (
    echo Access Granted!
    timeout /t 2 >nul
    goto menu
) else (
    echo Invalid Password! Access Denied.
    timeout /t 3 >nul
    goto login
)

:: Main Menu
:menu
cls
echo =========================================================
echo                 NAEM'S ULTIMATE TOOLBOX
echo =========================================================
echo [1] System Info
echo [2] Activation Tools
echo [3] Software Management
echo [4] Networking Tools
echo [5] Exit
echo =========================================================
set /p choice="Enter your choice [1-5]: "

if "%choice%"=="1" goto sysinfo
if "%choice%"=="2" goto activation
if "%choice%"=="3" goto software
if "%choice%"=="4" goto networking
if "%choice%"=="5" goto exit

echo Invalid choice, please try again.
pause
goto menu

:: ============================================
:: [1] SYSTEM INFO & OPTIMIZATION
:: ============================================
:sysinfo
cls
echo =========================================================
echo             SYSTEM INFO 
echo =========================================================
echo [1] View System Specs
echo [2] Performance Booster
echo [3] Back to Main Menu
echo =========================================================
set /p sysinfochoice="Enter your choice [1-3]: "

if "%sysinfochoice%"=="1" goto specs
if "%sysinfochoice%"=="2" goto booster
if "%sysinfochoice%"=="3" goto menu

:specs
cls
echo =========================================================
echo                    SYSTEM SPECS
echo =========================================================
echo CPU Info:
wmic cpu get Name, MaxClockSpeed, NumberOfCores, NumberOfLogicalProcessors
echo ---------------------------------------------------------
echo GPU Info:
wmic path win32_videocontroller get Name, DriverVersion, AdapterRAM
echo ---------------------------------------------------------
echo RAM Info:
wmic memorychip get BankLabel, Capacity, Speed, Manufacturer
echo ---------------------------------------------------------
echo Storage Info:
wmic logicaldisk get DeviceID, FreeSpace, Size, VolumeName
pause
goto sysinfo

:booster
cls
echo =========================================================
echo                 PERFORMANCE BOOSTER
echo =========================================================
echo Enabling Ultimate Performance Power Plan...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
echo Power plan activated!
pause
goto sysinfo

:: ============================================
:: [2] ACTIVATION TOOLS
:: ============================================
:activation
cls
echo =========================================================
echo             ACTIVATION TOOLS
echo =========================================================
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {irm 'https://get.activated.win' | iex}"
pause
goto menu

:: ============================================
:: [3] SOFTWARE MANAGEMENT
:: ============================================
:software
cls
echo =========================================================
echo             SOFTWARE MANAGEMENT
echo =========================================================
echo [1] Install Google Chrome
echo [2] Install WinRAR
echo [3] Back to Main Menu
echo =========================================================
set /p softwarechoice="Enter your choice [1-3]: "

if "%softwarechoice%"=="1" (
    start /wait msiexec /i "https://dl.google.com/chrome/install/standalone/GoogleChromeStandaloneEnterprise64.msi" /quiet /norestart
    echo Google Chrome Installed!
)
if "%softwarechoice%"=="2" (
    start /wait msiexec /i "https://www.rarlab.com/rar/winrar-x64-612.exe" /quiet /norestart
    echo WinRAR Installed!
)
if "%softwarechoice%"=="3" goto menu
pause
goto software

:: ============================================
:: [4] NETWORKING TOOLS
:: ============================================
:networking
cls
echo =========================================================
echo             NETWORKING TOOLS
echo =========================================================
echo [1] IP Tracer
echo [2] Ping Tester
echo [3] Back to Main Menu
echo =========================================================
set /p networkchoice="Enter your choice [1-3]: "

if "%networkchoice%"=="1" (
    powershell -Command "& {Invoke-WebRequest -Uri 'http://ip-api.com/line' -UseBasicParsing | Out-String}"
    echo IP Traced!
)
if "%networkchoice%"=="2" (
    set /p pingaddr="Enter website or IP to ping: "
    ping %pingaddr%
)
if "%networkchoice%"=="3" goto menu
pause
goto networking

:: ============================================
:: [5] EXIT
:: ============================================
:exit
cls
echo =========================================================
echo            THANK YOU FOR USING NAEM'S TOOLBOX!
echo =========================================================
pause
exit
