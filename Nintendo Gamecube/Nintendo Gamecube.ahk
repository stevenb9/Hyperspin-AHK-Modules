# Emulator: Dolphin
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

RunWait, %executable% /b /e "%romPath%%romName%%romExtension%", %emuPath%
ExitApp
     
CloseProcess:
	Process, Close, %Executable%
return