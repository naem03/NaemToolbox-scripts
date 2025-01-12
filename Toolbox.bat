@echo off
title Naem's Ultimate Toolbox v2.2
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
echo [4] Toolbox Utilities
echo [5] Security
echo [6] Fun Features
echo [7] Exit
echo =========================================================
set /p choice="Enter your choice [1-7]: "

if "%choice%"=="1" goto sysinfo
if "%choice%"=="2" goto activation
if "%choice%"=="3" goto software
if "%choice%"=="4" goto toolbox
if "%choice%"=="5" goto security
if "%choice%"=="6" goto funfeatures
if "%choice%"=="7" goto exit

echo Invalid choice, please try again.
pause
goto menu

:: ============================================
:: [1] SYSTEM INFO & OPTIMIZATION
:: ============================================
:sysinfo
cls
echo =========================================================
echo             SYSTEM INFO & OPTIMIZATION
echo =========================================================
wmic cpu get Name, MaxClockSpeed, NumberOfCores, NumberOfLogicalProcessors
wmic path win32_videocontroller get Name, DriverVersion, AdapterRAM
wmic memorychip get BankLabel, Capacity, Speed, Manufacturer
wmic logicaldisk get DeviceID, FreeSpace, Size, VolumeName
wmic baseboard get Manufacturer, Product
pause
goto menu

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
    start /wait msiexec /i "https://www.rarlab.com/rar/winrar-x64-612.exe" /
