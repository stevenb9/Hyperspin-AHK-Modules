# Emulator: Demul
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

RunWait, %executable% -run=awave -rom="%romName%", %emuPath%
ExitApp

CloseProcess:
   Process, Close, %Executable%
return