F12::
TankMode:
If (TankModeOn := !TankModeOn)
{
    Menu, Tray, Check, Танковый режим
    TrayTip, TankMode, ON
} else {
    Menu, Tray, UnCheck, Танковый режим
    TrayTip, TankMode, OFF
} return
    
#If TankModeOn
	^Enter::
		Suspend, Permit
		Send, ^{Enter}
		gosub, ScriptPaused
	return
	Enter::
		Suspend, Permit
		Send, {Enter}
		gosub, ScriptPaused
	return
	vkC0::
		Suspend, Permit
		Send, {vk54}
		gosub, ScriptPaused
	return
	RWin::
	Suspend, Permit
	Send, {RControl Down}
	return
	RWin Up::
	Suspend, Permit
	Send, {RControl Up}
	return
	>^Numpad1::F1
	>^Numpad2::F2
	>^Numpad3::F3
	>^Numpad4::F4
	>^Numpad5::F5
	>^Numpad6::F6
	>^Numpad7::F7
	>^Numpad8::F8
	>^Numpad9::F9
#If