;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;	    Раскладка клавиатуры Lexanni
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

MsrejOn := false
NumOn := false

IniRead, LongLShift, LayoutOptions.ini, MAIN, LongLShift
IniRead, ShortBS, LayoutOptions.ini, MAIN, ShortBS
IniRead, StartSuspended, LayoutOptions.ini, MAIN, StartSuspended


Menu, Tray, NoStandard                          ; удаляем стандартные пункты меню (не пользовательские)
Menu, Tray, Icon, ico\ScriptOn.ico, , 1         ; устанавливаем значек при запуске, "замораживаем" его чтобы не менялся на значек "S" при остановке скрипта
Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nРаботает ; всплывающая подсказка, при наведении курсора
Menu, Tray, Add, О скрипте, About
Menu, Tray, Add, Открыть папку скрипта, OpenScriptDir
Menu, Tray, Add, Открыть скрипт в SciTE, OpenToSciTE   ; создаем свои меню значка в трее
Menu, Tray, Add, Вызвать таблицу символов, RunSymbolsTable
Menu, Tray, Add, Опции, LayoutOptions
Menu, Tray, Add, Запуск определялки скан-кодов, RunKeycodesAhk
Menu, Tray, Add, KeyHistory, ShowKeyHistory
Menu, Tray, Add,
Menu, Tray, Add, Включить раскладку MSREJ, MSREJOnOff
Menu, Tray, Add, Приостановить скрипт, ScriptPaused
Menu, Tray, Add,
Menu, Tray, Add, Перезапуск, ReloadScript
Menu, Tray, Add, Выход, ExitScript
; Простановка картинок в меню значка в трее:
Menu, Tray, Icon, О скрипте, Shell32.dll, 278
Menu, Tray, Icon, Открыть скрипт в SciTE, SciTE\SciTE.exe
Menu, Tray, Icon, Вызвать таблицу символов, %A_WinDir%\system32\charmap.exe
Menu, Tray, Icon, Перезапуск, Shell32.dll, 239
Menu, Tray, Icon, Опции, dsuiext.dll, 36
Menu, Tray, Icon, Выход, Shell32.dll, 28

if StartSuspended
{
    Suspend
    Menu, Tray, Icon, ico\ScriptOff.ico
    Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nПриостановлен
    Menu, Tray, Check, Приостановить скрипт
}
return

;----- Окно настроек ----->
LayoutOptions:
Gui, +ToolWindow ; -SysMenu
Gui, Margin, 15, 15
;~ Gui, font, s12 cBlue
;~ Gui, add, Text, H30, Опции
;~ Gui, font,
Gui, add, Checkbox, Checked%LongLShift% vLongLShift, Длиный левый Shift
Gui, add, Checkbox, Checked%ShortBS% vShortBS, Короткий BackSpace
Gui, add, Checkbox, Checked%StartSuspended% vStartSuspended, Запускать приостановленным
IfExist, %A_Startup%\%A_ScriptName% - Ярлык.lnk
{    
    CheckAutoLoad := true
}else{
    CheckAutoLoad := false
}
Gui, add, Checkbox, Checked%CheckAutoLoad% vCheckAutoLoad, Поместить в автозагрузку
Gui, add, Button,  Section w60, Принять
Gui, add, Button, wp ys, Закрыть
Gui, Show,, Опции
return

ButtonПринять:
Gui, Submit, NoHide
IniWrite, %LongLShift%, LayoutOptions.ini, MAIN, LongLShift
IniWrite, %ShortBS%, LayoutOptions.ini, MAIN, ShortBS
IniWrite, %StartSuspended%, LayoutOptions.ini, MAIN, StartSuspended
if CheckAutoLoad
{
    FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\%A_ScriptName% - Ярлык.lnk, %A_ScriptDir%,, Скрипт переназначающий клавиши, %A_IconFile%
}else{
    FileDelete, %A_Startup%\%A_ScriptName% - Ярлык.lnk
}
Gui, Destroy
return

