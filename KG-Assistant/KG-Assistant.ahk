Name := "KG-Assistant"
Version := "Версия 1.1.1`t28 декабря 2012 года`n©Lexanni"
/*
История изменений:
Версия 1.1:
- Поправил RegExReplace для запуска игры по словарю
- Управляющие кнопки работают теперь только на страницах Клавогонок
- Если нажать на F4 не на закладке, то кнопка "замерзала" - fix
- В Хроме и в Опере теперь можно по комбинации F4+F1 делать закладки на на быстрый старт по словарю, на странице которого вы находитесь.
  Параметры заезда будут те же, что указаны во всплывашке. Режим во всплывашке значения не имеет.
- Расширена подпись к имени закладки для закладок на открытые заезды. Теперь она будет вида (один. 5 сек Т-Г), где Т и Г - первые буквы имен рангов
- Изменено управление изменения рангов. Теперь для того, чтобы поменять нижний порог, нужно будет зажав F1 и ПКМ  и покрутить колесико, а верхний — F2 и ПКМ  и покрутить колесико.
Версия 1.1.1:
- Установлена рабочая директория скрипта. Без этого, если запускать скрипт через интерпретатор, то ругался, что не нашел иконок и неправильно грузился.
Версия 1.1.2:
- Не работало создание закладок в подпапках в Хроме - fix
*/
#NoEnv
#MaxHotkeysPerInterval, 200
SetWorkingDir, %A_ScriptDir%
SetTitleMatchMode, RegEx
SetKeyDelay, 200

