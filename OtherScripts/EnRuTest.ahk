<!<+vk30:: SendMessage, 0x50,, 0x4090409,, A ; английский
<^<+vk30:: SendMessage, 0x50,, 0x4190419,, A ; русский

;~ F12::
;~ If (EnOn := !EnOn)
;~ {
	;~ SendMessage, 0x50,, 0x4090409,, A ; английский
;~ }else {
	;~ SendMessage, 0x50,, 0x4190419,, A ; русский
;~ }
;~ return

;~ F1::PostMessage, 0x50, 2,,, A

;~ CapsLock::
;~ If (EnOn := !EnOn)
;~ {
    ;~ SendMessage, 0x50,, 0x4090409,, A ; английский
;~ } else {
    ;~ SendMessage, 0x50,, 0x4190419,, A ; русский
;~ }
;~ return
F11:: ;выдает идентификатор локали 
  SetFormat, Integer, H
  WinGet, WinID,, A
  ThreadID:=DllCall("GetWindowThreadProcessId", UInt, WinID, UInt, 0)
  InputLocaleID:=DllCall("GetKeyboardLayout", UInt, ThreadID, UInt)
  MsgBox, %InputLocaleID%
Return

Alt::
  SetFormat, Integer, H
  WinGet, WinID,, A
  ThreadID:=DllCall("GetWindowThreadProcessId", UInt, WinID, UInt, 0)
  InputLocaleID:=DllCall("GetKeyboardLayout", UInt, ThreadID, UInt)
  ;~ MsgBox, %InputLocaleID%
  If InputLocaleID = 0x4090409
    
Return