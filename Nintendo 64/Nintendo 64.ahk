# Emulator: Project64
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

Run, %executable% "%romPath%%romName%%romExtension%", %emuPath%, Hide
Process, WaitClose, %Executable%

ExitApp
           
CloseProcess:
  Process, Close, %Executable%
return                                                  