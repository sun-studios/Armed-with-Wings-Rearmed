# Armed with Wings: Rearmed
Source code for Armed with Wings: Rearmed

It's a Flash game that's compiled to desktop using AIR. Best version to use for this project is Adobe Animate CC 2018.
For any questions, hit me up on discord: https://discord.gg/FxyFT7QRJE

**Getting Started**
1. Get Animate CC (preferable Animate CC 2018. Adobe won't give you that version, but you can still get it... just google)
2. If not using 2018, go get the Adobe AIR SDK from Harmon: https://airsdk.harman.com/
    - Open Animate CC. Top Toolbar>Help>Manage Adobe AIR SDK
    - Click the + button and location your unzipped AIR SDK folder you downloaded from air.sdk.harman.com
3. Get Flash Develop from https://www.flashdevelop.org/
4. Get 32bit (x86) JRE SDK 1.7: https://www.oracle.com/java/technologies/javase/javase7-archive-downloads.html 
5. Open Armed with Wings Rearmed/Armed with Wings Rearmed.xfl in Animate CC
6. Open project.as3proj in Flash Develop

**Publish Settings**
1. Hit Ctrl+Shift+f12 to open publish settings
2. Click the folder icon next to *output* name
3. Create a new folder somewhere called 'export' - this is where the swf will be exported to
4. Click the spanner icon next to *Target: AIR XX.XX for Desktop*
5. Click the folder next to *Output File* - select the same export folder. This is where the exe will be exported to.
6. Close these panels

**Test**

1. Hit CTRL+ENTER in Animate CC to Test Movie
2. If Animate says 'Not enough memory', it will prompt you to edit a file called jvm.ini.
    - Change -Xmx256m to -Xmx1024m in the jvm.ini

Hopefully the game appears

**To compile to Windows**
1. In Animate CC, press Ctrl+Shift+f12 to open the publish settings
2. Click the spanner icon next to *Target: AIR XX.XX for Desktop*
3. Click the Signature tab
4. Create a Certificate and give it a password
5. Hit publish
6. the game exe should be outputted into the /bin folder.

**Fonts**
Berlin Sans FB Demi
FORCED SQUARE: https://www.dafont.com/forced-square.font
Furmanite: https://www.dafont.com/furmanite.font
Mars: https://www.dafont.com/mars.font
RETURN TO CASTLE: https://www.dafont.com/return-to-castle.font
Thinman: https://www.dafont.com/thinman.font
