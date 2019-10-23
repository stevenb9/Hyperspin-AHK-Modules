# Emulator: colEM
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

RunWait, "%executable%" -adam "%romPath%%romName%%romExtension%", %emuPath%
ExitApp

CloseProcess:
   Process, Close, %Executable%
Return