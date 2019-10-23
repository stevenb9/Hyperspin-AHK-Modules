# Emulator: EMU
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

Run, %executable% "%romPath%%romName%%romExtension%", %emuPath%, Hide

sleep, 1000
Send {Alt Down}{Enter}{Alt Up}
return

ExitApp

CloseProcess:
   Process, Close, %Executable%
return