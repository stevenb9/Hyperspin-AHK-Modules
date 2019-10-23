# Emulator: Winuae64
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

RunWait, %executable% -s use_gui=no -mode whdload -game "%romPath%%romName%%romExtension%" , %emuPath%, Hide
ExitApp

CloseProcess:
   Process, Close, %Executable%
return