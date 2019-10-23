# Emulator: WinVICE
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

RunWait, "%executable%" -fullscreen -cartcrt "%romPath%%romName%%romExtension%", %emuPath%
ExitApp

CloseProcess:
      Process, Close, %executable%
return