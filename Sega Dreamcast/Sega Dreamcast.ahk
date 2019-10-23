# Emulator: nullDC
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

MsgBox %romPath%%romName%\%romName%%romExtension%
MsgBox test
RunWait, %executable% -config ImageReader:DefaultImage="%romPath%%romName%\%romName%%romExtension%", %emuPath%

ExitApp

CloseProcess:
   Process, Close, %executable%
return