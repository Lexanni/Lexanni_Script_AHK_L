;~ SetTitleMatchMode, RegEx
;~ Left::
	;~ PostMessage, 0x25, 1,, .*Ace Player HD (VLC)
;~ return

;~ Right::
;~ IfWinExist, .*Ace Player HD (VLC)
;~ {
	;~ PostMessage, 0x27, 1,, .*Ace Player HD (VLC)
;~ }
;~ return

;~ SetKeyDelay, 119

;~ RControl::SendRaw, Если снег повсюду тает, день становится длинней, если все зазеленело и в полях звенит ручей, если солнце ярче светит, если птицам не до сна, если стал теплее ветер, значит, к нам пришла весна.

;~ $LAlt::return

Speed:=400.0
Speed/=60
RControl::
Clipboard:=
KeyWait, RAlt, D
CharCount:=StrLen(Clipboard)
Delay:=(1/Speed)*1000
AllTime:=Delay*CharCount
AllTime-=A_TimeSinceThisHotkey
Delay:=AllTime/CharCount
;~ MsgBox,,, Time_0=%Time_0% Speed=%Speed% Delay=%Delay% AllTime=%AllTime%
SetKeyDelay, %Delay%
SendRaw, %Clipboard%
return

