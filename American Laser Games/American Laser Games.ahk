# Emulator: Daphne Single
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

daphneParams = -fullscreen -x 1920 -y 1080
Run, %executable% singe vldp %daphneParams% -framefile singe\%romName%\%romName%.txt -script singe\%romName%\%romName%.singe,%emuPath%
Process, WaitClose, %executable%

ExitApp
           
CloseProcess:
   Process, Close, %Executable%
return