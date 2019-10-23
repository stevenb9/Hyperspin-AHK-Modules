# Emulator: MAME
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

Run, %executable% %romName%, %emuPath%
ExitApp

CloseProcess:
	WinClose, Ahk_class %exeWinClass%
return