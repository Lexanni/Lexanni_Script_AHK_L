; Пример: ниже представлен работающий скрипт, демонстрирующий сабклассинг окна GUI,
; перенаправив его WindowProc к новой WindowProc в скрипте. В этом случае цвет фона текстового элемента
; управления изменяется на указанный цвет.
TextBackgroundColor := 0xFFBBBB ; Указываем цвет в формате BGR (голубой-зеленый-красный).
TextBackgroundBrush := DllCall("CreateSolidBrush", UInt, TextBackgroundColor)

Gui, Add, Text, HwndMyTextHwnd, Вот некоторый текст, которому задают`nпроизвольный цвет фона.
Gui +LastFound
GuiHwnd := WinExist()

WindowProcNew := RegisterCallback("WindowProc", "" ; "", чтобы избежать режима fast-mode для сабклассинга
    , 4, MyTextHwnd) ; если присутствует параметр EventInfo, необходимо задать точно ParamCount
WindowProcOld := DllCall("SetWindowLong", UInt, GuiHwnd, Int, -4 ; -4 это GWL_WNDPROC
    , Int, WindowProcNew, UInt) ; Возвращаемое значение должно быть установлено как UInt или Int.

Gui Show
return

WindowProc(hwnd, uMsg, wParam, lParam)
{
    Critical
    global TextBackgroundColor, TextBackgroundBrush, WindowProcOld
    if (uMsg = 0x138 && lParam = A_EventInfo) ; 0x138 это WM_CTLCOLORSTATIC.
    {
        DllCall("SetBkColor", UInt, wParam, UInt, TextBackgroundColor)
        return TextBackgroundBrush ; Возвращаем HBRUSH, чтобы уведомить операционную систему об изменении HDC.
    }
    ; Иначе (поскольку значение, о котором говорится выше, возвращено не было),
    ; передаем все необработанные события начальному WindowProc.
    return DllCall("CallWindowProcA", UInt, WindowProcOld, UInt, hwnd, UInt, uMsg, UInt, wParam, UInt, lParam)
}

GuiClose:
ExitApp