Menu, Tray, Icon, Icons\KGA_On.ico,,1
Menu, Tray, Tip, %Name%`nСкрипт-помощник клавогонщику
Menu, Tray, NoStandard
Menu, Tray, Add, О скрипте, About
Menu, Tray, Add, Открыть папку скрипта, OpenScriptDir
Menu, Tray, Add, Поместить в автозагрузку, PutInStartup
Menu, Tray, Add, Отключить, ScriptPaused
Menu, Tray, Add, Перезапуск, ReloadScript
Menu, Tray, Add, Выход, ExitScript
Menu, Tray, Icon, Выход, Shell32.dll, 28
Menu, Tray, Icon, Перезапуск, Shell32.dll, 239
Menu, Tray, Icon, Открыть папку скрипта, Shell32.dll, 4
Menu, Tray, Icon, О скрипте, Shell32.dll, 278

IfExist, %A_Startup%\%A_ScriptName% - Ярлык.lnk
{
    Menu, Tray, Check, Поместить в автозагрузку
}

g := 1 ; индекс для GameType
GameType := ["normal", "private", "practice"]
GameTypeName := ["откр.", "друж.", "один."]
t := 2 ; индекс для Timeout
Timeout := [5, 10, 20, 30, 45, 60, 120, 180]
TimeoutName := ["5 сек", "10 сек", "20 сек", "30 сек", "45 сек", "1 мин", "2 мин", "3 мин"]
Rmin := 1 ; нижний порог ранга
Rmax := 9 ; верхний
Rank := ["Новичков", "Любителей", "Таксистов", "Профи", "Гонщиков", "Маньяков", "Суперменов", "Кибергонщиков", "Экстракиберов"]
ShortRank := ["Н", "Л", "Т", "П", "Г", "М", "С", "К", "Э"]
r := 1 ; индекс для Regim
Regime := ["normal", "marathon", "noerror", "sprint", "abra", "referats", "chars", "digits", "voc&voc="]
RegimeName := ["Обычный", "Марафон", "Безошибочный", "Спринт", "Абракадабра", "Яндекс.Рефараты", "Буквы", "Цифры", "Словарь"]
URL := ""
VocID := ""
return

About:
Gui, +ToolWindow
;~ Gui, Margin, 15, 15
Gui, font, s12 cGreen, Verdana
Gui, add, Text,, %Name%
Gui, font,
Gui, font,, Verdana
Gui, add, Text,, %Version%
Gui, add, Text,,
(
Это скрипт, написанный на языке AutoHotkey_L,
в помощь клавогонщикам. Он позволяет удобно и
быстро формировать ссылки на "быстрые старты",
а также создавать и править закладки на них.
)
Gui, font, underline
Gui, add, Text, gAHK_L cBlue, http://l.autohotkey.net/
Gui, add, Text, gKGTopic cBlue, Тема на Клавогонках
Gui, Show,, О скрипте
return
GuiClose:
Gui, Destroy
return
AHK_L:
Run, http://l.autohotkey.net/
return
KGTopic:
Run, http://klavogonki.ru/forum/general/1441/page1/#post1
return

PutInStartup:
	IfNotExist, %A_Startup%\%A_ScriptName% - Ярлык.lnk
	{
		FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\%A_ScriptName% - Ярлык.lnk, %A_ScriptDir%,, Скрипт-помощник клавогонщику, %A_IconFile%
		Menu, Tray, Check, Поместить в автозагрузку
	}else{
		FileDelete, %A_Startup%\%A_ScriptName% - Ярлык.lnk
		Menu, Tray, UnCheck, Поместить в автозагрузку
	}
return

ScriptPaused:
	Suspend
	If A_IsSuspended
	{
		Menu, Tray, Icon, Icons\KGA_Off.ico
		Menu, Tray, Check, Отключить
	}
	else
	{
		Menu, Tray, Icon, Icons\KGA_On.ico
		Menu, Tray, UnCheck, Отключить
	}
return

OpenScriptDir:
Run %A_ScriptDir%
return

ExitScript:
	Suspend, Permit
	ExitApp
return

ReloadScript:
F5::
	Suspend, Permit
	Reload
return

#IfWinActive, .*Клавогонки - онлайновый клавиатурный тренажер-игра - (Google Chrome)|(Comodo Dragon)|(Chromium) ; ahk_class Chrome_WidgetWin_1
	F3::
		if (r = 9)
		{
			Send, {f6}
			gosub, ExtractVocID
		}
		gosub, CreateURL
		Run, chrome.exe %URL%
		;~ MsgBox, %URL%
	return

	F4::
	F4 & F1::
		SendInput, % (A_ThisHotkey = "F4") ? "{RButton}{Down 4}" : "{RButton}{Up 5}"
		;~ Sleep, 200
		Send, {Enter}
		WinWait, Закладка ahk_class Chrome_WidgetWin_1,, 2
		if ErrorLevel
		{
			ToolTip, Что-то пошло не так… :(
			Sleep, 3500
			ToolTip
			Exit
		}
		gosub, ModifyBookmarkName
		Send, {Tab}
		gosub, ModifyBookmarkURL
		Send, {Enter}
	return
#IfWinActive

#IfWinActive, .*Клавогонки - онлайновый клавиатурный тренажер-игра - Mozilla Firefox ; ahk_class MozillaWindowClass
	F3::
		if (r = 9)
		{
			Send, {F6}
			gosub, ExtractVocID
		}
		gosub, CreateURL
		;~ MsgBox, %URL%
		Run, firefox.exe %URL%
	return
	F4::
		Send, {AppsKey}{Up}{Enter}
		WinWait, Свойства для.* ahk_class MozillaDialogClass,, 2
		if ErrorLevel
		{
			ToolTip, Что-то пошло не так… :(
			Sleep, 3500
			ToolTip
			Exit
		}
		gosub, ModifyBookmarkName
		Send, {Tab}
		gosub, ModifyBookmarkURL
		Send, {Enter}
	return
#IfWinActive

#IfWinActive, .*Клавогонки - онлайновый клавиатурный тренажер-игра - Opera ; ahk_class OperaWindowClass
	F3::
		if (r = 9)
		{
			Send, {F8}
			gosub, ExtractVocID
		}
		gosub, CreateURL
		;~ MsgBox, %URL%
		Run, opera.exe %URL%
	return
	F4::
	F4 & F1::
		Send, % (A_ThisHotkey = "F4") ? "{RButton}{Up}{Enter}" : "{RButton}{Down 7}{Enter}"
		WinWait, (Свойства|Добавление) закладки ahk_class OperaWindowClass,, 2
		if ErrorLevel
		{
			ToolTip, Что-то пошло не так… :(
			Sleep, 3500
			ToolTip
			Exit
		}
		gosub, ModifyBookmarkName
		Send, {Tab 2}
		if (A_ThisHotkey <> "F4")
		{
			Send, {Tab}{Space}
			Sleep, 100
			Send, {Tab}
		}
		gosub, ModifyBookmarkURL
		Send, {Enter}
	return
#IfWinActive

CreateURL:
	URL := % "klavogonki.ru/create/?gametype=" Regime[r] VocID "&type=" GameType[g] "&level_from=" Rmin "&level_to=" Rmax "&timeout=" Timeout[t] "&submit=Go"
	VocID := ""
return

ModifyBookmarkName:
	Clipboard := ""
	Send, ^{vk43}
	ClipWait, 1
	if ErrorLevel
	{
		ToolTip, Что-то пошло не так… :(
		Sleep, 3500
		ToolTip
		Exit
	}
	if (A_ThisHotkey = "F4")
	{
		Clipboard := RegExReplace(Clipboard, "\s*\(?(откр|один|друж).+?(сек|мин)\)?( ...\))?\s*", "")
		. " (" GameTypeName[g] " " TimeoutName[t] ((g = 1) ? " " ShortRank[Rmin] "-" ShortRank[Rmax] ")" : ")")
	}else{
		Clipboard := RegExReplace(Clipboard, "(.*) - Словари - Клавогонки - онлайновый клавиатурный тренажер-игра"
		, "$1 (" GameTypeName[g] " " TimeoutName[t] ((g = 1) ? " " ShortRank[Rmin] "-" ShortRank[Rmax] ")" : ")"))
	}
	Send, ^{vk56}
	Clipboard := ""
return

ModifyBookmarkURL:
	Clipboard := ""
	Send, ^{vk43}
	ClipWait, 1
	if ErrorLevel
	{
		ToolTip, Что-то пошло не так… :(
		Sleep, 3500
		ToolTip
		Exit
	}
	if (A_ThisHotkey = "F4")
	{
		Clipboard := RegExReplace(Clipboard, "(klavogonki.ru/create/\?gametype=.*?)&type=.*"
		, "$1&type=" GameType[g] ( g = 1 ? "&level_from=" Rmin "&level_to=" Rmax : "&level_from=1&level_to=9" ) "&timeout=" Timeout[t] "&submit=Go")
	}else{
		gosub, ExtractVocID
		Clipboard := % "klavogonki.ru/create/?gametype=" Regime[9] VocID "&type=" GameType[g]
		. ( g = 1 ? "&level_from=" Rmin "&level_to=" Rmax : "&level_from=1&level_to=9" ) "&timeout=" Timeout[t] "&submit=Go"
		VocID := ""
	}
	Send, ^{vk56}
	Clipboard := ""
return

ExtractVocID:
	Clipboard := ""
	Send, ^{vk43}
	ClipWait, 1
	if ErrorLevel
	{
		ToolTip, Неудача…`nФокус НЕ должнен быть на адресной строке
		Sleep, 3500
		ToolTip
		Exit
	}
	VocID := RegExReplace(Clipboard, ".*klavogonki\.ru/vocs/(\d+)/.*", "$1", ReplaceCount)
	if !ReplaceCount
	{
		ToolTip, Ошибка. Нужно быть на странице словаря
		Sleep, 2000
		ToolTip
		VocID := ""
		Clipboard := ""
		Exit
	}
	Clipboard := ""
