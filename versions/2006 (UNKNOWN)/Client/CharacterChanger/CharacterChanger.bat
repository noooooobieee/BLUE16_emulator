@echo off
cls
title Character Changer - Disclaimer and intro
goto disclaimer
:disclaimer
cls
echo Welcome to RBXLModders ROBLOX Character Changer for his
echo 2006 Client!
echo -----------------------------------------------------------
echo Feel free to change the text inside but credit me first.
echo -----------------------------------------------------------
echo DISCLAIMER : This will only work on Solo! (unless you are a dev that can make it work on multiplayer)
echo -----------------------------------------------------------
echo Press any key to continue to the character changer...
pause >nul
goto choose

:choose
cls
title Character Changer - Main Menu
echo 1. Roblox Noob With Gray Torso
echo 2. Roblox Noob
echo 3. Roblox Noob with Pastel Blue Torso
echo 4. Robloxian with Pink Shirt and
echo Light pink pants
echo 5. Roblox Noob with Pink Shirt
echo 6. Robloxian With brown skin a
echo Gray Shirt and Yellow Green pants
echo 7. Robloxian With brown skin and
echo Yellow Green shirt and pants
echo 8. Roblox Noob with gray shirt
echo Pink skin and Yellow Green Pants
echo.
set /p option=Choose one... (Example: "6"): 
if %option% == 1 goto option1
if %option% == 2 goto option2
if %option% == 3 goto option3
if %option% == 4 goto option4
if %option% == 5 goto option5
if %option% == 6 goto option6
if %option% == 7 goto option7
if %option% == 8 goto option8

:option1
set successtext=Roblox Noob With Gray Torso
cls
cd ..

copy CharacterChanger\PlayerModels\1.rbxm CharacterChanger\Temp
rename CharacterChanger\Temp\1.rbxm character.rbxm
del content\character.rbxm
move CharacterChanger\Temp\character.rbxm content\fonts
goto Success

:option2
set successtext=Roblox Noob
cls
cd ..

copy CharacterChanger\PlayerModels\2.rbxm CharacterChanger\Temp
rename CharacterChanger\Temp\2.rbxm character.rbxm
del content\character.rbxm
move CharacterChanger\Temp\character.rbxm content\fonts
goto Success

:option3
set successtext=Roblox Noob with Pastel Blue Torso
cls
cd ..

copy CharacterChanger\PlayerModels\3.rbxm CharacterChanger\Temp
rename CharacterChanger\Temp\3.rbxm character.rbxm
del content\character.rbxm
move CharacterChanger\Temp\character.rbxm content\fonts
goto Success

:option4
set successtext=Robloxian with Pink Shirt and Light pink pants
cls
cd ..

copy CharacterChanger\PlayerModels\4.rbxm CharacterChanger\Temp
rename CharacterChanger\Temp\4.rbxm character.rbxm
del content\character.rbxm
move CharacterChanger\Temp\character.rbxm content\fonts
goto Success

:option5
set successtext=Roblox Noob with Pink Shirt
cls
cd ..

copy CharacterChanger\PlayerModels\5.rbxm CharacterChanger\Temp
rename CharacterChanger\Temp\5.rbxm character.rbxm
del content\character.rbxm
move CharacterChanger\Temp\character.rbxm content\fonts
goto Success


:option6
set successtext=Robloxian With brown skin a Gray Shirt and Yellow Green pants
cls
cd ..

copy CharacterChanger\PlayerModels\6.rbxm CharacterChanger\Temp
rename CharacterChanger\Temp\6.rbxm character.rbxm
del content\character.rbxm
move CharacterChanger\Temp\character.rbxm content\fonts
goto Success


:option7
set successtext=Robloxian With brown skin and Yellow Green shirt and pants
cls
cd ..

copy CharacterChanger\PlayerModels\7.rbxm CharacterChanger\Temp
rename CharacterChanger\Temp\7.rbxm character.rbxm
del content\character.rbxm
move CharacterChanger\Temp\character.rbxm content\fonts
goto Success


:option8
set successtext=Roblox Noob with gray shirt Pink skin and Yellow Green Pants
cls
cd ..

copy CharacterChanger\PlayerModels\8.rbxm CharacterChanger\Temp
rename CharacterChanger\Temp\8.rbxm character.rbxm
del content\character.rbxm
move CharacterChanger\Temp\character.rbxm content\fonts
goto Success


:Success
set closingtime=5
cls
echo Successfully changed your character to a %successtext%!
echo Closing in %closingtime% Seconds...
timeout 1 >nul
cls
set closingtime=4
echo Successfully changed your character to a %successtext%!
echo Closing in %closingtime% Seconds...
timeout 1 >nul
cls
set closingtime=3
echo Successfully changed your character to a %successtext%!
echo Closing in %closingtime% Seconds...
timeout 1 >nul
cls
set closingtime=2
echo Successfully changed your character to a %successtext%!
echo Closing in %closingtime% Seconds...
timeout 1 >nul
cls
set closingtime=1
echo Successfully changed your character to a %successtext%!
echo Closing in %closingtime% Seconds...
timeout 1 >nul
cls
set closingtime=0
echo Successfully changed your character to a %successtext%!
echo Closing in %closingtime% Seconds...
timeout 1 >nul
exit