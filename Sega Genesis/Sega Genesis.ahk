# Emulator: KEGA Fusion
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

RunWait, %Executable% -gen -fullscreen "%romPath%%romName%%romExtension%", %EmuPath%, Hide 
ExitApp
           
CloseProcess:
   Process, Close, %Executable%
return