# Emulator: BlueMSX
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

Runwait, %executable% /diska "%romPath%%romName%%romExtension%" -auto -fullscreen, %EmuPath%
ExitApp

CloseProcess:  
	Process, Close, %executable%   
return