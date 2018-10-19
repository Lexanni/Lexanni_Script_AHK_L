MsgBox, Press ALT and B to get a *FAKE* BSOD
Return
!vk42::
MouseMove, 999,9999
BlockInput, On
BlockInput, MouseMove
Gui, Show, X0 Y0 W%A_ScreenWidth% H%A_ScreenHeight%, 1A
Gui, Color, Navy
Gui, Font, CWhite S12 Q3, Lucida Console
Gui, -Caption
Gui, Add, Text, X0 Y0 vB W%A_ScreenWidth% H%A_ScreenHeight%, A problem has been detected and Windows has been shut down to prevent damage to your computer.`n`n`nThe end-user manually created the crashdump.`n`nCheck to make sure any new hardware or software is properly installed. If this is a new installation, ask your hardware or software manufacturer for any Windows updates you might need.`n`nIf problems continue, disable or remove any newly installed hardware or software. Disable BIOS memory options such as caching or shadowing. If you need to use Safe Mode to remove or disable components, restart your computer, press F8 to select Advanced Startup Options, and then select Safe Mode.`n`nTechnical Information:`n`n*** STOP: 0x000000E2 (0x00000000, 0x00000000, 0x00000000, 0x00000000)`n`n`n`nCollecting data for crash dump...`nInitializing disk for crash dump...`nBeginning dump of physical memory.`nDumping physical memory to disk: 0`n
WinActivate, 1A
Loop 20
{
Index += 5
GuiControl,, B, A problem has been detected and Windows has been shut down to prevent damage to your computer.`n`n`nThe end-user manually created the crashdump.`n`nCheck to make sure any new hardware or software is properly installed. If this is a new installation, ask your hardware or software manufacturer for any Windows updates you might need.`n`nIf problems continue, disable or remove any newly installed hardware or software. Disable BIOS memory options such as caching or shadowing. If you need to use Safe Mode to remove or disable components, restart your computer, press F8 to select Advanced Startup Options, and then select Safe Mode.`n`nTechnical Information:`n`n*** STOP: 0x000000E2 (0x00000000, 0x00000000, 0x00000000, 0x00000000)`n`n`n`nCollecting data for crash dump...`nInitializing disk for crash dump...`nBeginning dump of physical memory.`nDumping physical memory to disk: %Index%`n
Sleep, 100
}
GuiControl,, B, A problem has been detected and Windows has been shut down to prevent damage to your computer.`n`n`nThe end-user manually created the crashdump.`n`nCheck to make sure any new hardware or software is properly installed. If this is a new installation, ask your hardware or software manufacturer for any Windows updates you might need.`n`nIf problems continue, disable or remove any newly installed hardware or software. Disable BIOS memory options such as caching or shadowing. If you need to use Safe Mode to remove or disable components, restart your computer, press F8 to select Advanced Startup Options, and then select Safe Mode.`n`nTechnical Information:`n`n*** STOP: 0x000000E2 (0x00000000, 0x00000000, 0x00000000, 0x00000000)`n`n`n`nCollecting data for crash dump...`nInitializing disk for crash dump...`nBeginning dump of physical memory.`nDumping physical memory to disk: 100`nPhysical memory dump complete.`nContact your system admin or technical support group for further assistance.
GuiClose:
Return
^!vk45::
Exitapp

#IfWinActive, 1A
LAlt::return
RAlt::return
RWin::return
LWin::return
#IfWinActive