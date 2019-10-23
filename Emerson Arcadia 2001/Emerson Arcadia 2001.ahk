# Emulator: WA
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

Run, %executable% -f "%romPath%%romName%%romExtension%", %emuPath%, UseErrorLevel

if (ErrorLevel = 0){
    Process, waitClose, %executable%
}else{
    MsgBox, 48, Error,Failed to run executable,6
}
sleep, 1000
Process, Close, hypersplash.exe
ExitApp
           
CloseProcess:
   Process, Close, %Executable%
return