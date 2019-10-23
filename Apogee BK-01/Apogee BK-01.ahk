MEmu = Universal Emulator
MEmuV =  1.01					
MURL = http://bashkiria-2m.narod.ru/index/files/0-11
MAuthor = craiganderson
MVersion = 1.2
MCRC = 
iCRC =
MID =
MSystem = "Apogee","BK 0011","Lviv PC-01","Mikrosha","Vector-06C","Partner"

;----------------------------------------------------------------------------
;Notes: Enable/Disable Fullscreen in HLHQ System Settings
;It appears that Hyperspin needs to be run as an administrator for the BlockUserInputTime to function properly.
;Because Hyperspin is being run as an administrator, xpadder requires to be run as an administrator as well.
;BlockUserInputTime: When Running Lviv PC-01: This emulator automatically types commands on the screen to load games. User input can interfere with this. BlockUserInputTimedefines how long user input is blocked in order to allow the emulator to load the game. The default setting is 13 seconds (13000). Increase this setting if your system is having difficulty. It can be changed in HLHQ SYSTEM settings
;----------------------------------------------------------------------------

StartModule()
BezelGUI()
FadeInStart()

BlockInput, On ;It appears that Hyperspin and xpadder needs to be run as an administrator for this command to function. This is most important for "Lviv PC-01."

BlockUserInputTime = 3000; default for all systems
If (systemName = "Lviv PC-01")
{	BlockUserInputTime = 13000;default for "Lviv PC-01"
}

Fullscreen := "false"
settingsFile := modulePath . "\" . systemName . ".ini"
BlockUserInputTime := IniReadCheck(settingsFile, "Settings", "BlockUserInputTime","true",,1)
Fullscreen := IniReadCheck(settingsFile, "Settings", "Fullscreen","true",,1)
;disableHideTitleBar := true
;disableHideToggleMenu := true
;disableHideBorder := true
BezelStart()

7z(romPath, romName, romExtension, 7zExtractPath)

Run(executable . " """ . romPath . "\" . romName . romExtension . """  ", emuPath)

SetTitleMatchMode, RegEx
SetTitleMatchMode, Fast

WinWait("ahk_class Afx:400000:b:10003:6")
WinWaitActive("ahk_class Afx:400000:b:10003:6")

Sleep,1000
SetTitleMatchMode, 2
ControlClick, ToolbarWindow321,,,,, x74 y12

If Fullscreen = true
{	Sleep,1000
	;WinMenuSelectItem, ahk_class Afx:400000:b:10003:6, , 2&, 9&
	SendInput, {Alt down}{Enter down}{Alt up}{Enter up}
}



;Sleep, 500
;WinMenuSelectItem, ahk_class Afx:400000:b:10003:6, , 2&, Toolbar
;Sleep, 500
;WinMenuSelectItem, ahk_class Afx:400000:b:10003:6, , 2&, Status Bar

;DllCall("SetMenu", uint, WinActive( "A" ), uint, 0) ; Removes the MenuBar (thank you djvj)
;WinSet, Style, -0xC00000, A

Sleep, BlockUserInputTime
BlockInput, OFF




BezelDraw()
FadeInExit()
Process("WaitClose", executable)
7zCleanUp()
BezelExit()
FadeOutExit()
ExitModule()

CloseProcess:
	FadeOutStart()
   	Process, Close, EMU.exe  
Return

