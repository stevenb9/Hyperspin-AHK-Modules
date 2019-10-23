# Emulator: CPS-3
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

Run, %executable% %romName%, %emuPath%
Process, WaitClose, %executable%
ExitApp

CloseProcess:
   Process, Close, %Executable%
return