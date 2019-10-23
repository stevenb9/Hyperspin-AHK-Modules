# Emulator: Dolphin
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

Run, %Executable% -e "%romPath%%romName%%romExtension%" -c, %emuPath%

Process, WaitClose, %Executable%

ExitApp

CloseProcess:
	Process, Close, %Executable%
return 