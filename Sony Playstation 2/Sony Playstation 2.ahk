# Emulator: CPSS2
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

Run, %executable% "%romPath%%romName%%romExtension%" --fullscreen, %emuPath%
Process, WaitClose, %executable%

ExitApp

CloseProcess:
	Process, Close, %executable%
return