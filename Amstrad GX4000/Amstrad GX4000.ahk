# Emulator: WinAPE + Tempest Loader
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

Run, %executable% "%romPath%%romName%%romExtension%" /A, %emuPath% 

Sleep, 00
Send {F10 Down}{F10 Up}

Process, WaitClose, %executable%

ExitApp

CloseProcess:
	Send {ALT Down}{F10}{ALT Up}
   Process, Close, %Executable%
return