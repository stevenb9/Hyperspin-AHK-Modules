# Emulator: MAME
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

RunWait, "%executable%" pegasusm -cart "%romPath%%romName%%romExtension%" -verbose, %emuPath%
ExitApp

CloseProcess:
   Process, Close, %Executable%
Return