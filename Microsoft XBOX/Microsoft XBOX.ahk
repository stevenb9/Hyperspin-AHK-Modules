# Emulator: 
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

Runwait, %executable% -cpu pentium3 -machine xbox, short_animation, bootrom=ncpx_rom.bin -m 64 -bios xbox-3944.bin -drive file=xbox_hdd.qcow2, index=0, media=disk, locked=on -drive index=1n ledua=cdrom, file="%romPath%%romName%%romExtension%", %EmuPath%
ExitApp

CloseProcess:  
	Process, Close, %executable%   
return