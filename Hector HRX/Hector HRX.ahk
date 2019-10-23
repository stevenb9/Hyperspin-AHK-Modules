# Emulator: DCHector
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

Run, %executable% "%romPath%%romName%%romExtension%", %emuPath%, Hide
Send {ALT Down}{ENTER}{ALT Up}

Sleep, 2000
Send {5}
Sleep, 2000
Send {1}

Process, WaitClose, %Executable%
ExitApp

CloseProcess:
   Process, Close, %Executable%
return