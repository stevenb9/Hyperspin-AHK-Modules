# Emulator: Zinc + ZincFE
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

RomNumber := 1

if(romName = "ts2"){
	RomNumber = 22
}
else if(romName = "starglad"){
		RomNumber = 1
}
else if(romName = "sfex"){
		RomNumber = 3
}
else if(romName = "sfexp"){
		RomNumber = 5
}

RunWait, "%executable%" %RomNumber% --use-renderer-cfg-file=renderer.cfg, %emuPath%

ExitApp

CloseProcess:
   Process, Close, %executable%
Return