# Emulator: GeePee32
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

MsgBox Fullscreen Broken, Manually Maximize emulator. Press 2x S to load the game
Run, %executable% smc "%romPath%%romName%%romExtension%" run, %emuPath%

Sleep, 4000
Send {S}
Sleep, 4000
Send {S}

Process, WaitClose, %executable%
ExitApp

CloseProcess:
   Process, Close, %executable%
return