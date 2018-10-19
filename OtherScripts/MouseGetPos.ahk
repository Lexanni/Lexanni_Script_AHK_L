MouseGetPos, xpos, ypos 
Msgbox, Текущие координаты курсора: X%xpos% Y%ypos%. 

; Пример ниже позволяет, двигая мышь по экрану,
; видеть в подсказке идентификатор окна под курсором,
; его класс, заголовок, а также имя контрола (ClassNN).
#Persistent
SetTimer, WatchCursor, 100
return

WatchCursor:
MouseGetPos, , , id, control, 3
WinGetTitle, title, ahk_id %id%
WinGetClass, class, ahk_id %id%
ToolTip, ahk_id %id%`nahk_class %class%`n%title%`nControl: %control%
return