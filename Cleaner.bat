@echo off
title Cleaner+ Command Line
COLOR 30
cls
echo 2024 Cleaner+ Command Line
echo Starting this application will licence you to use this software.
echo Editing this software is forbidden.
echo Please note that we recommend using an admin account.
echo This software is still in its alpha stage! There may be bugs and occasional crashes.
pause
:menu
cls
echo.
echo 1. Delete temp files
echo 2. Save this for auto startup
echo 3. Exit
choice /c 123 /m "Please select an option:"
if %errorlevel% equ 1 goto delete
if %errorlevel% equ 2 goto start
if %errorlevel% equ 3 goto end
goto menu
:delete
REM This script will delete all files and folders in the appdata\local\temp and appdata\roaming\temp directories for the current user
cd /D %USERPROFILE%\appdata\local\temp
del /f /q *.*
for /d %%D in (*) do rd /s /q "%%D"
cd /D %APPDATA%\temp
del /f /q *.*
for /d %%D in (*) do rd /s /q "%%D"
REM This script will also delete all files and folders in the Windows\Temp directory
cd /D %SystemRoot%\Temp
del /f /q *.*
for /d %%D in (*) do rd /s /q "%%D"
echo Temp files deleted successfully.
goto menu
:start
REM This script will autorun the cleaner every time you boot your PC
cd %USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
set "filename=new.bat"
echo REM This script will delete all files and folders in the appdata\local\temp directory for the current user >> "%filename%"
echo cd /D %USERPROFILE%\appdata\local\temp >> "%filename%"
echo del /f /q *.* >> "%filename%"
echo for /d %%D in (*) do rd /s /q "%%D" >> "%filename%"
echo REM This script will also delete all files and folders in the appdata\roaming\temp directory for the current user >> "%filename%"
echo cd /D %APPDATA%\temp >> "%filename%"
echo del /f /q *.* >> "%filename%"
echo for /d %%D in (*) do rd /s /q "%%D" >> "%filename%"
pause
goto menu
:end
cls
echo Exiting the script.
pause
exit
