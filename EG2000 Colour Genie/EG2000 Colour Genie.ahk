# Emulator: Genious
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

Run, "%executable%" "%romPath%%romName%%romExtension%", %emuPath%

Sleep 2000
Send, {ALT Down}{ENTER}{ALT up}
Process, WaitClose, %executable%

ExitApp

CloseProcess:
      Process, Close, %executable%
return