return

ShowToolTip:
	ToolTip, % RegimeName[r] " " GameTypeName[g] " " TimeoutName[t] " для " Rank[Rmin] " — " Rank[Rmax]
return

#IfWinActive, .*Клавогонки - онлайновый клавиатурный тренажер-игра.*
$F2::
	gosub, ShowToolTip
	ChangeTimeout := true
return
F2 up::
	ToolTip
	ChangeTimeout := false
return

$F1::
	gosub, ShowToolTip
	ChangeRegime := true
return
F1 up::
	ToolTip
	ChangeRegime := false
return

#If ChangeTimeout
	WheelDown::
		t := (t >= 8) ? 1 : t + 1
		gosub, ShowToolTip
	return
	WheelUp::
		t := (t <= 1) ? 8 : t - 1
		gosub, ShowToolTip
	return
	RButton & WheelDown::
		Rmax := (Rmax < 9) ? (Rmax + 1) : Rmin
		gosub, ShowToolTip
	return
	RButton & WheelUp::
		Rmax := (Rmax > Rmin) ? (Rmax - 1) : 9
		gosub, ShowToolTip
	return
#If

#If ChangeRegime
	WheelDown::
		r := (r >= 9) ? 1 : r + 1
		gosub, ShowToolTip
	return
	WheelUp::
		r := (r <= 1) ? 9 : r - 1
		gosub, ShowToolTip
	return
	RButton & WheelDown::
		Rmin := (Rmin < Rmax) ? (Rmin + 1) : 1
		gosub, ShowToolTip
	return
	RButton & WheelUp::
		Rmin := (Rmin > 1) ? (Rmin - 1) : Rmax
		gosub, ShowToolTip
	return
#If

#If ChangeRegime or ChangeTimeout
	MButton::
		g := (g >= 3) ? 1 : g + 1
		gosub, ShowToolTip
	return
#If
#IfWinActive