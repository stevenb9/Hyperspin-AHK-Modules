# Emulator: VLCPortable
# By StevenB, stevenbreuls.com
# Downloaded from: Github Link

RunWait, %executable% "%romPath%%romName%%romExtension%", %emuPath%

ExitApp

CloseProcess:
   Process, Close, %Executable%
return