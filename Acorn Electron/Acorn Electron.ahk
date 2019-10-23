# Emulator: ElectrEM
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

Run, %executable% "%romPath%%romName%%romExtension%", %emuPath%

Sleep,2500
WinMenuSelectItem, ElectrEm ahk_class SDL_app, , Tools, Full Screen

Process, WaitClose, %Executable%

ExitApp
           
CloseProcess:
  Process, Close, %Executable%
return                                                  