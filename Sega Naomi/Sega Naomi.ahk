# Emulator: Demul
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

RunWait, "%executable%" -run=naomi -rom="%romName%", %emuPath%
ExitApp

CloseProcess:
   Process, Close, %Executable%
Return