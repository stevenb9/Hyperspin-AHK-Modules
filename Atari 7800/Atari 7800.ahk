# Emulator: MAME
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

RunWait, "%executable%" a7800 -cart "%romPath%%romName%%romExtension%", %emuPath%, Hide
ExitApp

CloseProcess:
   Process, Close, %Executable%
Return