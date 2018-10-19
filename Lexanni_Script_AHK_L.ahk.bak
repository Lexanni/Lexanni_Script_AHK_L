/*
*
*  Lexanni Script
*
*/
Process, Priority, , Realtime
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode, Event ; при SendMode, Input возникают тормоза из-за того, что в этом скрипте или в каком-нибудь другом установлен хук клавиатуры. Именно из-за этого SendInput превращяется в тормознутого зверя. Хотя странно все это… Ведь тормоза наблюдаются не на всех клавах!
SetKeyDelay, 10
SetTitleMatchMode, RegEx
#InstallKeybdHook
SetWorkingDir %A_ScriptDir%
#Include %A_ScriptDir%\Include\

NumOn := false
KState := 1

;~ IniRead, LCtrlAsAltGr, LayoutOptions.ini, MAIN, LCtrlAsAltGr
;~ IniRead, LongLShift, LayoutOptions.ini, MAIN, LongLShift
IniRead, ShortBS, LayoutOptions.ini, MAIN, ShortBS
IniRead, StartSuspended, LayoutOptions.ini, MAIN, StartSuspended
;~ IniRead, StickyKeys, LayoutOptions.ini, MAIN, StickyKeys
IniRead, NumAutoOff, LayoutOptions.ini, MAIN, NumAutoOff
IniRead, FRow, LayoutOptions.ini, MAIN, FRow
IniRead, SoundKeyOn, LayoutOptions.ini, MAIN, SoundKeyOn


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
Menu, Tray, Add, Скрипт MouseGetPos, RunMouseGetPos
Menu, Tray, Add, KeyHistory, ShowKeyHistory
Menu, Tray, Add,
Menu, Tray, Add, Выключать NUM-слой после пробела, NumAutoOffOnOff
Menu, Tray, Add, Мой F-ряд, FRowOnOff
Menu, Tray, Add, Звук стрелками, SoundKey
Menu, Tray, Add, Включить раскладку MSREK, MSREKOnOff
;~ Menu, Tray, Add, Танковый режим, TankMode
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

/*
KState:
1 — StickyOn, Ru
2 — StickyOn, En
3 — StickyON, NumOn
4 — StickyOff, Ru
5 — StickyOff, En
6 — StickyOff, NumOn
7 – Navigation
*/

if StartSuspended
{
    Suspend
    Menu, Tray, Icon, ico\ScriptOff.ico
    Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nПриостановлен
    Menu, Tray, Check, Приостановить скрипт
}

if NumAutoOff
{
    Menu, Tray, Check, Выключать NUM-слой после пробела
} else {
    Menu, Tray, UnCheck, Выключать NUM-слой после пробела
}

if FRow
{
    Menu, Tray, Check, Мой F-ряд
} else {
    Menu, Tray, UnCheck, Мой F-ряд
}

if SoundKeyOn
{
    Menu, Tray, Check, Звук стрелками
} else {
    Menu, Tray, UnCheck, Звук стрелками
}
return

;----- Окно настроек ----->
LayoutOptions:
Gui, +ToolWindow ; -SysMenu
Gui, Margin, 15, 15
;~ Gui, font, s12 cBlue
;~ Gui, add, Text, H30, Опции
;~ Gui, font,
;~ Gui, add, Checkbox, Checked%LCtrlAsAltGr% vLCtrlAsAltGr, Левый Control как AltGr
;~ Gui, add, Checkbox, Checked%LongLShift% vLongLShift, Длиный левый Shift
;~ Gui, add, Checkbox, Checked%ShortBS% vShortBS, Короткий BackSpace
Gui, add, Checkbox, Checked%StartSuspended% vStartSuspended, Запускать приостановленным
IfExist, %A_Startup%\%A_ScriptName% - Ярлык.lnk
{    
    CheckAutoLoad := true
}else{
    CheckAutoLoad := false
}
Gui, add, Checkbox, Checked%CheckAutoLoad% vCheckAutoLoad, Поместить в автозагрузку
;~ Gui, add, Checkbox, Checked%StickyKeys% vStickyKeys, Включить залипание Shift'a
Gui, add, Button,  Section w60, Принять
Gui, add, Button, wp ys, Закрыть
Gui, Show,, Опции
return