ButtonЗакрыть:
GuiClose:
Gui, Destroy
;-------------------------<
;----- Временный отладочные клавиши ---->
F1::Reload
;------------Блок меню---------->
ScriptPaused:
vkAA::
Suspend
If A_IsSuspended
{
    Menu, Tray, Icon, ico\ScriptOff.ico
    Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nПриостановлен
    Menu, Tray, Check, Приостановить скрипт
    ; TrayTip,, Скрипт приостановлен
}
else
{
	Menu, Tray, Icon, ico\ScriptOn.ico
	Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nРаботает
    Menu, Tray, UnCheck, Приостановить скрипт
	; TrayTip,, Скрипт запущен
}
return

OpenToSciTE:
+sc115:: ; левая сенсорная кнопка
Suspend, Permit
Run SciTE\SciTE.exe "%A_ScriptFullPath%"
return

OpenScriptDir:
Run %A_ScriptDir%
return

RunKeycodesAhk:
Run Keycodes.ahk
return

RunSymbolsTable:
Run %A_WinDir%\system32\charmap.exe
return

ExitScript:
#CapsLock:: ; Win + CapsLock - > Выход из скрипта
Suspend, Permit ; чтобы не отключалась после команды Suspend
ExitApp 
return 

ReloadScript:
^CapsLock:: ; Ctrl + CapsLock -> Перезапуск
Suspend, Permit
Reload 
return

ShowKeyHistory:
KeyHistory
return

About:
MsgBox, 32, О скрипте, Это скрипт, написанный на языке AutoHotkey_L неким Lexanni для его нужд по набору на клавиатуре. В частности, он полностью меняет четвертый ряд клавиатуры в русской раскладке, а также дает возможность включать разработанную Lexanni раскладку для английского языка (MSREJ).

MSREJOnOff:
vkC0:: ; клавиша | ` | Вкл/откл раскладки MSREJ
If !NumOn
{
    If MsrejOn := !MsrejOn
    {
      Menu, Tray, Icon, ico\MsrejOn.ico
      Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nВключена раскладка MSREJ
      ; TrayTip,, MSREJ On ; всплывающая подсказка
      Menu, Tray, Check, Включить раскладку MSREJ
    }
    else
    {
      Menu, Tray, Icon, ico\ScriptOn.ico
      Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nРаботает
      ; TrayTip,, MSREJ Off
      Menu, Tray, UnCheck, Включить раскладку MSREJ
    }
}
return

RAlt:: ; Вкл/откл цифрового блока
If NumOn := !NumOn
{
  Menu, Tray, Icon, ico\NumOn.ico
  Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nNumOn
  ; TrayTip,, MSREJ On ; всплывающая подсказка
  ; Menu, Tray, Check, Включить раскладку MSREJ
}
else
{
  If MsrejOn
  {
      Menu, Tray, Icon, ico\MsrejOn.ico
      Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nВключена раскладка MSREJ
      ; TrayTip,, MSREJ On ; всплывающая подсказка
      ; Menu, Tray, Check, Включить раскладку MSREJ
  }
  else
    {
      Menu, Tray, Icon, ico\ScriptOn.ico
      Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nРаботает
      ; Menu, Tray, UnCheck, Включить раскладку MSREJ
      ; TrayTip,, MSREJ Off
    }
}
return
;--------- Блок меню ---------------<

/*--------- этот блок старый, для клавы Prestigio RacerKeyboard ----->
*LWin::LAlt
*AppsKey::LAlt
*LAlt::Send, {RAlt Down}
*LAlt Up::Send, {RAlt Up}
*$Enter::
Suspend, On
Send, {Enter}
Suspend, Off
return
*/
;-----------------------

;~ -------------- А это новый :) для acme --------------
LCtrl::PostMessage, 0x50, 2,,, A ; 0x50 is WM_INPUTLANGCHANGEREQUEST // меняем раскладку на следующую
*LWin::LCtrl

#If !LongLShift
; Когда перед клавишей написан знак $, то это значит, что для клавиши будет применен клавиатурный хук.
*$vkE2::Send, {Shift Down} ;клавиша <> ; 
vkE2 Up::Send, {Shift Up}

*$LShift::Send, {LCtrl Down}{RAlt Down}
LShift Up::Send, {LCtrl Up}{RAlt Up}
#If

*$RShift::Send, {LCtrl Down}{RAlt Down}
RShift Up::Send, {LCtrl Up}{RAlt Up}

*$RWin::Send, {LCtrl Down}{RAlt Down}
RWin Up::Send, {LCtrl Up}{RAlt Up}

*CapsLock::LCtrl
NumLock::BackSpace

*vkBF::Send, {RShift Down} ; это точка в русской раскладке MSREJ 
vkBF Up::Send, {RShift Up}

;----- Общие переназначения --------

+vk4D::Send, {u+044a}   ; ъ

; автозамены 
::мсредж::MSREJ

; | ` |
    ;~ vkC0::Send, {U+0021}       ; !    
    ;~ +vkC0::Send, {U+0025}      ; %

