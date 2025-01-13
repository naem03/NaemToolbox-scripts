@echo off
title Naem's Ultimate Toolbox v3.0
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
echo                  NAEM'S ULTIMATE TOOLBOX
echo =========================================================
echo                [1] System Info
echo                [2] Activation Tools
echo                [3] Software Management
echo                [4] PC Optimization
echo                [5] Networking Tools
echo                [6] Exit
echo =========================================================
set /p choice="Enter your choice [1-6]: "

if "%choice%"=="1" goto sysinfo
if "%choice%"=="2" goto activation
if "%choice%"=="3" goto software
if "%choice%"=="4" goto optimization
if "%choice%"=="5" goto networking
if "%choice%"=="6" goto exit

echo Invalid choice, please try again.
pause
goto menu

:: ============================================
:: [1] SYSTEM INFO
:: ============================================
:sysinfo
cls
echo =========================================================
echo                      SYSTEM INFO
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
echo                  ACTIVATION TOOLS
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
echo               SOFTWARE MANAGEMENT
echo =========================================================
echo                [1] Install Google Chrome
echo                [2] Install WinRAR
echo                [3] Back to Main Menu
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
:: [4] PC OPTIMIZATION
:: ============================================
:optimization
cls
echo =========================================================
echo                  PC OPTIMIZATION
echo =========================================================
echo                [1] Enable Ultimate Performance
echo                [2] RAM Cleaner
echo                [3] Startup Manager
echo                [4] Cleanup Temp Files
echo                [5] Flush DNS Cache
echo                [6] Create System Restore Point
echo                [7] Back to Main Menu
echo =========================================================
set /p optchoice="Enter your choice [1-7]: "

if "%optchoice%"=="1" (
    powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
    echo Ultimate Performance Mode Enabled!
    pause
    goto optimization
)
if "%optchoice%"=="2" (
    powershell -Command "[System.GC]::Collect()"
    echo RAM Cleaned!
    pause
    goto optimization
)
if "%optchoice%"=="3" (
    start ms-settings:startupapps
    echo Opened Startup Manager!
    pause
    goto optimization
)
if "%optchoice%"=="4" (
    del /q /f %temp%\* >nul 2>&1
    del /q /f C:\Windows\Prefetch\* >nul 2>&1
    echo Temp Files Cleaned!
    pause
    goto optimization
)
if "%optchoice%"=="5" (
    ipconfig /flushdns
    echo DNS Cache Flushed!
    pause
    goto optimization
)
if "%optchoice%"=="6" (
    powershell -Command "Checkpoint-Computer -Description 'NaemRestorePoint' -RestorePointType APPLICATION_INSTALL"
    echo System Restore Point Created!
    pause
    goto optimization
)
if "%optchoice%"=="7" goto menu

echo Invalid choice, please try again.
pause
goto optimization

:: ============================================
:: [5] NETWORKING TOOLS
:: ============================================
:networking
cls
echo =========================================================
echo                  NETWORKING TOOLS
echo =========================================================
echo                [1] IP Scanner
echo                [2] Trace Route
echo                [3] Port Scanner
echo                [4] Back to Main Menu
echo =========================================================
set /p netchoice="Enter your choice [1-4]: "

if "%netchoice%"=="1" (
    set /p subnet="Enter Subnet to Scan (e.g., 192.168.1): "
    for /l %%A in (1,1,254) do (
        ping -n 1 %subnet%.%%A | find "Reply" && echo Active: %subnet%.%%A
    )
    pause
    goto networking
)
if "%netchoice%"=="2" (
    set /p tracename="Enter Domain/IP for Trace Route: "
    tracert %tracename%
    pause
    goto networking
)
if "%netchoice%"=="3" (
    powershell -Command "irm 'https://raw.githubusercontent.com/Killeroo/NetworkTests/main/NetRanger.ps1' | iex"
    pause
    goto networking
)
if "%netchoice%"=="4" goto menu

echo Invalid choice, please try again.
pause
goto networking

:: ============================================
:: [6] EXIT
:: ============================================
:exit
cls
echo =========================================================
echo             THANK YOU FOR USING NAEM'S TOOLBOX!
echo =========================================================
pause
exit
