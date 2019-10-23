# Emulator: DCAlice
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

Run, %executable% "%romPath%%romName%%romExtension%", %emuPath%

Sleep, 1500
Send {PgUp}
return

Process, WaitClose, %Executable%
ExitApp

CloseProcess:
   Process, Close, %executable%
return