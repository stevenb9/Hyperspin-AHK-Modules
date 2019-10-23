# Emulator: DCVG5K
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

Run, %executable% "%romPath%%romName%%romExtension%", %emuPath%

Sleep, 3000 ; increase If CLOAD is not appearing in the emu window or some just some letters
Send, {PGUP}
Sleep, 1000 ; increase If CLOAD is not appearing in the emu window or some just some letters
MsgBox Type "CLOAD" to load the tape.

Process, WaitClose, %executable%
ExitApp

CloseProcess:
   Process, Close, %executable%
return