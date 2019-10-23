# Emulator: 
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

if (romExtension = ".cue")
{
    RunWait, %executable% -f "%romPath%%romName% (Track 01).bin", %emuPath%
}
else
{
    RunWait, %executable% -f "%romPath%%romName%%romExtension%", %emuPath%
}

ExitApp

CloseProcess:
   Process, Close, %Executable%
return