; | 1 |
    vk31::Send, {U+0021}       ; !    
    +vk31::Send, {U+0025}      ; %

; | 2 |    
    vk32::Send, {U+002D}       ;  1 -> - (Hyphen-Minus)
    +vk32::Send, {U+2014}      ; 1 -> — (Em Dash)
    
; | 3 |
    vk33::Send, {U+0022}       ; "
    +vk33::Send, {U+0028}      ; (

; | 4 |
    vk34::Send, {U+002E}    ; .
    +vk34::Send, {U+0029}   ; )
    <^>!vk34::Send, {U+0024}   ; $

; | 5 |
    vk35::Send, {U+002C}    ; ,
    +vk35::Send, {U+003B}   ; ;
    <^>!vk35::Send, {U+0025}   ; %
    
; | 6 |
    vk36::Send, {U+003F}    ; ?
    +vk36::Send, {U+003A}   ; :
    <^>!vk36::Send, {U+005e}   ; ^
    
; | 7 |
    vk37::Send, {U+003F}    ; ?
    +vk37::Send, {U+003A}   ; :
    
; | 8 |
    vk38::Send, {U+002C}    ; ,
    +vk38::Send, {U+003B}   ; ;
    <^>!vk38::Send, {u+002a}  ; *
    
; | 9 |
    vk39::Send, {U+002E}    ; .
    +vk39::Send, {U+0028}   ; (
    ^!vk39::Send, {U+007b}  ; {
        
; | 0 |
    vk30::Send, {U+0022}    ; "
    +vk30::Send, {U+0029}   ; )
    <^>!vk30::Send, {U+007d}  ; }
    
; | ] |
    vkDD::Send, {u+2026}    ; …

; | - |
    vkBD::Send, {U+002D}      ; -
    +vkBD::Send, {U+005f}     ; _
    <^>!vkBD::Send, {U+2014}  ; —
    
; | = |
    vkBB::Send, {U+0021}    ; !
    +vkBB::Send, {u+002b}   ; +   
    <^>!vkBB::Send, {u+003d}   ; =   
        
; | I |
    <^>!vk49::Send, {u+003c}
    
; | O |
    <^>!vk4F::Send, {u+003e}
    
; | K |
    <^>!vk4B::Send, {u+005b}    ; [
    
; | L |
    <^>!vk4C::Send, {u+005d}    ; ]
    
; ---------- Раскладка MSREJ -----------    
#If MsrejOn and !NumOn

;~ *$vkE2::Send, {Shift Down} ;клавиша <> ; 
;~ vkE2 Up::Send, {Shift Up}

; | Q |
    vk51::Send, c
    +vk51::Send,  C
    
; | W |
    vk57::Send, f
    +vk57::Send, F
    
; | E |
    vk45::Send, p
    +vk45::Send, P

; | R |
    vk52::Send, l
    +vk52::Send, L

; | T |
    vk54::Space
    +vk54::Send, {u+002a}   ; *
    
; | Y |
    vk59::Space
    +vk59::Send, {u+005e}   ; ^
    
; | U |
    vk55::Send, i
    +vk55::Send, I