ButtonПринять:
Gui, Submit, NoHide
;~ IniWrite, %LCtrlAsAltGr%, LayoutOptions.ini, MAIN, LCtrlAsAltGr
;~ IniWrite, %LongLShift%, LayoutOptions.ini, MAIN, LongLShift
IniWrite, %ShortBS%, LayoutOptions.ini, MAIN, ShortBS
IniWrite, %StartSuspended%, LayoutOptions.ini, MAIN, StartSuspended
;~ IniWrite, %SoundKeyOn%, LayoutOptions.ini, MAIN, SoundKeyOn
;~ IniWrite, %StickyKeys%, LayoutOptions.ini, MAIN, StickyKeys
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
return
;-------------------------<

;------------Блок меню---------->
RunKGA:
Run KG-Assistant\KG-Assistant.ahk
return

ScriptPaused:
Insert::
;~ vkB5::
;~ ScrollLock::
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
;~ +sc115:: ; левая сенсорная кнопка
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

RunMouseGetPos:
Run OtherScripts\MouseGetPos.ahk
return

RunSymbolsTable:
Run %A_WinDir%\system32\charmap.exe
return

ExitScript:
;~ ScrollLock & F11::
Suspend, Permit ; чтобы не отключалась после команды Suspend
ExitApp 
return 

ReloadScript:
;~ ScrollLock & F12::
Suspend, Permit
Reload 
return

ShowKeyHistory:
KeyHistory
return

About:
MsgBox, 32, О скрипте, Это скрипт, написанный на языке AutoHotkey_L. Написан Lexanni для адаптации клавиатур «под себя». Именно этот скрипт виноват в том, что клавиатура ведет себя как-то непонятно. :) Не беспокойтесь! Просто нажмите на значок £ в системном лотке правой кнопкой мыши и выберите «Приостановить скрипт». Либо можно его просто выключить, нажав на «Выход». Для того, чтобы скрипт не запускался при старте системы, зайдите в Опции и снимите галочку напротив «Поместить в автозагрузку».
return

NumAutoOffOnOff:
If NumAutoOff := !NumAutoOff
{
    Menu, Tray, Check, Выключать NUM-слой после пробела
} else {
    Menu, Tray, UnCheck, Выключать NUM-слой после пробела
}
IniWrite, %NumAutoOff%, LayoutOptions.ini, MAIN, NumAutoOff
return

SoundKey:
If SoundKeyOn := !SoundKeyOn
{
    Menu, Tray, Check, Звук стрелками
} else {
    Menu, Tray, UnCheck, Звук стрелками
}
IniWrite, %SoundKeyOn%, LayoutOptions.ini, MAIN, SoundKeyOn
return

FRowOnOff:
Pause::
if FRow := !FRow
{
    Menu, Tray, Check, Мой F-ряд
} else {
    Menu, Tray, UnCheck, Мой F-ряд
}
IniWrite, %FRow%, LayoutOptions.ini, MAIN, FRow
return

; #1:: SendMessage, 0x50,, 0x4090409,, A ; английский
; #2:: SendMessage, 0x50,, 0x4190419,, A ; русский

