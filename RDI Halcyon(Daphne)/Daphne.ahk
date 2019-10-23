# Emulator: Daphne
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

daphneParams = vldp -fullscreen -x 640 -y 480 -framefile
frameFilePath = %romPath%%romName%%romExtension%
Run, %executable% %romName% %daphneParams% "%frameFilePath%",%emuPath%,
Process, WaitClose, %executable%

ExitApp
  
CloseProcess:
    Process, Close, %Executable%
return