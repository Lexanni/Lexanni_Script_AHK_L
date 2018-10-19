#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#UseHook, on ; Для того, чтобы в TS'ке все было более-менее ОК
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;		Цифровая раскладка Lexanni
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Suspend
Menu, Tray, NoStandard ; удаляем стандартные пункты меню (не пользовательские)
Menu, Tray, Icon, off.ico, , 1 ; устанавливаем значек при запуске, "замораживаем" его (чтобы не менялся на значек "S" при остановке скрипта
Menu, Tray, Tip, Остановлено ; всплывающая подсказка, при наведении курсора
Menu, Tray, Add, KeyHistory, ShowKeyHistory
Menu, Tray, Add, &Reload, ReloadScript
Menu, Tray, Add, &Exit, ExitScript


CapsLock:: ; CapsLock все еще можно ключить, нажав его с можификаторами ;)  uuuuuuuu
Suspend
If A_IsSuspended
{
Menu, Tray, Icon, off.ico
Menu, Tray, Tip, Остановлено
TrayTip,, Остановлено
}
else
{
	Menu, Tray, Icon, on.ico
	Menu, Tray, Tip, Работает! :)
	TrayTip,, Банзай %A_UserName%! :)
}
return

;----- Цифры -----

vk41::Send, {vk31} ; A -> 1
vk53::Send, {vk32} ; S -> 2
vk44::Send, {vk33} ; D -> 3
vk46::Send, {vk34} ; F -> 4
vk56::Send, {vk35} ; V -> 5
vk4E::Send, {vk36} ; N -> 6
vk4A::Send, {vk37} ; J -> 7
vk4B::Send, {vk38} ; K -> 8
vk4C::Send, {vk39} ; L -> 9
vkBA::Send, {vk30} ; ; -> 0
vkBC::Send, {U+002C} ; , -> ,
vkBE::Send, {U+002E} ; . -> .

;---------------------------------

ExitScript:

^CapsLock:: ; Ctrl + CapsLock - > Выход из скрипта
Suspend, Permit
ExitApp 
return 

ReloadScript:
#CapsLock:: ; Win + CapsLock -> Перезапуск
Suspend, Permit
Reload 
return

ShowKeyHistory:
Suspend, Permit
KeyHistory
return

;~ check_en_ru_by_window_id(WinID)
;~ {
  ;~ SetFormat, Integer, H
  ;~ Locale_En := 0x4090409  ; Английский (американский).
  ;~ Locale_Ru := 0x4190419  ; Русский.
  ;~ ThreadID:=DllCall("GetWindowThreadProcessId", "Int", WinID, "Int", "0")
  ;~ InputLocaleID:=DllCall("GetKeyboardLayout", "Int", ThreadID)

    ;~ if (store_layout <> InputLocaleID)
    ;~ {
      ;~ if(InputLocaleID = Locale_En)
        ;~ {
            ;~ Menu tray, icon, en2.ico
        ;~ }
      ;~ else if(InputLocaleID = Locale_Ru)
        ;~ {
            ;~ Menu tray, icon, ru2.ico
        ;~ }
        ;~ else
        ;~ {
            ;~ Menu tray, icon, __2.ico
        ;~ }
    ;~ }
    
    ;~ store_layout = InputLocaleID

  ;~ if(InputLocaleID = Locale_En)
    ;~ {
        ;~ return "EN"
    ;~ }
  ;~ else if(InputLocaleID = Locale_Ru)
    ;~ {
        ;~ return "RU"
    ;~ }
    ;~ else
    ;~ {
      ;~ return "??"
    ;~ }
;~ }
