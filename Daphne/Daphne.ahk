# Emulator: Daphne
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

Run, %executable% %romName% vldp -fullscreen -x 1920 -y 1080 -framefile "d:\Roms\Daphne\vldp\%romName%\%romName%.txt",%emuPath%,
Process, WaitClose, %executable%
ExitApp
           
CloseProcess:
   Process, Close, %executable%
return