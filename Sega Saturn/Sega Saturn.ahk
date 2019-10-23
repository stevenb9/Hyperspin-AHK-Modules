# Emulator: Yabause
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

RunWait, %executable% -f -iso="%romPath%%romName%%romExtension%" -a, %emuPath%
ExitApp

CloseProcess:
   Process, Close, %Executable%
return