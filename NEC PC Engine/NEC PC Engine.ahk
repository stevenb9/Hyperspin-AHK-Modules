# Emulator: MAME
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

RunWait, %executable% pce -cart "%romPath%%romName%%romExtension%", %emuPath%, Hide
ExitApp

CloseProcess:
   Process, Close, %Executable%
return