;~ LShift::Send, {u+002d}
;~ +LShift::Send, {u+005f}------------------------------------------------------------------- - - - - - - - - - - -----
;~ *RShift::Send, {-}
;~ #InstallKeybdHook

;~ LAlt::return
LAlt up::return

LAlt::
Send, {Alt Down}
KeyWait, LAlt
Send, {Alt Up}
return

;~ #If AltOn
;~ Tab::SendInput, !{Tab}
;~ #If

;~ LAlt up::return

;~ <!Tab::
;~ GetKeyState("LAlt", "P") ? "Send, !{Tab}" : "Send, {Tab}" 
;~ return