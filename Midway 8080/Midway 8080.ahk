# Emulator: MAME
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

Runwait, %executable% "%romPath%%romName%%romExtension%", %EmuPath%
Process, waitClose, %executable%

ExitApp

CloseProcess:  
	Process, Close, %executable%   
return