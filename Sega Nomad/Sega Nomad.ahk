# Emulator: Gens
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

Run, %executable% "%romPath%%romName%%romExtension%", %emuPath%

Sleep, 1000
Send {ALT Down}{ENTER}{ALT Up}

Process, WaitClose, %executable%

ExitApp

CloseProcess:
   Process, Close, %executable%
return