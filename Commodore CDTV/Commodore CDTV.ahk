# Emulator: WinUAE
# By StevenB - stevenbreuls.com
# Downloaded from: https://github.com/stevenb9/Hyperspin-AHK-Modules

RunWait, "%executable%" -s quickstart=cdtv`,0 -s chipmem_size=8 -s gfx_fullscreen_amiga=true -s use_gui=false -s gfx_width_fullscreen=native -s gfx_height_fullscreen=native -s gfx_blacker_than_black=false -s gfx_flickerfixer=false -s gfx_resolution=hires -s gfx_lores=false -cdimage="%romPath%%romName%%romExtension%" -portable, %emuPath%

ExitApp

CloseProcess:
      Process, Close, %executable%
return