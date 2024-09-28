cd ..
copy Client\content\fonts mscuts\client\content\fonts

copy Client\content\music mscuts\client\content\music

copy Client\content\sky mscuts\client\content\sky

copy Client\content\sounds mscuts\client\content\sounds

copy Client\content\textures mscuts\client\content\textures

copy Client\CharacterChanger mscuts\client\CharacterChanger

copy Client\CharacterChanger\PlayerModels mscuts\client\CharacterChanger\PlayerModels

copy mscuts\BROWSER\rbxbrowser.exe mscuts\client

copy Client\Styles mscuts\client\Styles

copy Client mscuts\client\

cd mscuts
move client C:\

start makeshortcuts.bat

timeout 1 >nul
exit