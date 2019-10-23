# Emulator: 
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

Runwait, %rompath%%romname%%romextension%
ExitApp

CloseProcess:
    Process, Close, %Executable%
return