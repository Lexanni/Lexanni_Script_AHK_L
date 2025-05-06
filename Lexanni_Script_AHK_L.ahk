/*
*
*  Lexanni Script
*
*/

Process, Priority, , Realtime
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode, Event ; at SendMode, Input sometimes there are unknown freezes, but this is not true. :)
SetKeyDelay, 10
SetTitleMatchMode, RegEx
#InstallKeybdHook
SetWorkingDir %A_ScriptDir%
#Include %A_ScriptDir%\Include\

baseTip := "Lexanni_Script_AHK v2.1`nСкрипт переназначающий клавиши"

state := Object()
state.Layout  := "EN"
state.ShiftOn := false
state.NumOn   := false
state.SymOn   := false
state.NavOn   := false
state.StickyShiftOn := true
state.StickySymOn   := true

IniRead, StartSuspended, LayoutOptions.ini, MAIN, StartSuspended

Menu, Tray, NoStandard
Menu, Tray, Icon, ico\ScriptOn.ico, , 1
Menu, Tray, Tip, %baseTip%
Menu, Tray, Add, О скрипте, About
Menu, Tray, Add, Открыть папку скрипта, OpenScriptDir
Menu, Tray, Add, Открыть скрипт в SciTE, OpenToSciTE   ; создаем свои меню значка в трее
Menu, Tray, Add, Вызвать таблицу символов, RunSymbolsTable
Menu, Tray, Add, Опции, LayoutOptions

Menu, OtherScripts, Add, Запуск KG-Assistant, RunKGA
Menu, OtherScripts, Add, Определялка скан-кодов, RunKeycodesAhk
Menu, OtherScripts, Add, Скрипт набора vk..-кодами, RunTypingKeycodes
Menu, OtherScripts, Add, Скрипт MouseGetPos, RunMouseGetPos
Menu, Tray, Add, Другие скрипты, :OtherScripts

Menu, FastLocations, Add, Network Connections, OpenNetworkConnections
Menu, FastLocations, Add, Control Panel, OpenControlPanel
Menu, FastLocations, Add, Printers, OpenPrinters
Menu, Tray, Add, Locations, :FastLocations

Menu, MenuLayouts, Add, MSREK, ToggleLayout
Menu, MenuLayouts, Add, ВЛАЕЗ, ToggleLayout
Menu, Tray, Add, Layouts, :MenuLayouts

Menu, Tray, Add, KeyHistory, ShowKeyHistory
Menu, Tray, Add,

Menu, Tray, Add, Приостановить скрипт, ScriptPaused
Menu, Tray, Add,
Menu, Tray, Add, Перезапуск, ReloadScript
Menu, Tray, Add, Выход, ExitScript

Menu, Tray, Icon, О скрипте, Shell32.dll, 278
Menu, Tray, Icon, Открыть скрипт в SciTE, SciTE\SciTE.exe
Menu, Tray, Icon, Вызвать таблицу символов, %A_WinDir%\system32\charmap.exe
Menu, Tray, Icon, Перезапуск, Shell32.dll, 239
Menu, Tray, Icon, Опции, dsuiext.dll, 36
Menu, Tray, Icon, Выход, Shell32.dll, 28

if StartSuspended
    Suspend

UpdateTrayState() {
    global state
    global baseTip

    if A_IsSuspended {
        Menu, Tray, Icon, ico\ScriptOff.ico
        Menu, Tray, Tip, %baseTip%`nНа паузе
        Menu, Tray, Check, Приостановить скрипт
        return
    } else {
        Menu, Tray, UnCheck, Приостановить скрипт
    }

    if (state.Layout = "EN") {
        Menu, Tray, Icon, ico\EngLayoutOn.ico
        Menu, Tray, Tip, %baseTip%`nВключена раскладка MSREK
        Menu, MenuLayouts, Check, MSREK
        Menu, MenuLayouts, UnCheck, ВЛАЕЗ
    } else {
        Menu, Tray, Icon, ico\ScriptOn.ico
        Menu, Tray, Tip, %baseTip%`nВключена раскладка ВЛАЕЗ
        Menu, MenuLayouts, Check, ВЛАЕЗ
        Menu, MenuLayouts, UnCheck, MSREK
    }
}

UpdateTrayState()

return ; Init end

; --- Label and Hotkeys ------>

OpenNetworkConnections:
    Run, ::{7007acc7-3202-11d1-aad2-00805fc1270e}
return

OpenControlPanel:
    Run, ::{21ec2020-3aea-1069-a2dd-08002b30309d}
return

OpenPrinters:
    Run, ::{2227a280-3aea-1069-a2de-08002b30309d}
return

;--- Options window -----------

LayoutOptions:
    Gui, +ToolWindow ; -SysMenu
    Gui, Margin, 15, 15
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
return

RunKGA:
    Run KG-Assistant\KG-Assistant.ahk
return

ScriptPaused:
Insert::
RAlt & RShift::
    Suspend
    UpdateTrayState()
return

OpenToSciTE:
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
    Suspend, Permit ; чтобы не отключалась после команды Suspend
    ExitApp
return

ReloadScript:
    Suspend, Permit
    Reload
return

ShowKeyHistory:
    KeyHistory
return

About:
    MsgBox, 32, О скрипте, Это скрипт, написанный на языке AutoHotkey_L. Написан Lexanni для адаптации клавиатур «под себя». Именно этот скрипт виноват в том, что клавиатура ведет себя как-то непонятно. :) Не беспокойтесь! Просто нажмите на значок £ в системном лотке правой кнопкой мыши и выберите «Приостановить скрипт». Либо можно его просто выключить, нажав на «Выход». Для того, чтобы скрипт не запускался при старте системы, зайдите в Опции и снимите галочку напротив «Поместить в автозагрузку».
return

ToggleLayout:
RShift::
    if (state.Layout = "EN")
        state.Layout := "RU"
    else
        state.Layout := "EN"

    UpdateTrayState()
    KeyWait, RShift
return

; --- Numbers layer -----------

~LAlt::
    state.NumOn := true
return

~LAlt Up::
    state.NumOn := false
    if (A_PriorHotkey = "~LAlt") {
        Send, {LAlt Down}{LAlt Up} ; for reset Alt menu activation
    }
return

~RAlt::
    state.NumOn := true
return

~RAlt Up::
    state.NumOn := false
    if (A_PriorHotkey = "~RAlt") {
        Send, {RAlt Down}{RAlt Up} ; for reset Alt menu activation
    }
return

LAlt & Tab::AltTab

; --- Shift layer -------------

*vkDE:: ; [ ' ]
    state.ShiftOn := true
    KeyWait, vkDE
    state.ShiftOn := false
return

*CapsLock::
    state.ShiftOn := true
    KeyWait, CapsLock
    state.ShiftOn := false
return

; --- Symbols layer ––––––––––-

*vk42:: ; [ B ]
    state.SymOn := true
    KeyWait, vk42
    state.SymOn := false
return

; --- Navigation layer --------

*vkC0::
    state.NavOn := true
    KeyWait, vkC0
    state.NavOn := false
return

; --- Other -------------------
~BackSpace::return      ; for reset sticky modifiers
$*Space::Send, {Space}  ; for disable Modifier+Space shortcuts

; --- mouse wheel emulation ---

;~ PGUP::SendEvent, {WheelUp}
;~ PGDN::SendEvent, {WheelDown}

; --- Includes ----------------

#Include NavigationLayer.ahk
;~ #Include NavigationLayerExp.ahk
#Include Symbols.ahk
#Include Num.ahk
#Include ВЛАЕЗ.ahk
#Include MSREK.ahk
