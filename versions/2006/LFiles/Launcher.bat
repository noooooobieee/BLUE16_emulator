@echo off
cls
title Launcher ----- CODED BY RBXLMODDERS ON GITHUB -----
goto launcher

:launcher
cls
cmdMenuSel f870 "Launch ROBLOX" "Change Character" "Enable Dev Mode" "Disable Dev Mode" "Exit" "Install"
if %ERRORLEVEL% == 1 goto launch
if %ERRORLEVEL% == 2 goto cChar
if %ERRORLEVEL% == 3 goto eDM
if %ERRORLEVEL% == 4 goto dDM
if %ERRORLEVEL% == 5 exit
if %ERRORLEVEL% == 6 goto Install

:launch
cd ..
start Client\Roblox.exe
exit

:cChar
cd ..
cd CharacterChanger
start CharacterChanger.bat
exit

:eDM
cd ..
cd Client
start DevMode.bat
exit

:dDM
cd ..
cd Client
start DisableDevMode.bat
exit

:RBLXBrowser
cd ..
cd Client
start Roblox.exe -browser
exit

:Install
cd ..
cd mscuts
start createdirs.bat
exit