MSREKOnOff:
*Right::
;~ vkC0:: ; клавиша | ` | Вкл/откл раскладки MSREK
~RShift Up:: ; Продолжает работать как Shift, но меняет раскладку по отпусканию клавиши
;~ PostMessage, 0x50, 2,,, A ; 0x50 is WM_INPUTLANGCHANGEREQUEST // меняем раскладку на следующую
If !NumOn
{
    If EngLayoutOn := !EngLayoutOn
    {
      ;~ SendMessage, 0x50,, 0x4090409,, A ; английский
      KState := 2
      Menu, Tray, Icon, ico\EngLayoutOn.ico
      Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nВключена раскладка MSREK
      ; TrayTip,, MSREK On ; всплывающая подсказка
      Menu, Tray, Check, Включить раскладку MSREK
    }
    else
    {
      ;~ SendMessage, 0x50,, 0x4190419,, A ; русский
      KState := 1
      Menu, Tray, Icon, ico\ScriptOn.ico
      Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nРаботает
      ; TrayTip,, MSREK Off
      Menu, Tray, UnCheck, Включить раскладку MSREK
    }
} else { 
    NumOn := false
    If EngLayoutOn
    {
      ;~ SendMessage, 0x50,, 0x4090409,, A ; английский
      KState := 2
      Menu, Tray, Icon, ico\EngLayoutOn.ico
      Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nВключена раскладка MSREK
    } else {
      ;~ SendMessage, 0x50,, 0x4190419,, A ; русский
      KState := 1
      Menu, Tray, Icon, ico\ScriptOn.ico
      Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nРаботает
    }
}
;~ KeyWait, LShift
return
/*
~RShift::
    NumOn :=false
    EngLayoutOn := true
    KState := 2
    Menu, Tray, Icon, ico\EngLayoutOn.ico
    Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nВключена раскладка MSREK
    ; TrayTip,, MSREK On ; всплывающая подсказка
    Menu, Tray, Check, Включить раскладку MSREK
return
RCtrl::
; vkDC::
    NumOn :=false
    EngLayoutOn := false
    KState := 1
    Menu, Tray, Icon, ico\ScriptOn.ico
    Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nРаботает
    ; TrayTip,, MSREK Off
    Menu, Tray, UnCheck, Включить раскладку MSREK
return
*/

;~ #Include TankMode.ahk        ; для настройки скрипта для работы с WoT

AppsKey::RControl


<!Tab::Send, !{Tab}

LWin::LShift                    ; спустя столько лет, додумался поставить сюда Shift! :)) Ну красава, че… XD И как я только жил без него годы?

;~ *LAlt::
;~ *RCtrl::
AltOnOff:
If NumOn := !NumOn
{
  ;~ KState := 3
  Menu, Tray, Icon, ico\NumOn.ico
  Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nNumOn
} else {
 
  If EngLayoutOn
  {
      KState := 2
      Menu, Tray, Icon, ico\EngLayoutOn.ico
      Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nВключена раскладка MSREK
  }
  ;~ else if TgOn
    ;~ {
      ;~ Menu, Tray, Icon, ico\TgOn.ico
      ;~ Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nTgOn
    ;~ 
  else
    {
      KState := 1
      Menu, Tray, Icon, ico\ScriptOn.ico
      Menu, Tray, Tip, Lexanni Script AutoHotkey_L `nСкрипт переназначающий клавиши `nРаботает
    }
}
return

;--------- Блок меню ---------------< 

*RAlt::
    ;~ *vkDC::
    gosub, AltOnOff
    KeyWait, RAlt
    KeyWait, vkDC
    gosub, AltOnOff
return

*vk32::
    ;~ *vkDC::
    gosub, AltOnOff
    KeyWait, vk32
    ; KeyWait, vkDC
    gosub, AltOnOff
return

*vk31::
    tmp := KState
    KState := 7
    KeyWait, vk31
    KState := tmp
return 

; SoundKey
#If SoundKeyOn
    F11::Volume_Up
    F10::Volume_Down
#If

; =============================================================
; Переключение рабочих столов по дополнительным клавишам мыши ;
; =============================================================
    XButton1::SendEvent, #{Tab}  ; 4-я клавиша    
    XButton2::                   ; 5-я клавиша
        if (val1 := !val1)
            SendEvent, #^{Right}
        else
            SendEvent, #^{Left}
    return

;==============================================================

; <^RShift::PostMessage, 0x50, 2,,, A ; 0x50 is WM_INPUTLANGCHANGEREQUEST // меняем раскладку на следующую

*$vkC0::Tab

RShift & Del::Send, +{Del}
*$RWin::SendEvent, {Delete Down}
RWin Up::SendEvent, {Delete Up}

;~ #If StickyKeys
    *vkDE:: ; Э в ЙЦУКЕН  работает как Shift
        ShiftOn := true
        KeyWait, vkDE
        ShiftOn := false
    return 
    *CapsLock::     ; работает как Shift
        ShiftOn := true
        ;~ Send, {LShift Down}
        KeyWait, CapsLock
        ;~ Send, {LShift Up}
        ShiftOn := false
    return
;~ *vk42::return ; И в ЙЦУКЕН
;~ *RShift::return

*$Up::return
*$Down::SendEvent, {RCtrl Down}
Down Up::SendEvent, {RCtrl Up}

*vk42::             ; модификатор для "первого" символьного слоя (клавиша И)
    SLOn := true
    KeyWait, vk42
    SLOn := false
return

*Left::             ; модификатор для "второго" символного слоя (клавиша Влево)
    LeftOn := true
    KeyWait, Left
    LeftOn := false
return

;~ *Right::             ; модификатор для "третьего" символного слоя (клавиша Вправо)
    ;~ RightOn := true
    ;~ KeyWait, Right
    ;~ RightOn := false
;~ return

;~ *Right::             ; модификатор для "третьего" символного слоя (клавиша Вправо)
    ;~ gosub, AltOnOff
    ;~ KeyWait, Right
    ;~ gosub, AltOnOff
;~ return

; -------------------------------------этот блок для "сброса" запущенного залипания 
*vkBF::return ; точка в ЙЦУКЕН
*vkE2::return ;клавиша <>
~BackSpace::return
~Space::return
; -------------------------------------

NumLock::BackSpace      ; одинокое потерянное переназначение ! :))
PGUP::SendEvent, {WheelUp}
PGDN::SendEvent, {WheelDown}

; ------------------------------------- Блок для Майнкрафта
/*
F10::
Suspend, Permit
Send, {Del}
Sleep, 100
SendRaw, /home
Send, {Enter}
return

F9::
Suspend, Permit
Send, {Del}
Sleep, 100
SendRaw, /rg info
Send, {Enter}
return

F8::
Suspend, Permit
Send, {Del}
Sleep, 500
SendRaw, /warp delete lexx
Send, {Enter}
Sleep, 3000
Send, {Del}
Sleep, 500
SendRaw, /warp pset lexx
Sleep, 3000
Send, {Enter}
;~ Sleep, 2000
;~ Send, {Enter}
;~ Sleep, 200
;~ SendRaw, /warp invite Korsar31 lexx
;~ Send, {Enter}
return
*/
;--------------------------------------------

; --------------------------------------------------- Includ'ы

#Include SymbolsLayers.ahk
#Include LCtrlLayer.ahk
#Include Num.ahk
;~ #Include FourRowTrans.ahk
;~ #Include MSREK.ahk
#Include ВЛАЕЗ_залипание.ahk
;~ #Include ВЛАЕЗ.ahk
#Include MSREK_Sticky.ahk
;~ #Include Typography.ahk
#Include RightKeyLayer.ahk
#Include LeftKeyLayer.ahk
#Include NavigationLayer.ahk


; ----------------------------------------------------


; Некоторые вещи на память –––––––––––––––>

; f12::Send, {u+2744}  ;
/*
; На память:
; 0x4090409 Eng, 0x4190419 Rus
; 67699721  Eng, 68748313  Rus

;-------- Нетронутый блок с форума ----------->
F11:: ;выдает идентификатор локали 
  SetFormat, Integer, H
  WinGet, WinID,, A
  ThreadID:=DllCall("GetWindowThreadProcessId", UInt, WinID, UInt, 0)
  InputLocaleID:=DllCall("GetKeyboardLayout", UInt, ThreadID, UInt)
  MsgBox, %InputLocaleID%
Return
;---------------------------------------------< 
*/
