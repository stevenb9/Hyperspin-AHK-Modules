# Emulator: MAME
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

RunWait, %executable% gamepock -cart "%romPath%%romName%%romExtension%", %emuPath%
ExitApp

CloseProcess:
   Process, Close, %Executable%
return