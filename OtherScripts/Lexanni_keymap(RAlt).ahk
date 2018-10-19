#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;		Цифровая раскладка Lexanni
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;----------- Управление иконкой -----------------
Menu, Tray, Icon, off.ico

*+CapsLock::Send {CapsLock} ;Shift+CapsLock -> CapsLock
RAlt::return
*CapsLock::
Send, % (RAltOn := !RAltOn) ? "{RAlt Down}" : "{RAlt Up}" ; залипание клавиши CapsLock
Menu, Tray, Icon, % RAltOn ? "on.ico" : "off.ico"
return
;~ *CapsLock::ffffааааааааа
;~ Send, % (ControlAltOn := !ControlAltOn) ? "{Alt Down}{Control Down}" : "{Control Up}{Alt Up}" 



;------------ Проба клавиш ----------------
;>!sc10::Send, {U+0111} ;

;------------ Секця для работы BackSpace, Space и Enter при нажатом RAlt ----------->
*$BackSpace::
   Send, % RAltOn ? "{RAlt Up}{BackSpace Down}":"{BackSpace Down}"
   Return
BackSpace Up::
   Send, % RAltOn ? "{RAlt Down}{BackSpace Up}":"{BackSpace Up}"
   Return
 
*$Space::
   Send, % RAltOn ? "{RAlt Up}{Space Down}":"{Space Down}"
   Return
Space Up::
   Send, % RAltOn ? "{RAlt Down}{Space Up}":"{Space Up}"
   Return
   
*$Enter::
   Send, % RAltOn ? "{RAlt Up}{Enter Down}":"{Enter Down}"
   Return
Enter Up::
   Send, % RAltOn ? "{RAlt Down}{Enter Up}":"{Enter Up}"
   Return
;----------------------------------------------------------------------------

;--------------- Слой RAlt --------------
;CapsLock & sc10::Send {sc21}
;>!sc10::Send, f
;~ !^sc10::Send, {sc21}
;~ sc13B ; скан-код моей сенсорной полоски
;~ <^>!sc10::Send, {sc21}ffff

;~ RAlt & vk41::ToolTip Вы нажали %A_ThisHotkey%. 
;~ >!vk53::Send, 2

+sc29::ExitApp ; Выход из скрипта
sc29::Reload ; Перезапуск