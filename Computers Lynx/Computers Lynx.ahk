# Emulator: 
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

MsgBox If the rom wont start, type RUN in the console
Run, %executable% --run "%romPath%%romName%%romExtension%", %emuPath%

Sleep 2000
WinMenuSelectItem, Jynx, , Display, Full screen
Process, WaitClose, %Executable%

ExitApp

CloseProcess:
   Process, Close, %Executable%
return