# Emulator: spudACE
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

RunWait, %executable% "%romPath%%romName%%romExtension%", %emuPath%

Sleep, 1000
WinMenuSelectItem, ahk_class Jupiter Ace Emulator, ,View, Full Screen

ExitApp

CloseProcess:
   Process, Close, %Executable%
return