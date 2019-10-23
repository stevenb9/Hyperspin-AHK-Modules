# Emulator: WinKawak
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

MsgBox Emulator does not go fullscreen for now, use trackball to maximize emulator.
RunWait, %executable% %romName%, %emuPath%
ExitApp

CloseProcess:
   Process, Close, %Executable%
return