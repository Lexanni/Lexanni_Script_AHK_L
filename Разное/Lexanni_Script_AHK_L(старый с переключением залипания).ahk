/*
*
*  Lexanni Script
*
*/
Process, Priority, , High
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input
SetWorkingDir %A_ScriptDir%
#Include %A_ScriptDir%\Include\

NumOn := false

IniRead, LCtrlAsAltGr, LayoutOptions.ini, MAIN, LCtrlAsAltGr
IniRead, LongLShift, LayoutOptions.ini, MAIN, LongLShift
IniRead, ShortBS, LayoutOptions.ini, MAIN, ShortBS
IniRead, StartSuspended, LayoutOptions.ini, MAIN, StartSuspended
IniRead, StickyKeys, LayoutOptions.ini, MAIN, StickyKeys
;~ IniRead, UseMSREK, LayoutOptions.ini, MAIN, UseMSREK
;~ IniRead, UseWYLO, LayoutOptions.ini, MAIN, UseWYLO

Menu, Tray, NoStandard                          ; удаляем стандартные пункты меню (не пользовательские)
Menu, Tray, Icon, ico\ScriptOn.ico, , 1         ; устанавливаем значек при запуске, "замораживаем" его чтобы не менялся на значек "S" при остановке скрипта
Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nРаботает ; всплывающая подсказка, при наведении курсора
Menu, Tray, Add, О скрипте, About
Menu, Tray, Add, Открыть папку скрипта, OpenScriptDir
Menu, Tray, Add, Открыть скрипт в SciTE, OpenToSciTE   ; создаем свои меню значка в трее
Menu, Tray, Add, Вызвать таблицу символов, RunSymbolsTable
Menu, Tray, Add, Опции, LayoutOptions
Menu, Tray, Add, Запуск KG-Assistant, RunKGA
Menu, Tray, Add, Определялка скан-кодов, RunKeycodesAhk
Menu, Tray, Add, Скрипт набора vk..-кодами, RunTypingKeycodes
Menu, Tray, Add, KeyHistory, ShowKeyHistory
Menu, Tray, Add,
Menu, Tray, Add, Включить раскладку MSREK, MSREKOnOff
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
;~ Gui, add, Radio, vUseMSREK Checked%UseMSREK%, Использовать MSREK
;~ Gui, add, Radio, vUseWYLO Checked%UseWYLO%, Использовать WYLO
Gui, add, Checkbox, Checked%LCtrlAsAltGr% vLCtrlAsAltGr, Левый Control как AltGr
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
Gui, add, Checkbox, Checked%StickyKeys% vStickyKeys, Включить залипание Shift'a
Gui, add, Button,  Section w60, Принять
Gui, add, Button, wp ys, Закрыть
Gui, Show,, Опции
return

ButtonПринять:
Gui, Submit, NoHide
IniWrite, %LCtrlAsAltGr%, LayoutOptions.ini, MAIN, LCtrlAsAltGr
IniWrite, %LongLShift%, LayoutOptions.ini, MAIN, LongLShift
IniWrite, %ShortBS%, LayoutOptions.ini, MAIN, ShortBS
IniWrite, %StartSuspended%, LayoutOptions.ini, MAIN, StartSuspended
IniWrite, %StickyKeys%, LayoutOptions.ini, MAIN, StickyKeys
;~ IniWrite, %UseMSREK%, LayoutOptions.ini, MAIN, UseMSREK
;~ IniWrite, %UseWYLO%, LayoutOptions.ini, MAIN, UseWYLO

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

;------------Блок меню---------->
RunKGA:
Run KG-Assistant\KG-Assistant.ahk
return

ScriptPaused:
ScrollLock::
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
	Menu, Tray, Icon, % (EngLayoutOn <> true) ? "ico\ScriptOn.ico" : "ico\EngLayoutOn.ico"
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
Run OtherScripts\Keycodes.ahk
return

RunTypingKeycodes:
Run OtherScripts\TypingKeycodes.ahk
Menu, Tray, Icon, ico\ScriptOff.ico
Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nПриостановлен
Menu, Tray, Check, Приостановить скрипт
Suspend, On
return

RunSymbolsTable:
Run %A_WinDir%\system32\charmap.exe
return

ExitScript:
F11 & ScrollLock::
Suspend, Permit ; чтобы не отключалась после команды Suspend
ExitApp 
return 

ReloadScript:
F12 & ScrollLock::
Suspend, Permit
Reload 
return

ShowKeyHistory:
KeyHistory
return

About:
MsgBox, 32, О скрипте, Это скрипт, написанный на языке AutoHotkey_L неким Lexanni для его нужд по набору на клавиатуре.
return

