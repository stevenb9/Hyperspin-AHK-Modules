# Emulator: VBjin
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

MsgBox Fullscreen broken in emulator, Maximize manually
Run, %executable% "%romPath%%romName%%romExtension%", %emuPath%

sleep, 3000
Send {F12}

Process, WaitClose, %Executable%

ExitApp

CloseProcess:
   Process, Close, %Executable%
return