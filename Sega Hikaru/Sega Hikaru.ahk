# Emulator: Demul
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

RunWait, %executable% -run=hikaru -rom="%romName%", %emuPath%

Process, WaitClose, %Executable%

ExitApp

CloseProcess:
	Process, Close, %Executable%
return 