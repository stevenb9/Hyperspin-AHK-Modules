# Emulator: WinKawak
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

RunWait, %executable% %romName%, %emuPath%
ExitApp

CloseProcess:
   Process, Close, %executable%
return