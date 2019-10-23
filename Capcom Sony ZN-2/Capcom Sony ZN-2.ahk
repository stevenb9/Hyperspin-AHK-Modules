# Emulator: Zinc + ZincFE
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

RomNumber := 1

if(romName = "plsmaswd"){
	RomNumber = 13
}
else if(romName = "rvschool"){
		RomNumber = 17
}
else if(romName = "sfex2"){
		RomNumber = 8
}
else if(romName = "sfex2p"){
		RomNumber = 10
}
else if(romName = "shiryu2"){
		RomNumber = 18
}
else if(romName = "techromn"){
		RomNumber = 21
}
else if(romName = "tgmj"){
		RomNumber = 24
}

RunWait, "%executable%" %RomNumber% --use-renderer-cfg-file=renderer.cfg, %emuPath%

ExitApp

CloseProcess:
   Process, Close, %executable%
Return