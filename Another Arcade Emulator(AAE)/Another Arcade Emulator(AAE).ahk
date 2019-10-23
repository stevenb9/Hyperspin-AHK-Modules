# Emulator: aaeu2
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

Runwait, %executable% %romName%, %emuPath%, Hide UseErrorLevel
ExitApp

CloseProcess:
   Process, Close, %Executable%
return