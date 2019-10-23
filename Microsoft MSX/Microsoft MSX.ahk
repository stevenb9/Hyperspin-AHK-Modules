# Emulator: BlueMSX
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

Runwait, %executable% /rom1 "%romPath%%romName%%romExtension%" -auto -fullscreen, %EmuPath%
Process, waitClose, %executable%

ExitApp

CloseProcess:  
	Process, Close, %executable%   
return