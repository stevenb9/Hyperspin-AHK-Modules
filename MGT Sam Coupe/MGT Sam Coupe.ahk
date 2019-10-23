# Emulator: SimCoupe
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

Run, "%executable%" "%romPath%%romName%%romExtension%", %emuPath%

Sleep, 3000
Send {B}{O}{O}{T}

Process, WaitClose, %executable%

ExitApp
           
CloseProcess:
	Process, Close, %executable%
return