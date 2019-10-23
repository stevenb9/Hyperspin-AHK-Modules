# Emulator: MAME
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

RunWait, %Executable% 32x -cart "%romPath%%romName%%romExtension%", %EmuPath%, Hide
ExitApp
           
CloseProcess:
   Process, Close, %Executable%
return