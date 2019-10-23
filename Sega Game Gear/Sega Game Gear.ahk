# Emulator: KEGA Fusion
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

RunWait, %Executable% -auto -sms "%romPath%%romName%%romExtension%", %EmuPath%
ExitApp
           
CloseProcess:
   Process, Close, %Executable%
return