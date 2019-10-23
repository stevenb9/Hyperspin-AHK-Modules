# Emulator: MAME
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

RunWait, %executable% -pce.cdbios syscard3.pce "%romPath%%romName%%romExtension%" , %emuPath%, Hide
ExitApp

CloseProcess:
   Process, Close, %Executable%
return