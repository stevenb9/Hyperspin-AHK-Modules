# Emulator: 
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

Run, %executable% "%romPath%%romName%%romExtension%", %emuPath%, 
Process, WaitClose, %Executable%

ExitApp

CloseProcess:
   Process, Close, %Executable%
return