MSREKOnOff:
;~ vkC0:: ; клавиша | ` | Вкл/откл раскладки MSREK
~RShift:: ; Продолжает работать как Shift
If !NumOn and !TgOn
{
    If EngLayoutOn := !EngLayoutOn
    {
      Menu, Tray, Icon, ico\EngLayoutOn.ico
      Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nВключена раскладка MSREK
      ; TrayTip,, MSREK On ; всплывающая подсказка
      Menu, Tray, Check, Включить раскладку MSREK
    }
    else
    {
      Menu, Tray, Icon, ico\ScriptOn.ico
      Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nРаботает
      ; TrayTip,, MSREK Off
      Menu, Tray, UnCheck, Включить раскладку MSREK
    }
}
KeyWait, LShift
return
AppsKey::Del
LAlt::
RAlt::
;~ RCtrl:: ; Вкл/откл цифрового блока  
If NumOn := !NumOn
{
  TgOn := false
  Menu, Tray, Icon, ico\NumOn.ico
  Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nNumOn
}
else
{
  If EngLayoutOn
  {
      Menu, Tray, Icon, ico\EngLayoutOn.ico
      Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nВключена раскладка MSREK
  }
  ;~ else if TgOn
    ;~ {
      ;~ Menu, Tray, Icon, ico\TgOn.ico
      ;~ Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nTgOn
    ;~ } 
  else
    {
      Menu, Tray, Icon, ico\ScriptOn.ico
      Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nРаботает
    }
}
return

;~ vkDC:: ; Вкл/откл типографического слоя 
;~ If TgOn := !TgOn
;~ {
  ;~ NumOn := false
  ;~ Menu, Tray, Icon, ico\TgOn.ico
  ;~ Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nTgOn
;~ }
;~ else
;~ {
  ;~ If EngLayoutOn
  ;~ {
      ;~ Menu, Tray, Icon, ico\EngLayoutOn.ico
      ;~ Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nВключена раскладка MSREK
  ;~ }
  ;~ else if NumOn
    ;~ {
      ;~ Menu, Tray, Icon, ico\NumOn.ico
      ;~ Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nNumOn
    ;~ }
  ;~ else
    ;~ {
      ;~ Menu, Tray, Icon, ico\ScriptOn.ico
      ;~ Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nРаботает
    ;~ }
;~ }
;~ return
;--------- Блок меню ---------------<

;~ LCtrl::PostMessage, 0x50, 2,,, A ; 0x50 is WM_INPUTLANGCHANGEREQUEST // меняем раскладку на следующую
*$LWin::Send, {LCtrl Down}
*LWin Up::Send, {LCtrl Up}

*$vkC0::Tab

;~ RShift::MsgBox,,, % A_PriorHotkey

#If LCtrlAsAltGr
*$LCtrl::SendEvent, {RShift Down}
*LCtrl Up::SendEvent, {RShift Up}
#If
;~ *vk31::Send, {RShift Down}
;~ *vk31 up::Send, {RShift Up}

;~ #If !LongLShift and !ExpRuLayout
    ; Когда перед клавишей написан знак $, то это значит, что для клавиши будет применен клавиатурный хук.
    ;~ *$vkE2::SendEvent, {LShift Down} ;клавиша <> ; 
    ;~ vkE2 Up::SendEvent, {LShift Up}

    ;~ *$LShift::Send, {Tab Down}
    ;~ *LShift Up::Send, {Tab Up}
;~ #If

;~ *$RShift::SendEvent, {LCtrl Down}{RAlt Down}
;~ *RShift Up::SendEvent, {LCtrl Up}{RAlt Up}

;~ *$RWin::SendEvent, {LCtrl Down}{RAlt Down}
;~ RWin Up::SendEvent, {LCtrl Up}{RAlt Up}

*$RWin::SendEvent, {RCtrl Down}
RWin Up::SendEvent, {RCtrl Up}

#If StickyKeys
    *vkDE:: ; Э в ЙЦУКЕН
        ShiftOn := true
        KeyWait, vkDE
        ShiftOn := false
    return 
    *CapsLock::
        ShiftOn := true
        KeyWait, CapsLock
        ShiftOn := false
    return
*vk42::return ; И в ЙЦУКЕН
*RShift::return
*vkBF::return ; точка в ЙЦУКЕН
*vkE2::return ;клавиша <>
#If
#If !StickyKeys
    *$CapsLock::SendEvent, {LShift Down}
    *CapsLock Up::SendEvent, {LShift Up}

    *$vkDE::SendEvent, {LShift Down} ; клавиша | ' |
    *vkDE Up::SendEvent, {LShift Up}
#If
;~ *vkC0::Enter
NumLock::BackSpace

;~ #If !EngLayoutOn 
;~ *vkBF::SendEvent, {LShift Down} ; это точка в русской раскладке
;~ vkBF Up::SendEvent, {LShift Up}
;~ #If
;----- Общие переназначения -------- 

;~ +vk4D::Send, {u+044a}   ; ъ

;~ #If EngLayoutOn and UseWYLO and !NumOn
    ;~ #Include WYLO.ahk
;~ #If

;~ #If EngLayoutOn and !NumOn and !TgOn
    ;~ #If StickyKeys
        ;~ #Include MSREK_Sticky.ahk
        ;~ *vkDE::return
        ;~ *CapsLock::return
    ;~ #If 
    ;~ #If !StickyKeys
        ;~ #Include MSREK.ahk
    ;~ #If
;~ #If
;~ #If !EngLayoutOn and !NumOn and !TgOn
    ;~ #If StickyKeys
        ;~ #Include ВЛАЕЗ_залипание.ahk
        ;~ *vkDE::return
        ;~ *CapsLock::return
    ;~ #If 
    ;~ #If !StickyKeys
        ;~ #Include ВЛАЕЗ.ahk
    ;~ #If
;~ #If
#Include FourRow.ahk
#Include MSREK_Sticky.ahk
#Include MSREK.ahk
#Include ВЛАЕЗ_залипание.ahk
#Include ВЛАЕЗ.ahk
#Include Num.ahk
;~ #Include Typography.ahk
; автозамены
;~ ::мсредж::MSREK
;~ :?*:йо::ё
;~ :?*:ьь::{u+044a}

;~ #InputLevel 1
;~ ::vvv::
;~ Send, ö
;~ return
;~ #InputLevel 0
 
;~ *$Space::
   ;~ Send, % RAltOn ? "{RAlt Up}{Space Down}":"{Space Down}"
   ;~ Return
;~ Space Up::
   ;~ Send, % RAltOn ? "{RAlt Down}{Space Up}":"{Space Up}"
   ;~ Return


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
