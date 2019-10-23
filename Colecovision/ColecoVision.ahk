# Emulator: ColEM
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

Run, %executable% "%romPath%%romName%%romExtension%", %emuPath%

Sleep,2000
Send, {ALT DOWN}{ENTER}{ALT UP}

Process, WaitClose, %Executable%
ExitApp

CloseProcess:
   Process, Close, %Executable%
return