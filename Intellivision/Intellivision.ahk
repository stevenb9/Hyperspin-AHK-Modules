# Emulator: MAME
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

RunWait, "%Executable%" intv -cart "%romPath%%romName%%romExtension%", %emuPath%
ExitApp
           
CloseProcess:
   Process, Close, %Executable%
return