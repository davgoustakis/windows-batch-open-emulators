@echo off
cd /d %LOCALAPPDATA%\Android\Sdk\emulator
setlocal EnableDelayedExpansion
set n=0
echo List of the available emulators:
echo.

for /f %%i in ('emulator -list-avds') do (
   set AVD_LIST[!n!]=%%i
   set /A n+=1
   echo   !n!. %%i
)
echo.
:loop
set /p "emulatorIndex=Choose an emulator to start (number): "
set /a "emulatorIndex=%emulatorIndex%-1"
if not defined AVD_LIST[%emulatorIndex%] (
   echo Not a valid number or input...
   echo.
   goto loop
)
echo.
echo !AVD_LIST[%emulatorIndex%]! is starting...
emulator @!AVD_LIST[%emulatorIndex%]!
