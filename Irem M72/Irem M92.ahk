MEmu := "HOSCARCONH"
MEmuV := "v0.166"
MURL = 
MAuthor := ["HOSCARCONH"]
MVersion := "2.3.1"
MCRC = 
iCRC = 
mId = 
MSystem := ["Irem M92"]
;----------------------------------------------------------------------------
; Notes:
; This module now includes everything from the legacy MAME and MESS modules, but combined to match the merge of the 2 emulators that occured on version 0.162.
;
; Exit fade will only work correctly if you don't have Esc, the default MAME exit key,  as your exit key. If you use Esc, turn off the ExitScreen
; This module will set your rom paths on the fly via CLI, but you must make sure the RLUI module setting for this module "MAME_BIOS_Path" is correctly set. It defaults to your roms subfolder where MAME.exe is found.
; This module assumes you have bios zip in your MAME "roms" directory, which might be different than your actual roms directory, for each system you need this module for. All tested systems listed below
; If MAME has a problem reading the bios zips, try archving them with "no compression"
; This site can help a ton with details for the various systems supported: http://www.progettoemma.net/mess/index.html
; You may get a black screen or MAME may close w/o notice if you do not have a bios rom for your system when one is needed.
; If you use bezel, it is recommended to set the module bezel mode to normal, and go to your MAME.ini file, on your emulator folder, and choose these options: artwork_crop 1, use_backdrops 1, use_overlays 1, use_bezels 0 
;
; Command Line Options - http://easyemu.mameworld.info/mameguide/mameguide-options.html
; High Scores DO NOT SAVE when cheats are enabled!
; HLSL Documentation: http://mamedev.org/source/docs/hlsl.txt.html
; If you use MAME for AAE, create a vector.ini in mame's ini subfolder and paste these HLSL settings in there: http://www.mameworld.info/ubbthreads/showflat.php?Cat=&Number=309968&page=&view=&sb=5&o=&vc=1
;
; Be aware that several systems will require a BIOS zip with their roms inside. They all come bundled in the MAME set so make sure you add your MAME roms folder to the 
; roms path for that system. If you have doubts about their filenames check the mTypeVar module variable content.
;
; Following systems will also require some specific files to operate properly:
; APF Imagination Machine - apfimag (tape games), apfm1000 (cart games)
; Camputers Lynx - lynx64k, lynx96k, lynx128k
; Coleco ADAM - adam, adam_ddp, adam_fdc, adam_kb, adam_prn, adam_spi
; NEC PC Engine-CD - "Super CD-ROM2 System V3.0 (J).pce" [262,656 bytes] (placed in the roms subfolder in the emuPath)
; NEC TurboGrafx-CD - "Super CD-ROM2 System V3.01 (U).pce" [262,144 bytes] (placed in the roms subfolder in the emuPath)
; Sega CD - segacd, megacd, megacd2j (megacd2j seems to be more compatible over megacdj)
; Sony PlayStation - psa, pse, psj, psu
;
; Tape Control:
; MAME tape/cassette emulation is terrible because normally it means you need to manually start and stop the tapes yourself so it's highly suggested that you use another emulator for such systems.
; Tape control commands are accessible through the UI, press tab and then select Tape Control and you can start/stop the loaded tape from there.
; The following hotkeys can also be used:
; F2 - Start Tape
; Left Shift + F2 - Stop Tape
; Insert - While held, runs the game with throttling disabled and with the maximum frameskip. Useful to speedup the long tape loading process.
;
; Be aware that tape games are normally used on PC systems therefore it's likely that full keyboard emulation is enabled which means that you'll need to disable it in order to use any of the above 
; hotkeys. To disable it press the Scroll Lock key, press it again to enable it back.
;
; 7z Support:
; Make sure you have 7z disabled for all MAME Arcade systems. Their roms are supposed to be archived, if you have 7z enabled then your games will fail to load. It's 
; fine to enable 7z to non-arcade systems.
;
; Custom Configuration Files:
; If you want to use custom configuration files (.cfg files) for some games you will need to store them inside your MAME cfg folder using the following structure:
; cfg\mame_system_name\database_rom_name\mame_system_name.cfg
; An example of a game that requires specific settings is ICBM Attack for the Bally Astrocade, in this case special cfg file should be:
; cfg\astrocde\I.C.B.M. Attack (USA) (Unl)\astrocde.cfg
;
; Ini Files:
; Module will set most settings through command line which will override any settings you might have on your MAME ini files. Everything else will be read from 
; those. MAME supports a hierarchical ini file structure and will load settings from several ini files following a specific order:
;- mame.ini
;- <mymame>.ini (i.e. if MAME was renamed mame060.exe, MAME parses mame060.ini here)
;- debug.ini (if the debugger is enabled)
;- <parent>.ini (for clones only, may be called recursively)
;- <gamename>.ini
;- vertical.ini (for games with vertical monitor orientation)
;- horizont.ini (for games with horizontal monitor orientation)
;- vector.ini (for vector games only)
;- <driver>.ini (based on the source filename of the driver)
;
; The settings in the later ini's override those in the earlier ini's.
; 
; It's highly recommended that you set skipchecks to 'Rom Only" for MAME otherwise RocketLauncher won't be able to launch several games due 
; to the way MAME roms are packaged. This will be even more noticeable for those using merged sets.
;
; Bally Astrocade:
; ICBM requires a soft reset (even on the real hardware) to launch. You can read about it here: http://www.ballyalley.com/ballyalley/articles/Playing_ICBM_Attack_Using_MESS.pdf
; Other games might require this as well, you can enable this in the module's settings so the machine is reset automatically on launch, otherwise you need to press F3 to start the game.
; Also ICBM Attack uses different controls then the rest of the games. Make sure you follow the procedure explained above under "Custom Configuration Files" to create such file.
;
; GCE Vectrex:
; Requires a vectrex.lay and a png overlay for each game. These all need to be placed in the MAME\artwork\vectrex folder.
; You can download all these pngs and the lay file in my ftp folder. You need to use the HyperList XML to match the pngs.
;
; Jupiter Ace:
; Set mame to 48k ram
;
; Magnavox Odyssey 2:
; Euro games should use the videopac bios instead of the odyssey2 one or you'll get some timing issues.
; Use the systemName ini file in the folder with this module for this, example:
; [Moto-Crash (France)]
; Bios=videopac
;
; RCA Studio 2:
; Most of the games require you to press a button to start the game, like 1 or 2 (refer to the game's manual).
; The game screen will be black until you do.
;
; Texas Instruments TI 99/4A:
; This system requires full keyboard emulation to work properly
; Split cart dumps are not supported since MESS .145 so you'll have to convert them to RPK format or use an earlier version of MESS (and a different module)
; You can check how to convert split cart dumps to RPK here:
; http://www.ninerpedia.org/index.php/MESS_multicart_system
; For floppy games make sure you have a RPK dump of an extended basic rom on your roms folder. It should be named "extended_basic.rpk"
; This system requires you to use a MAME build with Direct Input enabled in order to auto start the games. Most games will require commands to be typed to start 
; and it's normally too complex to be able to do it through the -ab switch so SendCommand is used instead which means a Direct Input enabled MAME version is required.
;
; Bezels:
; Module settings control whether RocketLauncher or MAME bezels are shown
; In the bezel normal mode only RocketLauncher Bezels will be show and the MAME use_bezels option will be forced disbaled
; In the bezel layout mode, RocketLauncher Bezels will be drawn only when you do not have a layout file on your MAME folders for the current game
;
; ServoStik:
; The module will automatically control any connected ServoStiks found on the system.
; It does this by reading the xml info from MAME. If that XML info has directional info at 4 or less, 4-way mode will be enabled. All others get 8-way mode.
;
; Per game controller types:
; MAME allows you to change the controller type for each game by using slot devices. Slot devices are highly customizable and vary greatly from system to 
; system so to avoid adding a huge complexity to the module this must be done through the Parameters settings.
; Slot devices are stored in the MAME ini file you are using, so the best way to find the command line you need to use is to start your game set the slot devices 
; through the MAME UI (Press tab while in MAME) exit and then open the MAME ini file and search for a section named SLOT DEVICES.
; This is an example for Atari 2600 for a game using wheel controllers on both joy ports:
; #
; # SLOT DEVICES
; #
; joyport1     wheel
; joyport2     wheel
; The suggested method is to set the desired controllers you want to use by default in the Module Global Settings, in this case under the Atari 2600 tab you would 
; set Parameters=-joyport1 joy -joyport2 joy
; And then for specific games do the same under Module Specific Settings for that system, if a game requires the wheel controller you'd set 
; Parameters=-joyport1 wheel -joyport2 wheel
;
; Another option is to set the default values in the MAME ini file and make sure you also set writeconfig to 0.
; Swapping slot devices wipes out SYSTEM custom configs on the unplugged controllers, so to avoid any customised controls getting erased everytime you change slot devices, 
; ensure you set your controls in the main MAME config file (MAME.ini), not the system one (ex. Atari 2600.ini).
;
; Linking/NetPlay:
; The module will automatically set correct network ports for linked games.
; Up to 8 players on the same PC are supported. Multiple copies of MAME will be launched.
; Placement of the screens are automatic but can be controlled in RocketLauncherUI MAME module settings. Windowed mode is required when more than one copy of mame is launched and is set automatically.
; Each player will use a different cfg and nvram folder in your MAME folder. Player 1 will always use .\cfg and .\nvram.
; Players 2 through 8 will use .\cfg2, .\cfg3, etc and .\nvram2, .\nvram3, etc
; These folders and cfg/nvram files will be automatically created for you on launch so you do not need to create them manually.
; Global inputs is automatically turned on for you but it is your job to setup individual controls for each instance. MAME only supports raw-input in this mode however.
; Over a LAN/WAN connection only 2 players are supported due to the way the ports are designated, it's impossible to automate port allocation because there is no 1 server where all hosts connect to.
; Default starting port for the Master is 15111 and consecutively goes up from there upto 15119 for 8 players. You can change the default starting port in the module settings if it conflicts with used ports on your network.
; There are other network related settings in the module settings to assist with starting IPs and connectivity, so check them out as well.
; 
; NVRAM Automation for linked games:
; When launching linked games on the same pc NVRAM settings are automatically set for you so each player will be unique.
; For instance, in Virtua Racing, Player 1 is red, player 2 is blue, player 3 is yellow, etc.
; To do this, some other options are also set automatically for you as well, like region, difficulty, countr, course, etc
; I set these to defaults, but prefer USA region. If you do not like these, you will have to disable NVRAM automation in the module settings in RocketLauncherUI.
;
; Additional Link info that may be of some importance:
; The original Model-1 has a max Bandwidth of 6 MBit/s (TOTX173/TORX173).
; One Board sends about 20 KByte/s.
; So bandwidth CLIENTSIDE is like...
; 2 Boards - 20 KByte/s inbound and 20 KByte/s outbound.
; 3 Boards - 40 KByte/s inbound and 20 KByte/s outbound.
; 4 Boards - 60 KByte/s inbound and 20 KByte/s outbound.
; etc.
; Some good info on Linking: http://www.mameworld.info/ubbthreads/showflat.php?Cat=&Number=297577&page=0
; also http://forum.arcadecontrols.com/index.php/topic,130136.msg1331485.html
;----------------------------------------------------------------------------
StartModule()
BezelGUI()

; This object controls how the module reacts to different systems. MAME can play a lot of systems, but needs to know what system you want to run, so this module has to adapt.
mTypeVar := "
	( LTrim
	Aamber Pegasus|pegasus
	Acorn Electron|electron
	Amstrad CPC|cpc664
	Amstrad GX4000|gx4000
	APF Imagination Machine|apfimag
	Apple II|apple2ep
	Apple IIGS|apple2gs
	Applied Technology MicroBee|mbeeic
	Atari 8-Bit|a800
	Atari 2600|a2600
	Atari 5200|a5200
	Atari 7800|a7800
	Atari Jaguar|jaguar
	Atari Lynx|lynx
	Bally Astrocade|astrocde
	Bandai Super Vision 8000|sv8000
	Bandai WonderSwan|wswan
	Bandai WonderSwan Color|wscolor
	Bit Corporation Gamate|gamate
	Camputers Lynx|lynx128k
	Casio PV-1000|pv1000
	Casio PV-2000|pv2000
	Coleco ADAM|adam
	ColecoVision|coleco
	Commodore 64|c64
	Commodore MAX Machine|vic10
	Creatronic Mega Duck|megaduck
	EACA EG2000 Colour Genie|cgenie
	Emerson Arcadia 2001|arcadia
	Entex Adventure Vision|advision
	Epoch Game Pocket Computer|gamepock
	Epoch Super Cassette Vision|scv
	Exidy Sorcerer|sorcerer
	Fairchild Channel F|channelf
	Fujitsu FM-7|fmnew7
	Funtech Super Acan|supracan
	GamePark 32|gp32
	GCE Vectrex|vectrex
	Hartung Game Master|gmaster
	Interton VC 4000|vc4000
	JungleTac Sport Vii|vii
	Jupiter Ace|jupace
	Magnavox Odyssey 2|odyssey2
	Matra & Hachette Alice|alice32
	Mattel Aquarius|aquarius
	Mattel Intellivision|intv
	MGT Sam Coupe|samcoupe
	Milton Bradley MicroVision|microvsn
	NEC PC-8801|pc8801
	NEC PC Engine|pce
	NEC PC Engine-CD|pce
	NEC SuperGrafx|sgx
	NEC TurboGrafx-16|tg16
	NEC TurboGrafx-CD|tg16
	Nintendo 64|n64
	Nintendo 64DD|n64dd
	Nintendo Entertainment System|nes
	Nintendo Famicom|famicom
	Nintendo Famicom Disk System|fds
	Nintendo Game Boy|gameboy
	Nintendo Game Boy Advance|gba
	Nintendo Game Boy Color|gbcolor
	Nintendo Pokemon Mini|pokemini
	Nintendo Satellaview|snes
	Nintendo Super Famicom|snes
	Nintendo Super Game Boy|supergb
	Nintendo Virtual Boy|vboy
	Othello Multivision|omv1000
	Philips CD-i|cdimono1
	Philips Videopac Plus G7400|g7400
	Philips VG 5000|vg5k
	RCA Studio II|studio2
	Sega 32X|32x
	Sega CD|segacd
	Sega Game Gear|gamegear
	Sega Genesis|genesis
	Sega Master System|sms
	Sega Mega Drive|megadriv
	Sega Pico|pico
	Sega Saturn|saturn
	Sega SC-3000|sc3000
	Sega SG-1000|sg1000
	Sega VMU|svmu
	Sharp X1|x1turbo40
	Sinclair ZX81|zx81
	SNK Neo Geo AES|aes
	SNK Neo Geo CD|neocdz
	SNK Neo Geo Pocket|ngp
	SNK Neo Geo Pocket Color|ngpc
	Sony PlayStation|psx
	Sony PocketStation|pockstat
	Sord M5|m5
	Soundic Victory MPT-02|mpt02
	Super Nintendo Entertainment System|snes
	Tandy TRS-80 Color Computer|coco3
	Texas Instruments TI 99-4A|ti99_4a
	Tiger Game.com|gamecom
	Tomy Tutor|tutor
	VTech CreatiVision|crvision
	Watara Supervision|svision
	)"
mType := Object()
Loop, Parse, mTypeVar, `n, `r
{
	obj := {}
	Loop, Parse, A_LoopField, |
		If (A_Index = 1)
			obj.System := A_LoopField
		Else	; 2
			obj.mameID := A_LoopField
	mType.Insert(obj["System"], obj)
}
Log("Module - Finished building the " . MEmu . " object",4)
; For easier use throughout the module
mameSystem := mType[systemName].System
mameID := mType[systemName].mameID

If !mameSystem {
	Log("Module - """ . systemName . """ is not a known console or computer system. Defaulting to MAME's Arcade mode for the remainder of this " . MEmu . " module.",2)
	mameSystem := systemName
	mameID := "MAME"
}

settingsFile := modulePath . "\" . moduleName . ".ini"
Fullscreen := IniReadCheck(settingsFile, "Settings", "Fullscreen","true",,1)		; Set fullscreen mode
legacyMode := IniReadCheck(settingsFile, "Settings|" . systemName . "|" . romName, "LegacyMode","false",,1)
mameBiosPath := IniReadCheck(settingsFile, "Settings", "MAME_BIOS_Path", emuPath . "\roms",,1)
mameBiosPath := GetFullName(mameBiosPath)
Videomode := IniReadCheck(settingsFile, "Settings", "Videomode","d3d",,1)	; Choices are gdi,ddraw,d3d. If left blank, MAME uses d3d by default
pauseMethod := IniReadCheck(settingsFile, "Settings", "PauseMethod",1,,1)	; set the pause method that works better on your machine (preferred methods 1 and 2) 1 = Win7 and Win8 OK - Problems with Win XP, 2 = preferred method for WinXP - Problems in Win7, 3 and 4 = same as 1 and 2, 5 = only use If you have a direct input version of mame, 6 = suspend mame process method, it could crash mame in some computers
bilinearFilter := IniReadCheck(settingsFile, "Settings|" . mameSystem, "BilinearFilter","false",,1)
hlsl := IniReadCheck(settingsFile, "Settings|" . mameSystem . "|" . romName, "HLSL","false",,1)
glsl := IniReadCheck(settingsFile, "Settings|" . mameSystem . "|" . romName, "GLSL","false",,1)
bezelMode := IniReadCheck(settingsFile, "Settings|" . systemName . "|" . romName, "BezelMode","layout",,1)	; "layout" or "normal"
verticalRotationMode := IniReadCheck(settingsFile, "Settings|" . mameSystem . "|" . romName, "VerticalRotationMode","none",,1)
cheatMode := IniReadCheck(settingsFile, "Settings", "CheatMode","false",,1)
cheatModeKey := IniReadCheck(settingsFile, "Settings", "CheatModeKey",A_Space,,1)	; user defined key to be held down before launching a mame rom.
UseSoftwareList := IniReadCheck(settingsFile, mameSystem . "|" . romName, "UseSoftwareList","false",,1)
sysStaticParams := IniReadCheck(settingsFile, mameSystem, "StaticParameters", A_Space,,1)
sysParams := IniReadCheck(settingsFile, mameSystem, "Parameters", A_Space,,1)
romParams := IniReadCheck(settingsFile, romName, "Parameters", sysParams,,1)
mameRomName := IniReadCheck(settingsFile, romName, "MameRomName", A_Space,,1)
autosave := IniReadCheck(settingsFile, systemName . "|" . romName, "Autosave", "false",,1)
volume := IniReadCheck(settingsFile, "Settings|" . systemName . "|" . romName, "Volume",,,1)
Artwork_Crop := IniReadCheck(settingsFile, mameSystem . "|" . romName, "Artwork_Crop", "true",,1)
Use_Bezels := IniReadCheck(settingsFile, mameSystem . "|" . romName, "Use_Bezels", "false",,1)
Use_Overlays := IniReadCheck(settingsFile, mameSystem . "|" . romName, "Use_Overlays", "true",,1)
Use_Backdrops := IniReadCheck(settingsFile, mameSystem . "|" . romName, "Use_Backdrops", "true",,1)
Use_Cpanels := IniReadCheck(settingsFile, mameSystem . "|" . romName, "Use_Cpanels", "false",,1)
Use_Marquees := IniReadCheck(settingsFile, mameSystem . "|" . romName, "Use_Marquees", "false",,1)
inipath := IniReadCheck(settingsFile, mameSystem, "IniPath", "",,1)
hashpath := IniReadCheck(settingsFile, mameSystem, "HashPath", "",,1)

; Loop, 8
	; car%A_Index%Color := IniReadCheck(settingsFile, romName, "Car_" . A_Index . "_Color","",,1)

enableLinkPlay := IniReadCheck(settingsFile, "Link/Network|" . romName, "Enable_Link_Play", "false",,1)
networkSession := ""
If (enableLinkPlay != "false") {
	Log("Module - Link/Network Multi-Player is an available option for " . romName,4)
	getWANIP := IniReadCheck(settingsFile, "Link/Network", "Get_WAN_IP","false",,1)
	myIP := If getWANIP = "true" ? GetPublicIP() : "127.0.0.1"	; use local ip by default if user does not want to get the WAN IP as MAME needs this for linked games
	networkPlayers := enableLinkPlay	; Max amount of networkable players
	localLink := 1	; Tell Multiplayer menu to enable menu option for local linking

	enableNVRAMAutomation := IniReadCheck(settingsFile, "Link/Network|" . romName, "Enable_NVRAM_Automation","true",,1)
	maxPlayersPerMonitor := IniReadCheck(settingsFile, "Link/Network|" . romName, "Max_Players_Per_monitor","1|1|1|1|1|1|1|1",,1)
	splitScreen2PlayersMode := IniReadCheck(settingsFile, "Link/Network|" . romName, "SplitScreen_2_Players","Horizontal",,1) ;horizontal or vertical
	splitScreen3PlayersMode := IniReadCheck(settingsFile, "Link/Network|" . romName, "SplitScreen_3_Players","P1top",,1) ; For Player1 screen to be on left: P1left. For Player1 screen to be on top: P1top. For Player1 screen to be on bottom: P1bottom. For Player1 screen to be on right: P1right.
	localPort := IniReadCheck(settingsFile, "Link/Network", "Local_Port","15111",,1)

	defaultServerIP := IniReadCheck(settingsFile, "Link/Network", "Default_Server_IP", myIP,,1)
	defaultServerPort := IniReadCheck(settingsFile, "Link/Network", "Default_Server_Port","15111",,1)
	lastIP := IniReadCheck(settingsFile, "Link/Network", "Last_IP", defaultServerIP,,1)	; also known as the Remote IP in mame. Does not need to be on the ISD
	lastPort := IniReadCheck(settingsFile, "Link/Network", "Last_Port", defaultServerPort,,1)	; also known as the Remote Port in mame. Does not need to be on the ISD

	MultiplayerMenu(lastIP, lastPort, networkType, networkPlayers,,,,,,localLink,"ipAndPort")

	;MultiPlayer Menu Result
	; If !(networkType)
		; MsgBox, % "Single Player Game"
	; Else If (networkType="localLink")
		; MsgBox, % "Local Link selected with the number of players equal to: " . networkPlayers
	; Else If (networkType="server")
		; MsgBox, % "WAN IP Address=" . networkIP . " | LAN IP Address=" . localIP[1,2] . " | Port=" . networkPort . " | networkPlayers=" . networkPlayers . " | networkRequiresSetup=" . networkRequiresSetup 
	; Else If (networkType="client")
		; MsgBox, % "NetworkIP=" . networkIP . " | Port Number=" . networkPort . " | networkRequiresSetup=" . networkRequiresSetup

	If networkSession {
		Log("Module - Using a Network for " . romName,4)
		multiPlayerObj := Object()	; initialize object to store the multiplayer options
		If (networkType="localLink") {
			Log("Module - Setting remote host to 127.0.0.1 to support local link mode as it is running on this PC.")
			linkEnabledGame := 1
			If networkPlayers > 1
			{	Log("Module - Local link mode was selected and " . networkPlayers . " sessions will be launched.")
				fullscreen := "false"	; must turn off fullscreen if running multiple MAMEs on the same machine
				Loop % networkPlayers {
					multiPlayerObj[A_Index,"Player"] := A_Index
					multiPlayerObj[A_Index,"CfgDir"] := " -cfg_directory cfg" . (If A_Index = 1 ? "" : A_Index)
					multiPlayerObj[A_Index,"NvramDir"] := " -nvram_directory nvram" . (If A_Index = 1 ? "" : A_Index)
					If (A_Index = 1) {	; Player 1
						initialLocalPort := localPort	; must be stored for last player
						multiPlayerObj[A_Index,"LocalHost"] := " -comm_localhost 0.0.0.0"
						multiPlayerObj[A_Index,"LocalPort"] := " -comm_localport " . localPort
						localPort++
						multiPlayerObj[A_Index,"RemotePort"] := " -comm_remoteport " . localPort
					} Else {	; Players 2+
						multiPlayerObj[A_Index,"LocalPort"] := " -comm_localport " . localPort
						localPort++
						multiPlayerObj[A_Index,"RemoteHost"] := " -comm_remotehost 127.0.0.1"
						multiPlayerObj[A_Index,"RemotePort"] := " -comm_remoteport " . (If A_Index = networkPlayers ? initialLocalPort : localPort)	; must set remote port to first port on last player
					}

					; msgbox % "Player: " . multiPlayerObj[A_Index]["Player"] . "`nLocalHost: " . multiPlayerObj[A_Index]["LocalHost"] . "`nLocalPort: " . multiPlayerObj[A_Index]["LocalPort"] . "`nRemoteHost: " . multiPlayerObj[A_Index]["RemoteHost"] . "`nRemotePort: " . multiPlayerObj[A_Index]["RemotePort"] . "`nCfgDir: " . multiPlayerObj[A_Index]["CfgDir"] . "`nNvramDir: " . multiPlayerObj[A_Index]["NvramDir"]
				}
			} Else
				Log("Module - Local link mode was selected but user only chose 1 player. Launch will be a normal session.")
		} Else If (networkType = "client") {
			Log("Module - Remote host is running on another PC, module will use remote link mode.")
			IniWrite, %networkIP%, %settingsFile%, Link/Network, Last_IP	; Save last used IP and Port for quicker launching next time
			IniWrite, %networkPort%, %settingsFile%, Link/Network, Last_Port
			linkType := "Slave"
			networkPlayers := 1
			multiPlayerObj[1,"Player"] := 1
			multiPlayerObj[1,"CfgDir"] := " -cfg_directory cfg"
			multiPlayerObj[1,"NvramDir"] := " -nvram_directory nvram"
			multiPlayerObj[1,"LocalHost"] := " -comm_localhost 0.0.0.0"		; don't really need to set this but just in case
			multiPlayerObj[1,"LocalPort"] := " -comm_localport " . localPort
			multiPlayerObj[1,"RemoteHost"] := " -comm_remotehost " . networkIP
			multiPlayerObj[1,"RemotePort"] := " -comm_remoteport " . networkPort
		} Else {	; server
			Log("Module - This PC is acting as the host, telling mame to listen for incoming connections on port: " . localPort)
			IniWrite, %networkIP%, %settingsFile%, Link/Network, Last_IP	; Save last used IP and Port for quicker launching next time
			IniWrite, %networkPort%, %settingsFile%, Link/Network, Last_Port
			linkType := "Master"
			networkPlayers := 1
			multiPlayerObj[1,"Player"] := 1
			multiPlayerObj[1,"CfgDir"] := " -cfg_directory cfg"
			multiPlayerObj[1,"NvramDir"] := " -nvram_directory nvram"
			multiPlayerObj[1,"LocalHost"] := " -comm_localhost 0.0.0.0"		; don't really need to set this but just in case
			multiPlayerObj[1,"LocalPort"] := " -comm_localport " . networkPort
			multiPlayerObj[1,"RemoteHost"] := " -comm_remotehost " . networkIP
			multiPlayerObj[1,"RemotePort"] := " -comm_remoteport " . networkPort
		}
		Log("Module - Starting a network session using the IP """ . networkIP . """ and PORT """ . networkPort . """",4)
	} Else {
		Log("Module - User chose Single Player mode for this session",4)
	}
}

FadeInStart()

;Read settings from system name ini file
sysSettingsFile := modulePath . "\" . mameSystem . ".ini"
If FileExist(sysSettingsFile) {
	romParams := IniReadCheck(sysSettingsFile, romName, "Parameters", romParams,,1)
	hlsl := IniReadCheck(sysSettingsFile, romName, "HLSL",hlsl,,1)
	glsl := IniReadCheck(sysSettingsFile, romName, "GLSL",glsl,,1)
	Artwork_Crop := IniReadCheck(sysSettingsFile, romName, "Artwork_Crop", Artwork_Crop,,1)
	Use_Bezels := IniReadCheck(sysSettingsFile, romName, "Use_Bezels", Use_Bezels,,1)
	Use_Overlays := IniReadCheck(sysSettingsFile, romName, "Use_Overlays", Use_Overlays,,1)
	Use_Backdrops := IniReadCheck(sysSettingsFile, romName, "Use_Backdrops", Use_Backdrops,,1)
	Use_Cpanels := IniReadCheck(sysSettingsFile, romName, "Use_Cpanels", Use_Cpanels,,1)
	Use_Marquees := IniReadCheck(sysSettingsFile, romName, "Use_Marquees", Use_Marquees,,1)
	UseSoftwareList := IniReadCheck(sysSettingsFile, romName, "UseSoftwareList", UseSoftwareList,,1)
}

If inipath
	inipath := AbsoluteFromRelative(EmuPath, inipath)
If hashpath
	hashpath := AbsoluteFromRelative(EmuPath, hashpath)

artworkCrop := If (Artwork_Crop = "true") ? " -artwork_crop" : " -noartwork_crop"
useBezels := If (Use_Bezels = "true") ? " -use_bezels" : " -nouse_bezels"
useOverlays := If (Use_Overlays = "true") ? " -use_overlays" : " -nouse_overlays"
useBackdrops := If (Use_Backdrops = "true") ? " -use_backdrops" : " -nouse_backdrops"
useCpanels := If (Use_Cpanels = "true") ? " -use_cpanels" : " -nouse_cpanels"
useMarquees := If (Use_Marquees = "true") ? " -use_marquees" : " -nouse_marquees"
autosave := If autosave = "true"  ? " -autosave" : ""
volume := If volume != ""  ? " -volume " . volume : ""
inipath := If inipath != "" ? " -inipath """ . inipath . """" : ""
hashpath := If hashpath != "" ? " -hashpath """ . hashpath . """" : ""

If (verticalRotationMode = "none")
	verticalRotationMode := ""

; Process mame's ListXML for certain features
If (bezelEnabled = "true" || servoStikEnabled = "auto" || verticalRotationMode) {
	ListXMLObject := Object()
	ListXMLObject := ListXMLInfo(If mameRomName ? mameRomName : romName)
	Angle := ListXMLObject["Angle"].Value
	If (bezelEnabled = "true") {
		If (networkPlayers > 1) {
			useBezels := " -nouse_bezels"   ; force disabling MAME built-in bezels
			BezelStart(networkPlayers)	
		} Else {
			If (bezelMode = "layout"){
				BezelStart("layout",ListXMLObject["Parent"].Value,Angle,romName)
			} Else { ;bezel mode = normal
				useBezels := " -nouse_bezels"   ; force disabling MAME built-in bezels
				BezelStart(,,Angle)
			}
		}
	}
	If (servoStikEnabled = "auto") {
		ServoStik(If ListXMLObject["Ways"].Value <= 4 ? 4 : 8)	; If "ways" in the xml is set to 4 or less, the servo will go into 4-way mode, else 8-way mode will be enabled
	}
	If (verticalRotationMode && Angle) {
		Log("Setting rotation mode to " . verticalRotationMode . " - Game's angle is " . Angle)
		If (verticalRotationMode = "original")
			verticalRotationMode := " -norotate"
		Else If (verticalRotationMode = "right")
			verticalRotationMode := " -ror"
		Else If (verticalRotationMode = "left")
			verticalRotationMode := " -rol"
		Else
			verticalRotationMode := ""
	}
	Else
		verticalRotationMode := ""
}

winstate := If (Fullscreen = "true") ? "Hide UseErrorLevel" : "UseErrorLevel"
fullscreenParam := If (Fullscreen = "true") ? " -nowindow" : " -window"

hideEmuObj := Object(dialogOpen . " ahk_class ConsoleWindowClass",0,"ahk_class MAMEDebugWindow",0,"ahk_class MAMEOutput",0,"ahk_class MAME",1)	;Hide_Emu will hide these windows. 0 = will never unhide, 1 = will unhide later
7z(romPath, romName, romExtension, sevenZExtractPath)

; Get MAME version from executable, this is needed since some CLI switches are not available in older MAME versions
exeAtrib := FileGetVersionInfo_AW(EmuPath . "\" . executable, "FileVersion|ProductVersion", "|")
Loop, Parse, exeAtrib, |%A_Tab%, %A_Space%
	A_Index & 1 ? ( _ := A_LoopField ) : ( %_% := A_LoopField )
If ProductVersion
	StringRight, MAMEVersion, ProductVersion, StrLen(ProductVersion) - 2
Log("Module - Detected MAME Product Version from '" . EmuPath . "\" . executable . "' is " . MAMEVersion)

If (videomode = "opengl") {
	hlsl := " -nohlsl_enable"
	If (MAMEVersion > 159)
		glsl := If glsl = "true" ? " -gl_glsl" : (If glsl = "ini" ? "" : " -nogl_glsl")
	Else
		glsl := ""
} Else {
	hlsl := If hlsl = "true" ? " -hlsl_enable" : (If hlsl = "ini" ? "" : " -nohlsl_enable")
	If (MAMEVersion > 159)
		glsl := If videomode = "ini" ? "" : " -nogl_glsl"
	Else
		glsl := ""
		
	If (videomode = "ini")
		videomode := ""
}
videomode := If (Videomode != "" ) ? " -video " . videomode : ""

param1 := " -cart """ . romPath . "\" . romName . romExtension . """"	; default param1 used for launching most systems.
If romExtension = .txt	; This can be applied to all systems
	param1 := ""

If (mameID = "apfimag")	; APF Imagination Machine
	If (romExtension != ".tap")
		mameID := "apfm1000"	; cart games for APF Imagination Machine require a different bios to be loaded

If (UseSoftwareList != "true")
{	; Now that we know the system we are loading, determine if we use an ini assocated with that system for custom game configs a user might need. Then load the configs associated to that game.
	If mameID in ti99_4a,aes,apple2gs,electron,mbeeic,odyssey2,astrocde,samcoupe,vic10,cpc664	; these systems will use an ini to store game specific settings
	{	
		mameSysINI := CheckFileMAME(modulePath . "\" . mameSystem . ".ini")	; create the ini if it does not exist

		If (mameID = "ti99_4a")	; Texas Instruments TI 99-4A
		{
			ExpansionCartLocation := IniReadCheck(sysSettingsFile, "Settings", "ExpansionCartLocation", romPath . "\System",,1)
			ExpansionCartLocation := GetFullName(ExpansionCartLocation)
			CommandWaitOffset := IniReadCheck(sysSettingsFile, "Settings", "CommandWaitOffset", 0,,1)

			ExpansionCart := IniReadCheck(sysSettingsFile, romName, "Expansion_Cart","extended_basic.rpk",,1)	; user can specify a rom specific cart instead of the default basic one
			Command := IniReadCheck(sysSettingsFile, romName, "Command", "",,1)

			; Now set the parameters to send to MAME
			If (romExtension = ".dsk")	; Expansion Disk
			{
				; If using the mainCart , send expansionLocation to MAME. This will require DirectInput to be enabled on the MAME build! Else we are loading a Disk game
				param1 := " -nat -gromport single -cart1"
				param2 := " """ . ExpansionCartLocation . "\" . ExpansionCart . """"
				param3 := " -peb:slot2 32kmem -peb:slot3 speech -peb:slot6 tirs232 -peb:slot8 hfdc"
				param4 := " -flop1"
				param5 := " """ . romPath . "\" . romName . romExtension . """"				
				If InStr(romName, "(Disk")
				{
					Sleep, 50
					If (romTable.MaxIndex() = 2)
					{
						param4 := " -flop1 " . " """ . romTable[1,1] . """"
						param5 := " -flop2 " . " """ . romTable[2,1] . """"
					}
				}	
			} Else If (romExtension = ".rpk")	; Cart Game (RPK Format)
				param1 := " -nat -gromport single -cart1", param2:=" """ . romPath . "\" . romName . romExtension . """", param3:=" -peb:slot3 speech" ;-cart will also work here
			param6 := " -ui_active" ;Enable partial keyboard mode at startup
		} Else If (mameID = "aes")	; SNK Neo Geo AES
		{	biosRegion := IniReadCheck(mameSysINI, romName, "BIOS_Region","asia",,1)
			param1 := " -bios " . biosRegion	; can also be japan, but the asian one has english menus for most games
			param2 := " -cart " . romName
		}Else If (mameID = "apple2gs")	; Apple IIGS
		{	externalOS := IniReadCheck(mameSysINI, romName, "External_OS","false",,1)
			2gsSystemFile := "System6.2mg"	;For games without OS included, always force this name and error out if not found
			multipartTable := CreateRomTable(multipartTable)

			If (externalOS = "true")
			{	CheckFile(romPath . "\" . 2gsSystemFile)
				param1 := " -flop3", param2:=" """ . romPath . "\" . 2gsSystemFile . """", param3:=" -flop4", param4:=" """ . romPath . "\" . romName . romExtension . """"
			} Else {
				param1 := " -flop3", param2:=" """ . romPath . "\" . romName . romExtension . """"
				If (multipartTable.MaxIndex() > 1)
					param3 := " -flop4", param4 := " """ . multipartTable[2,1] . """"
			}
			param5 := " -ui_active" ;Enable partial keyboard mode at startup
		}Else If (mameID = "electron") ; Acorn Electron
		{	AutoBootDelay := IniReadCheck(mameSysINI, "Settings", "AutoBootDelay","2",,1)	; Read delay from config.
			AutoBootDelay := " -autoboot_delay " . AutoBootDelay
			If (romExtension = ".bin")
				mediaDeviceType := "cart"
			Else	; any other format
				mediaDeviceType := "cass"
			param1 := " -" . mediaDeviceType . " """ . romPath . "\" . romName . romExtension . """ -autoboot_command ""chain""""""""""""\n""" . AutoBootDelay . ""
		}Else If (mameID = "sc3000") ; Sega SC-3000
		{	AutoBootDelay := IniReadCheck(mameSysINI, "Settings", "AutoBootDelay","2",,1)	; Read delay from config.
			AutoBootDelay := " -autoboot_delay " . AutoBootDelay
			If romExtension In .bin,.sg,.sc
				mediaDeviceType := "cart"
			Else	; any other format
				mediaDeviceType := "cass"
			param1 := " -" . mediaDeviceType . " """ . romPath . "\" . romName . romExtension . """ -autoboot_command ""chain""""""""""""\n""" . AutoBootDelay . ""
		}Else If (mameID = "c64") ; Commodore 64
		{	AutoBootDelay := IniReadCheck(mameSysINI, "Settings", "AutoBootDelay","2",,1)	; Read delay from config.
			AutoBootDelay := " -autoboot_delay " . AutoBootDelay
			If romExtension In .d64,.g64,.g41,.d77,.d88,.1dd,.dfi,.imd,.ipf,.mfi,.mfm,.td0,.cqm,.cqi,.dsk
				mediaDeviceType := "flop1"
			Else If romExtension In .wav,.tap
				mediaDeviceType := "cass1"
			Else If romExtension In .80,.a0,.e0,.crt
				mediaDeviceType := "cart1"
			Else If romExtension In .p00,.prg,.t64
				mediaDeviceType := "quik1"
			param1 := " -" . mediaDeviceType . " """ . romPath . "\" . romName . romExtension . """ -autoboot_command ""chain""""""""""""\n""" . AutoBootDelay . ""
		}Else If mameID = mbeeic ; Applied Technology MicroBee
		{	microbeeModel := IniReadCheck(mameSysINI, romName, "MicroBee_Model","mbeeic",,1)
			If microbeeModel not in mbee,mbeeic,mbeepc,mbeepc85,mbee56
				ScriptError("This is not a known MicroBee model value: " . microbeeModel)
			Else If (microbeeModel != "mbeeic")
				mameID := microbeeModel
			If romExtension in .mwb,.com,.bee
				mediaDeviceType := "quik1"
			Else If romExtension in .wav,.tap
				mediaDeviceType := "cass"
			Else If romExtension in .rom
				mediaDeviceType := "cart"
			Else If romExtension in .dsk
				mediaDeviceType := "flop1"
			Else	; .bin format
				mediaDeviceType := "quik2"
			param1 := " -" . mediaDeviceType . " """ . romPath . "\" . romName . romExtension . """"
		}Else If (mameID = "odyssey2")	; Magnavox Odyssey 2
		{	param2 := " -ui_active" ;Enable partial keyboard mode at startup
			If romName not contains (USA
				mameID := "videopac"
		}Else If (mameID = "astrocde") ; Bally Astrocade
		{
			BlueRAMBasicRom := IniReadCheck(mameSysINI, "Settings", "BlueRAMBasicRom","Blue RAM Basic v1.1 (USA).bin",,1)	; Blue RAM Basic rom
			RequiresReset := IniReadCheck(mameSysINI, romname, "RequiresReset","false",,1)	; Check if game requires a reset

			BlueRAMBasicRomPath := romPath . "\" . BlueRAMBasicRom
			If (romExtension = ".script") {
				;Will require blue ram basic
				If !FileExist(BlueRAMBasicRomPath) {
					;Blue RAM Basic games might be in their own sub-folders since they have several files, so let's try to find the Blue RAM cart in the parent folder as well
					SplitPath,romPath,,romBasePath
					BlueRAMBasicRomPath := CheckFile(romBasePath . "\" . BlueRAMBasicRom, "Couldn't find " . BlueRAMBasicRom . " on any of these paths:" . romBasePath . "|" . romPath)
				}

				scriptFile := romPath . "\" . romName . romExtension
				param1 := " -cart """ . BlueRAMBasicRomPath . """"

				;Replace rompath variable in script
				FileRead, scriptData, %scriptFile%
				StringReplace, scriptData, scriptData, {romPath}, %romPath%, all

				;Create cmd file to send to MESS
				FileDelete, %romPath% . "\" . %romName% . ".cmd"
				FileAppend, %scriptData%, %romPath%\%romName%.cmd
				param2 := " -exp blue_ram_16k -debug -debugscript """ . romPath . "\" . romName . ".cmd"""
				
				closeDebugWindow := "true"
			}
		}Else If (mameID = "samcoupe")	; MGT Sam Coupe
		{	AutoBootDelay := IniReadCheck(mameSysINI, "Settings", "AutoBootDelay","2",,1)	; Read delay from config.
			AutoBootDelay := " -autoboot_delay " . AutoBootDelay
			
			If romExtension in .mgt,.dsk,.d77,.d88,.1dd,.dfi,.imd,.ipf,.mfi,.mfm,.td0,.cqm,.cqi
				mediaDeviceType := "flop1"
				param1 := " -" . mediaDeviceType . " """ . romPath . "\" . romName . romExtension . """ -autoboot_command ""\nBOOT\n""" . AutoBootDelay . ""
		}Else If (mameID = "vic10")	; Commodore MAX Machine
		{   AutoBootDelay := IniReadCheck(mameSysINI, "Settings", "AutoBootDelay","2",,1)	; Read delay from config.
			AutoBootDelay := " -autoboot_delay " . AutoBootDelay
		
			If romExtension in .e0,.80
				param1 := " -cart """ . romPath . "\" . romName . romExtension . """"
			Else If romExtension in .wav,.tap
				param1 := " -cass """ . romPath . "\" . romName . romExtension . """"
			Else If romExtension in .t64,.prg,.p00
			{
				mediaDeviceType := "quik"
				param1 := " -" . mediaDeviceType . " """ . romPath . "\" . romName . romExtension . """ -autoboot_command ""RUN""" . AutoBootDelay . ""
			}
		}Else If (mameID = "cpc664")	; Amstrad CPC
		{	LaunchProgram := IniReadCheck(mameSysINI, romName, "LaunchProgram","disk",,1)	; Read command from config.
			LaunchProgram := " -autoboot_command " . """RUN \""" . LaunchProgram . "\n"""
			AutoBootDelay := IniReadCheck(mameSysINI, "Settings", "AutoBootDelay","2",,1)	; Read delay from config.
			AutoBootDelay := " -autoboot_delay " . AutoBootDelay

			If romExtension in .d77,.d88,.1dd,.dfi,.imd,.ipf,.mfi,.mfm,.td0,.cqm,.cqi,.dsk
				mediaDeviceType := "flop1"
				param1 := " -" . mediaDeviceType . " """ . romPath . "\" . romName . romExtension . """" . LaunchProgram . AutoBootDelay
		}

		;Use a different bios if needed (This must be done after the above if conditions since the mameID will change)
		iniBios := IniReadCheck(mameSysINI, romName, "Bios",mameID,,1) ; for all games, we use the default bios. Some games might require different bios like Odyssey2's Jopac games use the videopac bios instead, which should be defined in the ini
		If (iniBios != "")
			mameID := iniBios	; need to change the bios name for some games
	}

	; These systems don't use an ini, but do require parameters to be changed from the default method of launching MAME
	If (mameID = "neocdz" || mameID = "cdimono1" || mameID = "segacd" || mameID = "saturn" || mameID = "psx" || (mameID = "tg16" && mameSystem = "NEC TurboGrafx-CD") || (mameID = "pce" && mameSystem = "NEC PC Engine-CD"))	; SNK Neo Geo CD, Philips CD-i, Sega CD, Sega Saturn, Sony PlayStation, NEC PC Engine-CD or NEC TurboGrafx-CD
	{	If romExtension not in .chd,.cue
			ScriptError("MAME only supports " . mameSystem . " games in chd and cue format. It does not support:`n" . romExtension)
		If (mameSystem = "NEC TurboGrafx-CD") {		; NEC TurboGrafx-CD needs an additional bios mounted as a cart to run
			; tgcdBios := CheckFile(emuPath . "\roms\CD-ROM System V2.01 (U).pce")	; older bios that doesn't seem to work with many games
			tgcdBios := CheckFile(emuPath . "\roms\Super CD-ROM2 System V3.01 (U).pce")
			param2 := " -cart " . """" . tgcdBios . """"
		} Else If (mameSystem = "NEC PC Engine-CD") {		; NEC PC Engine-CD needs an additional bios mounted as a cart to run
			pcecdBios := CheckFile(emuPath . "\roms\Super CD-ROM2 System V3.0 (J).pce")
			param2 := " -cart " . """" . pcecdBios . """"
		} Else If (mameID = "psx") {		; Sony PlayStation
			mameID := "psu"		; changing mameID sent to MAME to use the USA bios
			; SelectMemCard()	; future function to swap around memcards
			; Usage: mc1 "J:\MAME\software\psu\card1.mc" 
		} If (mameSystem = "Sega CD") {	; 
			If InStr(romName,"(Jap")	; Mega CD Japanese v2
				mameID := "megacd2j"
			Else If InStr(romName,"(Euro")	; Mega CD European (PAL)
				mameID := "megacd"
		}
		param1 := " -cdrm """ . romPath . "\" . romName . romExtension . """"
	}Else If (mameID = "gamecom")	; Tiger Game.com
	{	If (romExtension != ".txt")
			param1 := " -cart1 """ . romPath . "\" . romName . romExtension . """"
	}Else If (mameID = "genesis")	; Sega Genesis
	{	If (InStr(romName, "(Europe") || InStr(romName, "(PAL"))	; if rom is from europe, tell MAME to boot a Mega Drive instead
			mameID := "megadriv"
	}Else If (mameID = "megadriv")	; Sega Mega Drive
	{	If (InStr(romName, "(USA") || InStr(romName, "(NTSC"))	; if rom is from America, tell MAME to boot a Genesis instead
			mameID := "genesis"
	}Else If (mameID = "vii") ; JungleTac Sport Vii
	{   If (romName = "Built-In Games (China)")	;  Has some built-in games, gotta launch just BIOS for it.
			param1 := ""
	}Else If (mameID = "alice32") ; Matra & Hachette Alice
	{   If (romExtension != ".txt")
			param1 := " -cass1 """ . romPath . "\" . romName . romExtension . """"
	}Else If (mameID = "cgenie") ; EACA EG2000 Colour Genie
	{   If (romExtension != ".txt")
			param1 := " -cass1 """ . romPath . "\" . romName . romExtension . """"
	}Else If (mameID = "pockstat")	; Sony PocketStation
	{	If (romExtension != ".gme")
			param1 := " -cart1 """ . romPath . "\" . romName . romExtension . """"	
	}Else If (mameID = "coco3")	; Tandy TRS-80 Color Computer
	{   If (romExtension != ".txt")
			param1 := " -cart """ . romPath . "\" . romName . romExtension . """"
	}Else If (mameID = "zx81")		; Sinclair ZX81
	{   If (romExtension != ".txt")
			param1 := " -cass1 """ . romPath . "\" . romName . romExtension . """"
	}Else If (mameID = "lynx128k")	; Camputers Lynx
	{   If (romExtension != ".txt")
			param1 := " -cass1 """ . romPath . "\" . romName . romExtension . """"
	}Else If (mameID = "vg5k")		; Philips VG 5000
	{   If (romExtension != ".txt")
			param1 := " -cass1 """ . romPath . "\" . romName . romExtension . """"
	}Else If (mameID = "sorcerer")	; Exidy Sorcerer
	{	If (romExtension = ".snp")	; Snapshot file
			param1 := " -dump """ . romPath . "\" . romName . romExtension . """"
		Else If (romExtension = ".bin")
			param1 := " -quik """ . romPath . "\" . romName . romExtension . """"
	}Else If (messID = "jupace") 	; jupiter ace
	{	If (romExtension = ".ace")
			param1 := " -dump """ . romPath . "\" . romName . romExtension . """"
	}Else If (mameID = "a800" || mameID = "fds")	; Atari 8-Bit, Nintendo Famicom Disk System
	{	If (romExtension != ".txt")
			param1 := " -flop1 """ . romPath . "\" . romName . romExtension . """"
	}Else If (mameID = "vectrex")	; GCE Vectrex
	{	If (romName = "Mine Storm (World)")		; MAME dumps an error if you try to launch Mine Storm using a rom instead of just booting vectrex w/o a game in it (Mine Storm is built into vectrex)
			param1 := ""
	}Else If (mameID = "apfm1000")	; APF Imagination Machine/APF M1000
	{	If (romName = "Rocket Patrol (USA)")	; Rocket Patrol is built into the APF M1000 ROM.
			param1 := ""
	}Else If (mameID = "adam")		; Coleco ADAM
		param1 := (If romExtension = ".ddp" ? " -cass1" : (If romExtension = ".dsk" ? " -flop1" : " -cart1")) . " """ . romPath . "\" . romName . romExtension . """"	;  Decide if tape, disk, or cart game
	Else If (mameID = "pegasus")	; Aamber Pegasus
	{   If (romExtension != ".txt")
			param1 := " -cart1 """ . romPath . "\" . romName . romExtension . """"
	}Else If (mameID = "gp32")	; GamePark 32
	{   If (romExtension != ".txt")
			param1 := " -memc """ . romPath . "\" . romName . romExtension . """"
	}Else If (mameID = "svmu")	; Sega VMU
	{
		param1 := " -quik """ . romPath . "\" . romName . romExtension . """"
	}Else If (mameID = "x1turbo40")	; Sharp X1
	{   If romExtension in .bin,.rom
			param1 := " -cart """ . romPath . "\" . romName . romExtension . """"
		Else If romExtension in .wav,.tap
			param1 := " -cass """ . romPath . "\" . romName . romExtension . """"
		Else
			param1 := " -flop1 """ . romPath . "\" . romName . romExtension . """"
	}Else If (mameID = "pc8801")	; NEC PC-8801
	{   If (romExtension = ".d88")
			param1 := " -flop1 """ . romPath . "\" . romName . romExtension . """"
	}Else If (mameID = "fmnew7	")	; Fujitsu FM-7
	{   If romExtension in .fdi,.td0,.imd,.cqm,.dsk,.d77,.d88,.1dd
			param1 := " -flop1 """ . romPath . "\" . romName . romExtension . """"
		Else If romExtension in .wav,.t77
			param1 := " -cass """ . romPath . "\" . romName . romExtension . """"
	}Else If (mameID = "apple2ep")	; Apple II
	{	If romExtension in .dsk,.do,.po,.rti,.edd,.d77,.d88,.1dd,.dfi,.imd,.i pf,.mfi,.mfm,.td0,.cqm,.cqi
			param1 := " -flop1 """ . romPath . "\" . romName . romExtension . """"
		Else If romExtension in .wav
			param1 := " -cass """ . romPath . "\" . romName . romExtension . """"
	}Else If (mameID = "n64dd")		; Nintendo 64DD
	{
		If FileExist(romPath . romName . ".n64")
			param1 := " -cart """ . romPath . "\" . romName . ".n64"" -quik """ . romPath . "\" . romName . romExtension . """"
		Else
			param1 := " -quik """ . romPath . "\" . romName . romExtension . """"
	}Else If mameID in studio2,mpt02		;RCA Studio 2
	{
		If (romExtension != ".txt")
			param1 := " -cart1 """ . romPath . "\" . romName . romExtension . """"
		Else {
			If romName contains Doodle
				button2 := "A 1"	; Press 1 on P1 controller
			If romName contains Patterns
				button2 := "A 2"	; Press 2 on P1 controller
			If romName contains Bowling
				button2 := "A 3"	; Press 3 on P1 controller
			If romName contains Freeway
				button2 := "A 4"	; Press 4 on P1 controller
			If romName contains Addition
				button2 := "A 5"	; Press 5 on P1 controller
		}

		; Generate a lua script to press the Clear button so games will start
		ScriptFileName := GeneratePressButtonScript("Clear",button2)
		bootscript := " -script """ . ScriptFileName . """ -autoboot_delay 1"
	}
} Else {	; Use Software List
	hashname := mameID
	param1 := " """ . romName . """" ; param1 used for launching from software lists

	If (mameID = "aes")	; SNK Neo Geo AES
	{	hashname := "neogeo"
		biosRegion := IniReadCheck(mameSysINI, romName, "BIOS_Region","asia",,1)
		param2 := " -bios " . biosRegion	; can also be japan, but the asian one has english menus for most games
	}
	CheckFile(emuPath . "\hash\" . hashname . ".xml","Could not find a software list for the system " . mameID) ;Check if software list for selected system exists
}

If (mameID = "vectrex")	; GCE Vectrex
	param2 := " -view "  . (If (FileExist(emuPath . "\artwork\Vectrex\" . romName . ".png"))?("""" . romName . """"):"standard")	; need overlays extracted in the artwork\vectres folder. PNGs must match romName

sysStaticParams := If sysStaticParams != ""  ? A_Space . sysStaticParams : "" ; tacking on a space in case user forgot to add one
romParams := If romParams != ""  ? A_Space . romParams : "" ; tacking on a space in case user forgot to add one

StringReplace,mameRomPaths,romPathFromIni,|,`"`;`",1	; replace all instances of | to ; in the Rom_Path from RL's Emulators.ini so MAME knows where to find your roms
mameRomPaths := " -rompath """ .  (If mameRomName ? romPath : mameRomPaths) . (If mameBiosPath ? ";" . mameBiosPath : "") . """"	; If using an alt rom, only supply mame with the path to that rom so it doesn't try to use the original rom. If a bios path was supplied, add it into the rom paths sent to MAME

If InStr(romParams,"-rompath")
	ScriptError("""-rompath"" is defined as a parameter for " . romName . ". The MAME module fills this automatically so please remove this from Params in the module's settings.")
If InStr(sysStaticParams,"-rompath")
	ScriptError("""-rompath"" is defined as a parameter for " . mameSystem . ". The MAME module fills this automatically so please remove this from Params in the module's settings.")

; use a custom rom name, not the one from the db
If mameRomName {
	FileMove, %romPath%\%romName%%romExtension%, %romPath%\%mameRomName%%romExtension%	; rename rom to match what mame needs
	originalRomName := romName	; store romName from database so we know what to rename it back to later
	romName := mameRomName
	If ErrorLevel
		ScriptError("There was a problem renaming " . romName . "  to " . mameRomName . " in " . romPath . ". Please check you have write permission to this folder/file and you don't already have a file named """ . mameRomName . """ in your rom folder.",8)
	Else	; if rename was successful, set var so we know to move it back later
		fileRenamed := 1
}

; use a custom cfg file if it exists and append it to param1
If FileExist(emuPath . "\cfg\" . mameID . "\" . dbName)
	param1 := " -cfg_directory " . """" . emuPath . "\cfg\" . mameID . "\" . dbName . """" . param1

If (bilinearFilter = "true")
	bilinearEnabled := " -filter"
Else
	bilinearEnabled := " -nofilter"

If (cheatMode = "true")
{	If (!FileExist(emuPath . "\cheat.zip") && !FileExist(emuPath . "\cheat.7z"))
		ScriptError("You have cheats enabled for " . MEmu . " but could not locate a ""cheat.zip"" or ""cheat.7z"" in " . emuPath)
	Else
		Log("Module - Cheat file found in " . emuPath,4)
	If cheatModeKey	; if user wants to use a key to enable CheatMode
		cheatEnabled := If XHotkeyAllKeysPressed(cheatModeKey) ? " -cheat" : ""	; only enables cheatMode when key is held down on launch
	Else	; no cheat mode key defined
		cheatEnabled := " -cheat"
}

If (RequiresReset = "true")
{	; Generate a lua script to send a system soft reset
	ScriptFileName := GenerateSoftResetScript()
	bootscript := " -script """ . ScriptFileName . """ -autoboot_delay 1"
}

HideEmuStart()

If (legacyMode = "true")
{	Log("Module - Running MAME in legacy Mode")
	errLvl := Run("""" . executable . """ " . (If mameID = "MAME" ? romName : mameID . param1 . param2 . param3 . param4 . param5 . param6) . fullscreenParam . cheatEnabled . volume . mameRomPaths . sysStaticParams . romParams, emuPath, winstate)
} Else {
	Log("Module - Running MAME in non-legacy mode")
	; If (networkPlayers = 1 || !linkEnabledGame) {
	If !networkSession {
		Log("Module - Single session",4)
		errLvl := Run("""" . executable . """ " . (If mameID = "MAME" ? romName : mameID . param1 . param2 . param3 . param4 . param5 . param6) . mameRomPaths . sysStaticParams . romParams . fullscreenParam . hlsl . glsl . cheatEnabled . volume . inipath . hashpath . verticalRotationMode . videomode . artworkCrop . useBezels . useOverlays . useBackdrops . useCpanels . useMarquees . autosave . bootscript . bilinearEnabled . " -skip_gameinfo", emuPath, winstate)
	} Else { ; multiplayer game run
		Log("Module - Network/MultiPlayer session",4)
		BuildNVRAMObject()	; build nvram object
		;screen positions
		screenPos := []
		screenPos := SplitScreenPos(networkPlayers,splitScreen2PlayersMode,splitScreen3PlayersMode,maxPlayersPerMonitor)
		If (networkType="localLink")
			globalInputs := " -global_inputs"		; tell mame to accept inputs when its window is not focused
		Loop, %networkPlayers%
		{
			currentPlayer := A_Index
			; Update NVRAM setting(s)
			If (enableNVRAMAutomation = "true") {
				If nvramSettings[romName]["Settings"]["Credit"]["Position"].MaxIndex() {	; If nvram settings exist for this game
					nvramFile := emuPath . "\nvram" . (If currentPlayer = 1 ? "" : currentPlayer) . "\" . romName . "\" . nvramSettings[romName]["Settings"]["NVRAM"]["File"][1]
					If FileExist(nvramFile) {
						Log("Module - Checking nvram file(s) for required changes",4)
						If (networkType = "localLink") {	; only local link is supported for now
							; Parse through each setting of each player and lookup the position to write new setting to the nvram file
							for playerOptionLabel, selectedPlayerOption in nvramSettings[romName]["Player"][currentPlayer] ;looping on each player selected options
								for index, setting in nvramSettings[romName]["Settings"][playerOptionLabel]["Position"] ;Looping through hex values of the current option 
									HexCompareWrite(nvramFile,nvramSettings[romName]["Settings"][playerOptionLabel]["Position"][index],nvramSettings[romName]["Settings"][playerOptionLabel]["Option"][selectedPlayerOption][index])	
							for index, playerCRC in nvramSettings[romName]["CRC"]["Player"][currentPlayer] ;looping on each player selected options
								HexCompareWrite(nvramFile,nvramSettings[romName]["Settings"]["CRC"]["Position"][index],nvramSettings[romName]["CRC"]["Player"][currentPlayer][index])
						} Else If (networkType = "Server") {
							Log("Module - Converting this nvram to ""Master"" in: " . nvramFile,4)
							; Log("Module - NVRAM automation for ""Server"" not supported at this time",4)	; only idea to get this to work is to duplicate nvram edit code from local link here but only set player 1
							HexCompareWrite(nvramFile,nvramSettings[romName]["Settings"]["Link"]["Position"][1],nvramSettings[romName]["Settings"]["Link"]["Option"]["Master"][1])
						} Else If (networkType = "Client") {
							Log("Module - Converting this nvram to ""Slave"" in: " . nvramFile,4)
							; Log("Module - NVRAM automation for ""Client"" not supported at this time",4)	; only idea to get this to work is to duplicate nvram edit code from local link here but only set player 2
							HexCompareWrite(nvramFile,nvramSettings[romName]["Settings"]["Link"]["Position"][1],nvramSettings[romName]["Settings"]["Link"]["Option"]["Slave"][1])
						}
					} Else
						Log("Module - Did not find an NVRAM file to update for player " . currentPlayer . " (Ignore this if this is the first time you are launching this rom): " . nvramFile,4)
				} Else
					Log("Module - This rom does not contain an entry in the NVRAM object",4)
			}
			;;Run Line for each of the multiplayer MAME instances using the nvramPath and cfgPath variables to the extra mames
			errLvl := Run("""" . executable . """ " . (If mameID = "MAME" ? romName : mameID . param1 . param2 . param3 . param4 . param5 . param6) . mameRomPaths . multiPlayerObj[currentPlayer]["CfgDir"] . multiPlayerObj[currentPlayer]["NvramDir"] . globalInputs . multiPlayerObj[currentPlayer]["LocalHost"] . multiPlayerObj[currentPlayer]["LocalPort"] . multiPlayerObj[currentPlayer]["RemoteHost"] . multiPlayerObj[currentPlayer]["RemotePort"] . sysStaticParams . romParams . fullscreenParam . hlsl . glsl . cheatEnabled . volume . inipath . hashpath . verticalRotationMode . videomode . artworkCrop . useBezels . useOverlays . useBackdrops . useCpanels . useMarquees . autosave . bootscript . bilinearEnabled . " -skip_gameinfo", emuPath, winstate, Screen%currentPlayer%PID)
			WinWait("ahk_pid " . Screen%currentPlayer%PID)
		}

		ignoreWindows := "MAMEOutput"	; ignore the mame debug window
		Loop, %networkPlayers%
		{
			WinGet, Screen%A_Index%ID, ID, % "ahk_pid " . Screen%A_Index%PID,, %ignoreWindows%
			WinSet, Style, -0xC00000, % "ahk_id " . Screen%A_Index%ID,, %ignoreWindows%
			ToggleMenu(Screen%A_Index%ID)
			WinSet, Style, -0xC40000, % "ahk_id " . Screen%A_Index%ID,, %ignoreWindows%
			MoveWindow("ahk_id " . Screen%A_Index%ID, screenPos[A_Index].X, screenPos[A_Index].Y, screenPos[A_Index].W, screenPos[A_Index].H,,ignoreWindows)
			Sleep, 50
		}
	}
}

If errLvl {
	If (errLvl = 1)
		Error := "Failed Validity"
	Else If(errLvl = 2)
		Error := "Missing Files"
	Else If(errLvl = 3)
		Error := "Fatal Error"
	Else If(errLvl = 4)
		Error := "Device Error"
	Else If(errLvl = 5)
		Error := "Game Does Not Exist"
	Else If(errLvl = 6)
		Error := "Invalid Config"
	Else If errLvl in 7,8,9
		Error := "Identification Error"
	Else
		Error := "MAME Error"
	Log("MAME Error - " . Error,3)
}

WinWait("ahk_class MAME")
WinWaitActive("ahk_class MAME")

If (mameID = "ti99_4a")	; Texas Instruments TI 99-4A
{
	SendCommand("X", 1000) ;To bypass the first screen
	If (Command)
		SendCommand(Command,,,,,, CommandWaitOffset) ;Send command affect it with an offset if needed
}

;Close the debugger window if exists
If (closeDebugWindow = "true") {
	WinWait("ahk_class MAMEDebugWindow",,2)
	WinClose("ahk_class MAMEDebugWindow")
}

BezelDraw()
HideEmuEnd()

If (networkPlayers = 1 || !linkEnabledGame) {
	WinShow, ahk_class MAME	; Show the emulator
} Else {
	Loop %networkPlayers%
		WinShow, % "ahk_id " . Screen%a_index%ID	; Show the emulator
	WinActivate, ahk_id %Screen1ID%		; activate first player window so that first player can use keyboard instead of last player
}

FadeInExit()
Process("WaitClose", executable)
7zCleanUp()
BezelExit()

If fileRenamed {	; rename file back to alternate name for next launch
	FileMove, %romPath%\%romName%%romExtension%, %romPath%\%originalRomName%%romExtension%
	If ErrorLevel	; if rename was successful, set var so we know to move it back later
		ScriptError("There was a problem renaming " . romName . " back to " . originalRomName)
}

FadeOutExit()
ExitModule()


; This will simply create a new blank ini if one does not exist
CheckFileMAME(file){
	If !FileExist(file)
		FileAppend,, %file%
	Return file
}

ListXMLInfo(rom){ ; returns MAME info about parent rom, orientation angle, resolution
	Global emuFullPath, emuPath
	ListXMLObject := Object()
	listXMLVarLog := ""
	RunWait, % comspec . " /c " . """" . emuFullPath . """" . " -listxml " . rom . " > tempBezel.txt", %emuPath%, Hide
	Fileread, ListxmlContents, %emuPath%\tempBezel.txt
	RegExMatch(ListxmlContents, "s)<game.*name=" . """" . rom . """" . ".*" . "cloneof=" . """" . "[^""""]*", parent)
	RegExMatch(parent,"cloneof=" . """" . ".*", parent)
	RegExMatch(parent,"""" . ".*", parent)
	StringTrimLeft, parent, parent, 1
	RegExMatch(ListxmlContents, "s)<display.*rotate=" . """" . "[0-9]+" . """", angle)
	RegExMatch(angle,"[0-9]+", angle, "-6")
	RegExMatch(ListxmlContents, "s)<display.*width=" . """" . "[0-9]+" . """", width)
	RegExMatch(width,"[0-9]+", width, "-6")
	RegExMatch(ListxmlContents, "s)<display.*height=" . """" . "[0-9]+" . """", Height)
	RegExMatch(Height,"[0-9]+", Height, "-6")
	RegExMatch(ListxmlContents, "s)<control.*ways=" . """" . "[0-9]+" . """", Ways)
	RegExMatch(Ways,"[0-9]+", Ways, "-6")
	logVars := "Parent|Angle|Height|Width|Ways"
	Loop, Parse, logVars, |
	{
		currentobj := {}
		currentobj.Label := A_Loopfield
		currentobj.Value := %A_Loopfield%
		ListXMLObject.Insert(currentobj["Label"], currentobj)
		listXMLLog .= "`r`n`t`t`t`t`t" . currentobj["Label"] . " = " . currentobj["Value"]
	}
	Log("Module - MAME ListXML values: " . listXMLLog,5)
	If (ListXMLObject["Height"].Value > ListXMLObject["Width"].Value) {
		ListXMLObject["Angle"].Value := true
		Log("Module - This game's height is greater than its width, forcing vertical mode",5)
	}
	FileDelete, %emuPath%\tempBezel.txt
	Return ListXMLObject	
}

GenerateSoftResetScript(){	; Generates a lua script to send a soft reset to MAME
	Global emuPath

	ScriptFileName := emuPath . "\soft_reset.lua"
	FileDelete, %ScriptFileName%
	FileAppend,
	(
	-- This script will reset the machine
	local function reset_machine()
	  if resetcounter == nil then
		manager:machine():soft_reset();  
		resetcounter = 1;
	  end
	end
	if resetcounter == nil then
	  emu.wait(1);
	  reset_machine();
	end
	), %ScriptFileName%

	Return, ScriptFileName
}

GeneratePressButtonScript(button1,button2=""){	; Generates a lua script to send a soft reset to MAME
	Global emuPath

	ScriptFileName := emuPath . "\press_button.lua"
	FileDelete, %ScriptFileName%
	If (button2) {
		button2str = `n`t`temu.wait(1);`n`t`tioport["%button2%"]:write(1);`n`t`temu.wait(1);`n`t`tioport["%button2%"]:write(0);
	}

	FileAppend,
	(
	local function press_button()
	  if resetcounter == nil then
		ioport["%button1%"]:write(1);
		emu.wait(1);
		ioport["%button1%"]:write(0);
		resetcounter = 1;%button2str%
	  end
	end
	if resetcounter == nil then
	  emu.wait(1);
	  press_button();
	end
	), %ScriptFileName%

	Return, ScriptFileName
}

BuildNVRAMObject() {
	Global nvramSettings
	Log("BuildNVRAMObject - Started",4)

	nvramSettings := {}

	nvramSettings["vr"] := {}
	nvramSettings["vr"]["Settings"] := {"BiosCounter":{"Position":["248"], "Option":{0:["00"], 1:["01"], 2:["02"], 3:["03"]}}, "Cabinet":{"Position":["52"], "Option":{"Special":["00"], "Standard":["01"], "Upright":["02"], "2PLink":["03"]}}, "Color":{"Position":["68"], "Option":{"Red":["00"], "Blue":["01"], "Yellow":["02"], "Green":["03"], "Black":["04"], "Pink":["05"], "SkyBlue":["06"], "Orange":["07"]}}, "Country":{"Position":["54"], "Option":{"Japan":["00"], "USA":["01"], "Export":["02"]}}, "Course":{"Position":["66"], "Option":{"Vote":["00"], "Beginner":["01"], "Middle":["02"], "Expert":["03"]}}, "CRC":{"Position":["16","18"]}, "Credit":{"Position":["32","40"], "Option":{"1":["00","00"], "Freeplay":["1A","01"]}}, "Difficulty":{"Position":["64"], "Option":{"Easy":["00"], "Normal":["01"], "Hard":["02"], "Hardest":["03"]}}, "Link":{"Position":["24"], "Option":{"None":["00"], "Master":["01"], "Slave":["02"], "Live":["03"]}}, "Monitor":{"Position":["22"], "Option":{"Standard":["00"], "Wide":["01"]}}, "NVRAM":{"File":["nvram"]}, "Race":{"Position":["70"], "Option":{"Normal":["00"], "Grandprix":["01"]}}, "StartCoin":{"Position":["42"], "Option":{1:["01"], 2:["02"], 3:["03"], 4:["04"], 5:["05"]}}}

	nvramSettings["vr"]["Player"] := {}
	nvramSettings["vr"]["Player"].Insert(1, {"BiosCounter":"3", "Cabinet":"Standard", "Color":"Red", "Country":"USA", "Course":"Vote", "Credit":"Freeplay", "Difficulty":"Normal", "Link":"Master", "Monitor":"Wide", "Race":"Normal", "StartCoin":"1"})
	nvramSettings["vr"]["Player"].Insert(2, {"BiosCounter":"3", "Cabinet":"Standard", "Color":"Blue", "Country":"USA", "Course":"Vote", "Credit":"Freeplay", "Difficulty":"Normal", "Link":"Slave", "Monitor":"Wide", "Race":"Normal", "StartCoin":"1"})
	nvramSettings["vr"]["Player"].Insert(3, {"BiosCounter":"3", "Cabinet":"Standard", "Color":"Yellow", "Country":"USA", "Course":"Vote", "Credit":"Freeplay", "Difficulty":"Normal", "Link":"Slave", "Monitor":"Wide", "Race":"Normal", "StartCoin":"1"})
	nvramSettings["vr"]["Player"].Insert(4, {"BiosCounter":"3", "Cabinet":"Standard", "Color":"Green", "Country":"USA", "Course":"Vote", "Credit":"Freeplay", "Difficulty":"Normal", "Link":"Slave", "Monitor":"Wide", "Race":"Normal", "StartCoin":"1"})
	nvramSettings["vr"]["Player"].Insert(5, {"BiosCounter":"3", "Cabinet":"Standard", "Color":"Black", "Country":"USA", "Course":"Vote", "Credit":"Freeplay", "Difficulty":"Normal", "Link":"Slave", "Monitor":"Wide", "Race":"Normal", "StartCoin":"1"})
	nvramSettings["vr"]["Player"].Insert(6, {"BiosCounter":"3", "Cabinet":"Standard", "Color":"Pink", "Country":"USA", "Course":"Vote", "Credit":"Freeplay", "Difficulty":"Normal", "Link":"Slave", "Monitor":"Wide", "Race":"Normal", "StartCoin":"1"})
	nvramSettings["vr"]["Player"].Insert(7, {"BiosCounter":"3", "Cabinet":"Standard", "Color":"SkyBlue", "Country":"USA", "Course":"Vote", "Credit":"Freeplay", "Difficulty":"Normal", "Link":"Slave", "Monitor":"Wide", "Race":"Normal", "StartCoin":"1"})
	nvramSettings["vr"]["Player"].Insert(8, {"BiosCounter":"3", "Cabinet":"Standard", "Color":"Orange", "Country":"USA", "Course":"Vote", "Credit":"Freeplay", "Difficulty":"Normal", "Link":"Slave", "Monitor":"Wide", "Race":"Normal", "StartCoin":"1"})
	nvramSettings["vr"]["CRC"] := {"Player":{1:["06","21"], 2:["3C","C7"], 3:["0E","5F"], 4:["FF","D8"], 5:["4B","7F"], 6:["BA","F8"], 7:["88","60"], 8:["79","E7"]}}

	nvramSettings["vformula"] := {}
	nvramSettings["vformula"]["Settings"] := {"BiosCounter":{"Position":["248"], "Option":{0:["00"], 1:["01"], 2:["02"], 3:["03"]}}, "Color":{"Position":["68"], "Option":{"Red":["00"], "Blue":["01"], "Yellow":["02"], "Green":["03"], "Black":["04"], "Pink":["05"], "SkyBlue":["06"], "Orange":["07"]}}, "Country":{"Position":["54"], "Option":{"Japan":["00"], "USA":["01"], "Export":["02"]}}, "Course":{"Position":["66"], "Option":{"Vote":["00"], "Beginner":["01"], "Middle":["02"], "Expert":["03"]}}, "CRC":{"Position":["16","18"]}, "Credit":{"Position":["32","40"], "Option":{"1":["00","00"], "Freeplay":["1A","01"]}}, "Difficulty":{"Position":["64"], "Option":{"Easy":["00"], "Normal":["01"], "Hard":["02"], "Hardest":["03"]}}, "Link":{"Position":["24"], "Option":{"None":["00"], "Master":["01"], "Slave":["02"], "Live":["03"]}}, "NVRAM":{"File":["nvram"]}, "Race":{"Position":["70"], "Option":{"Normal":["00"], "Grandprix":["01"]}}, "Sound":{"Position":["22"], "Option":{"On":["00"], "Off":["01"]}}, "StartCoin":{"Position":["42"], "Option":{1:["01"], 2:["02"], 3:["03"], 4:["04"], 5:["05"]}}}

	nvramSettings["vformula"]["Player"] := {}
	nvramSettings["vformula"]["Player"].Insert(1, {"BiosCounter":"1", "Color":"Red", "Country":"USA", "Course":"Vote", "Credit":"Freeplay", "Difficulty":"Normal", "Link":"Master", "Race":"Normal", "Sound":"On", "StartCoin":"1"})
	nvramSettings["vformula"]["Player"].Insert(2, {"BiosCounter":"1", "Color":"Blue", "Country":"USA", "Course":"Vote", "Credit":"Freeplay", "Difficulty":"Normal", "Link":"Slave", "Race":"Normal", "Sound":"On", "StartCoin":"1"})
	nvramSettings["vformula"]["Player"].Insert(3, {"BiosCounter":"1", "Color":"Yellow", "Country":"USA", "Course":"Vote", "Credit":"Freeplay", "Difficulty":"Normal", "Link":"Slave", "Race":"Normal", "Sound":"On", "StartCoin":"1"})
	nvramSettings["vformula"]["Player"].Insert(4, {"BiosCounter":"1", "Color":"Green", "Country":"USA", "Course":"Vote", "Credit":"Freeplay", "Difficulty":"Normal", "Link":"Slave", "Race":"Normal", "Sound":"On", "StartCoin":"1"})
	nvramSettings["vformula"]["Player"].Insert(5, {"BiosCounter":"1", "Color":"Black", "Country":"USA", "Course":"Vote", "Credit":"Freeplay", "Difficulty":"Normal", "Link":"Slave", "Race":"Normal", "Sound":"On", "StartCoin":"1"})
	nvramSettings["vformula"]["Player"].Insert(6, {"BiosCounter":"1", "Color":"Pink", "Country":"USA", "Course":"Vote", "Credit":"Freeplay", "Difficulty":"Normal", "Link":"Slave", "Race":"Normal", "Sound":"On", "StartCoin":"1"})
	nvramSettings["vformula"]["Player"].Insert(7, {"BiosCounter":"1", "Color":"SkyBlue", "Country":"USA", "Course":"Vote", "Credit":"Freeplay", "Difficulty":"Normal", "Link":"Slave", "Race":"Normal", "Sound":"On", "StartCoin":"1"})
	nvramSettings["vformula"]["Player"].Insert(8, {"BiosCounter":"1", "Color":"Orange", "Country":"USA", "Course":"Vote", "Credit":"Freeplay", "Difficulty":"Normal", "Link":"Slave", "Race":"Normal", "Sound":"On", "StartCoin":"1"})
	nvramSettings["vformula"]["CRC"] := {"Player":{1:["F2","EB"], 2:["C8","0D"], 3:["FA","95"], 4:["0B","12"], 5:["BF","B5"], 6:["4E","32"], 7:["7C","AA"], 8:["8D","2D"]}}

	Log("BuildNVRAMObject - Ended",4)
}

BezelLabel:
	WinSet, Transparent, 0, ahk_class ConsoleWindowClass
Return

HaltEmu:
	If (pauseMethod = 1)
	{	disableSuspendEmu := "true"
		disableRestoreEmu := "true"
		PostMessage,0x211, 1, , , ahk_class MAME
	} Else If (pauseMethod = 2)
	{	disableSuspendEmu := "true"
		PostMessage,0x211, 1, , , ahk_class MAME
	} Else If (pauseMethod = 3)
	{	disableSuspendEmu := "true"
		disableRestoreEmu := "true"
		PostMessage,% 0x0400+6, 1, , , ahk_class MAME
	} Else If (pauseMethod = 4)
	{	disableSuspendEmu := "true"
		PostMessage,% 0x0400+6, 1, , , ahk_class MAME
	} Else If (pauseMethod = 5)
	{	disableSuspendEmu := "true"
		Send, {P down}
		Sleep, 1000
		Send, {P up} 
	}
Return
RestoreEmu:
	If (pauseMethod = 1)
	{	PostMessage,0x212, 1, , , ahk_class MAME
		WinActivate, ahk_class MAME
	} Else If (pauseMethod = 2)
	{	PostMessage,0x212, 1, , , ahk_class MAME
		WinActivate, ahk_class MAME
	} Else If (pauseMethod = 3)
	{	PostMessage,% 0x0400+6, 0, , , ahk_class MAME
		WinActivate, ahk_class MAME
	} Else If (pauseMethod = 4)
	{	PostMessage,% 0x0400+6, 0, , , ahk_class MAME
		WinActivate, ahk_class MAME
	} Else If (pauseMethod = 5)
	{	disableSuspendEmu := "true"
		Send, {P down}
		Sleep, 1000
		Send, {P up} 
		WinActivate, ahk_class MAME
	} Else If (pauseMethod = 6)
		WinActivate, ahk_class MAME
Return

CloseProcess:
	FadeOutStart()
	If (networkSession && networkPlayers > 1) {
		Loop % networkPlayers
		{	WinClose("ahk_id " . Screen%A_Index%ID)
			WinWaitClose("ahk_id " . Screen%A_Index%ID)
		}
	} Else
		WinClose("ahk_class MAME")
Return
