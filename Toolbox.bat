@echo off
title Naem's Ultimate Toolbox v1.1
color 0A

:menu
cls
echo =========================================================
echo                 NAEM'S ULTIMATE TOOLBOX
echo =========================================================
echo [1] System Info 
echo [2] Activation Tools
echo [3] Install Basic Software
echo [4] Info
echo [5] Toolbox
echo [6] Exit
echo =========================================================
set /p choice="Enter your choice [1-6]: "

if "%choice%"=="1" goto sysinfo
if "%choice%"=="2" goto activation
if "%choice%"=="3" goto install
if "%choice%"=="4" goto info
if "%choice%"=="5" goto toolbox
if "%choice%"=="6" goto exit

echo Invalid choice, please try again.
pause
goto menu

:sysinfo
cls
echo =========================================================
echo             SYSTEM INFO & OPTIMIZATION MENU
echo =========================================================
wmic cpu get Name, MaxClockSpeed, NumberOfCores, NumberOfLogicalProcessors
wmic path win32_videocontroller get Name, DriverVersion, AdapterRAM
wmic memorychip get BankLabel, Capacity, Speed, Manufacturer
wmic logicaldisk get DeviceID, FreeSpace, Size, VolumeName
pause
goto menu

:activation
cls
echo =========================================================
echo            ACTIVATING WINDOWS & OFFICE
echo =========================================================
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {irm 'https://get.activated.win' | iex}"
echo Activation Completed!
pause
goto menu

:install
cls
echo =========================================================
echo             INSTALLING BASIC SOFTWARE
echo =========================================================
echo Installing Google Chrome...
start /wait msiexec /i "https://dl.google.com/chrome/install/standalone/GoogleChromeStandaloneEnterprise64.msi" /quiet /norestart
echo Google Chrome Installed!
echo Installing WinRAR...
start /wait msiexec /i "https://www.rarlab.com/rar/winrar-x64-612.exe" /quiet /norestart
echo WinRAR Installed!
pause
goto menu

:info
cls
echo =========================================================
echo                    ABOUT THIS TOOL
echo =========================================================
echo - Developer: Naem
echo - Version: 1.1
echo - Features:
echo   * System Info
echo   * Activation Tools
echo   * Software Installer
echo   * Toolbox with Advanced Features and Fun!
echo =========================================================
pause
goto menu

:toolbox
cls
echo =========================================================
echo                    TOOLBOX MENU
echo =========================================================
echo [1] Troubleshooting Tools
echo [2] Cleanup Master
echo [3] Benchmark Tools
echo [4] Security Lockdown
echo [5] System Restore
echo [6] Remote Management
echo [7] Fun Features
echo [8] Back to Main Menu
echo =========================================================
set /p toolboxchoice="Enter your choice [1-8]: "

if "%toolboxchoice%"=="1" goto troubleshoot
if "%toolboxchoice%"=="2" goto cleanup
if "%toolboxchoice%"=="3" goto benchmark
if "%toolboxchoice%"=="4" goto lockdown
if "%toolboxchoice%"=="5" goto restore
if "%toolboxchoice%"=="6" goto remotemanage
if "%toolboxchoice%"=="7" goto funfeatures
if "%toolboxchoice%"=="8" goto menu

:troubleshoot
cls
echo =========================================================
echo              ONE-CLICK TROUBLESHOOTING
echo =========================================================
ipconfig /flushdns
echo DNS Cache Cleared!
pause
goto toolbox

:cleanup
cls
echo =========================================================
echo                 SYSTEM CLEANUP MASTER
echo =========================================================
del /q /f %temp%\* >nul 2>&1
del /q /f C:\Windows\Prefetch\* >nul 2>&1
echo Cleanup Completed!
pause
goto toolbox

:benchmark
cls
echo =========================================================
echo                 BENCHMARK TOOLS
echo =========================================================
echo Suggestion: Download Cinebench or CrystalDiskMark for advanced benchmarking.
pause
goto toolbox

:lockdown
cls
echo =========================================================
echo                SECURITY LOCKDOWN MODE
echo =========================================================
reg add HKLM\SYSTEM\CurrentControlSet\Services\USBSTOR /v Start /t REG_DWORD /d 4 /f
echo USB Ports Disabled for Security.
pause
goto toolbox

:restore
cls
echo =========================================================
echo                 SYSTEM RESTORE
echo =========================================================
powershell -Command "Checkpoint-Computer -Description 'NaemRestorePoint' -RestorePointType APPLICATION_INSTALL"
echo Restore Point Created!
pause
goto toolbox

:remotemanage
cls
echo =========================================================
echo                REMOTE MANAGEMENT
echo =========================================================
echo Not implemented yet. Coming soon!
pause
goto toolbox

:funfeatures
cls
echo =========================================================
echo                   FUN FEATURES MENU
echo =========================================================
echo [1] Random Jokes
echo [2] Motivational Quotes
echo [3] Fake Virus Prank
echo [4] Fake Hack Mode
echo [5] Back to Toolbox
echo =========================================================
set /p funchoice="Enter your choice [1-5]: "

if "%funchoice%"=="1" goto jokes
if "%funchoice%"=="2" goto quotes
if "%funchoice%"=="3" goto virusprank
if "%funchoice%"=="4" goto hackmode
if "%funchoice%"=="5" goto toolbox

:jokes
cls
set /a num=%random% %% 3
if "%num%"=="0" (
    echo Joke: Kenapa komputer tak pernah lapar? Sebab dia ada banyak byte!
)
if "%num%"=="1" (
    echo Joke: Kenapa mouse komputer selalu happy? Sebab dia click dengan kawan!
)
if "%num%"=="2" (
    echo Joke: Apa yang software cakap masa nak keluar? Shutdown je la aku, bosan dah...
)
pause
goto funfeatures

:quotes
cls
set /a num=%random% %% 3
if "%num%"=="0" (
    echo Quote: "Buat kerja macam kau tengah training jadi CEO!"
)
if "%num%"=="1" (
    echo Quote: "Kalau gagal sekali, cuba sampai berjaya. Jangan give up!"
)
if "%num%"=="2" (
    echo Quote: "Hari ni susah, esok susah, lusa lega. Sabar bro!"
)
pause
goto funfeatures

:virusprank
cls
echo =========================================================
echo             FAKE VIRUS PRANK ACTIVATED
echo =========================================================
echo System Overload Detected...
ping -n 2 localhost >nul
echo Critical Error! System will shut down...
ping -n 2 localhost >nul
echo Haha! Just kidding bro, relax.
pause
goto funfeatures

:hackmode
cls
echo =========================================================
echo             FAKE HACK MODE INITIATED
echo =========================================================
echo Connecting to Secure Server...
ping -n 2 localhost >nul
echo Sending Payload...
ping -n 2 localhost >nul
echo Access Granted! Just kidding, chill bro!
pause
goto funfeatures

:exit
cls
echo =========================================================
echo             THANK YOU FOR USING NAEM'S TOOLBOX!
echo =========================================================
pause
exit