; | I |
    vk49::Send, d
    +vk49::Send, D
    
; | O |
    vk4F::Send, b
    +vk4F::Send, B
    
; | P |
    vk50::Send, w
    +vk50::Send, W

; | [ |
    vkDB::Send, {u+0027}    ; '
    +vkDB::Send, {u+0060}   ; `

; | ] |
    +vkDD::Send, {u+0023}    ; #

; | A |
    vk41::Send, m
    +vk41::Send, M

; | S |
    vk53::Send, s
    +vk53::Send, S
    ^!vk53::Send, {u+00df}   ; ß

; | D |
    vk44::Send, r
    +vk44::Send, R

; | F |
    vk46::Send, e
    +vk46::Send, E

; | G |
    vk47::Send, j
    +vk47::Send, J

; | H |
    vk48::Send, x
    +vk48::Send, X

; | J |
    vk4A::Send, o
    +vk4A::Send, O
    ^!vk4A::Send, {u+00f6}   ; ö
    ^!+vk4A::Send, {u+00d6}   ; Ö

; | K |
    vk4B::Send, t
    +vk4B::Send, T

; | L |
    vk4C::Send, h
    +vk4C::Send, H

; | ; |
    vkBA::Send, u
    +vkBA::Send, U
    ^!vkBA::Send, {u+00fc}   ; ü
    ^!+vkBA::Send, {u+00dc}   ; Ü

; | ' |
    vkDE::Send, {u+002f}    ; /
    +vkDE::Send, {u+005c}   ; \

; | \ |
    ; vkDC

; | Z |
    vk5A::Send, k
    +vk5A::Send, K

; | X |
    vk58::Send, y
    +vk58::Send, Y

; | C |
    vk43::Send, a
    +vk43::Send, A
    ^!vk43::Send, {u+00e4}  ; ä
    ^!+vk43::Send, {u+00c4}  ; Ä

; | V |
    vk56::Send, v
    +vk56::Send, V

; | B |
    vk42::Send, {u+0040}    ; @
    +vk42::Send, {u+0026}   ; &

; | N |
    vk4E::Send, q
    +vk4E::Send, Q

; | M |
    vk4D::Send, n
    +vk4D::Send, N

; | , |
    vkBC::Send, g
    +vkBC::Send, G

; | . |
    vkBE::Send, z
    +vkBE::Send, Z

; | / |
;   vkBF

#If

;~ *$RAlt::
;~ RAltOn := true
;~ Send, {RAlt Down}
;~ return
;~ RAlt Up::
;~ RAltOn := false
;~ Send, {RAlt Up}
;~ return

;~ *$LAlt::
;~ RAltOn := true
;~ Send, {RAlt Down}
;~ return
;~ LAlt Up::
;~ RAltOn := false
;~ Send, {RAlt Up}
;~ return

;~ *$Space::
   ;~ Send, % RAltOn ? "{RAlt Up}{Space Down}":"{Space Down}"
   ;~ Return
;~ Space Up::
   ;~ Send, % RAltOn ? "{RAlt Down}{Space Up}":"{Space Up}"
   ;~ Return

;~ >!Space::Send, {Space Down}
;~ >!Space Up::Send, {Space Up}
;~ *LAlt::Send, {RCtrl Down}
;~ *LAlt Up::Send, {RCtrl Up}
;~ *sc38::Send, {RCtrl Down} ; сканкод ЛАльта
;~ *sc38 Up::Send, {RCtrl Up}
;~ *RAlt::Send, {RCtrl Down}
;~ *RAlt Up::Send, {RCtrl Up}
;~ Tab::Shift

;~ *vkDC::Send, {Shift Down} ; без "*" будет залипать клавиша 
;~ *vkDC Up::Send, {Shift Up}


;----- Цифры -----
#If NumOn
    vk4D::Send, {U+0031} ; | M | -> 1
    vkBC::Send, {U+0032} ; | < | -> 2
    vkBE::Send, {U+0033} ; | > | -> 3
    vk4A::Send, {U+0034} ; | J | -> 4
    vk4B::Send, {U+0035} ; | K | -> 5
    vk4C::Send, {U+0036} ; | L | -> 6
    vk55::Send, {U+0037} ; | U | -> 7
    vk49::Send, {U+0038} ; | I | -> 8
    vk4F::Send, {U+0039} ; | O | -> 9
    vkBA::Send, {U+0030} ; | P | -> 0
#If
;-----------------
/*
;----- Цифры (старые) -----
#If NumON
    vk41::Send, {U+0031} ; A -> 1
    vk53::Send, {U+0032} ; S -> 2
    vk44::Send, {U+0033} ; D -> 3
    vk46::Send, {U+0034} ; F -> 4
    vk56::Send, {U+0035} ; V -> 5
    vk4E::Send, {U+0036} ; N -> 6
    vk4A::Send, {U+0037} ; J -> 7
    vk4B::Send, {U+0038} ; K -> 8
    vk4C::Send, {U+0039} ; L -> 9
    vkBA::Send, {U+0030} ; ; -> 0
    vkBC::Send, {U+002C} ; , -> ,
    vkBE::Send, {U+002E} ; . -> .
    vk58::Send, {U+002E} ; X -> .
    vk43::Send, {U+002C} ; C -> ,
#If
;-----------------
*/

/* ---- На память -->

+CapsLock:: ; Вкл/откл цифровой раскладки. CapsLock все еще можно включить, нажав его с Alt ;)
If NumON := !NumON
{
  Menu, Tray, Icon, NumOn.ico
  Menu, Tray, Tip, Включена цифровая раскладка
  TrayTip,, NumOn ; всплывающая подсказка
}
else
{
  Menu, Tray, Icon, ScriptOn.ico
  Menu, Tray, Tip, Работает! :)
  TrayTip,, NumOff
}
return

CapsLock:: ;LShift + CapsLock -> Включение/отключение всех горячих клавиш
Suspend
If A_IsSuspended
{
    Menu, Tray, Icon, ScriptOff.ico
    Menu, Tray, Tip, Скрипт выключен :(
    TrayTip,, Выключено
}
else
{
	Menu, Tray, Icon, ScriptOn.ico
	Menu, Tray, Tip, Работает! :)
	TrayTip,, Банзай %A_UserName%! :)
}
return
*/
/*
; На память:
; 0x4090409 Eng, 0x4190419 Rus
; 67699721  Eng, 68748313  Rus

;-------- Нетронутый блок с форума ----------->
;~ F11:: ;выдает идентификатор локали 
  ;~ SetFormat, Integer, H
  ;~ WinGet, WinID,, A
  ;~ ThreadID:=DllCall("GetWindowThreadProcessId", UInt, WinID, UInt, 0)
  ;~ InputLocaleID:=DllCall("GetKeyboardLayout", UInt, ThreadID, UInt)
  ;~ MsgBox, %InputLocaleID%
;~ Return
;---------------------------------------------< 
*/
/*
F11:: ; Вывести список локалей, среди которых возможно переключение
  Count:=DllCall("GetKeyboardLayoutList", UInt, 0, UInt, 0)
  VarSetCapacity(Buf, Count*4)
  DllCall("GetKeyboardLayoutList", UInt, Count, UInt, &Buf)
  List:=""
  SetFormat, Integer, H
  Loop, % Count
    List.=NumGet(Buf, (A_Index-1)*4) . "`n"
  MsgBox, % List
Return
RuLangOn := IfRuLangOn()
IfRuLangOn()
{
    global RuLangOn ; чтобы обратиться к глобальной переменной вне блока функции
    SetFormat, Integer, H
    WinGet, WinID,, A
    ThreadID:=DllCall("GetWindowThreadProcessId", UInt, WinID, UInt, 0)
    InputLocaleID:=DllCall("GetKeyboardLayout", UInt, ThreadID, UInt)
    RuLangOn := % (InputLocaleID = 0x4190419) ? true : false ; помогло использование <>, вместо =
    return RuLangOn
}
F12::ListVars
*/