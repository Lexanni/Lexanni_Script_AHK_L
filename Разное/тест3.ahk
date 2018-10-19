ExtractInteger(ByRef pSource, pOffset = 0, pIsSigned = false, pSize = 4)
;pSource - строка (буфер), область памяти которого содержит
;необработанное/двоичное целое число по смещению pOffset.
;Вызывающая программа должна передать значение "истина" в pIsSigned,
;чтобы результат интерпретировался как число со знаком, а не беззнаковое.
;pSize - размер целого числа, содержащегося в pSource,
;в байтах (например, 4 байта для DWORD или Int).
;pSource должен передаваться по ссылке (ByRef), чтобы избежать искажения
;в течение процесса копирования от формального к фактическому
;(так как pSource может содержать достоверные данные
;после его первого двоичного нуля).
{
	Loop %pSize% ; Формирует целое число, складывая его байты.
		result += *(&pSource + pOffset + A_Index-1) << 8*(A_Index-1)
	if (!pIsSigned OR pSize > 4 OR result < 0x80000000)
		;Знаковый или беззнаковый - не имеет значения в этих случаях.
		return result
	;Иначе, конвертируем значение (теперь известно, что 32-разрядное)
	;к его знаковой копии:
	return -(0xFFFFFFFF - result + 1)
}

InsertInteger(pInteger, ByRef pDest, pOffset = 0, pSize = 4)
;Вызывающая программа должна гарантировать, что pDest имеет достаточную вместимость.
;Чтобы сохранить любое существующее содержимое в pDest, изменяем только
;число байтов pSize, начинающихся со смещения pOffset.
{
;копируем каждый байт целого числа в структуру как необработанные двоичные данные.
Loop %pSize%
DllCall("RtlFillMemory", UInt, &pDest + pOffset + A_Index-1, UInt, 1, UChar
	, pInteger >> 8*(A_Index-1) & 0xFF)
}

;Устанавливаем вместимость на четыре 4-байтовых целых числа и инициализируем их нулями:
VarSetCapacity(Rect, 16, 0)
InsertInteger(A_ScreenWidth//2, Rect, 8) ;третье целое число в структуре - "rect.right"
InsertInteger(A_ScreenHeight//2, Rect, 12) ;четвертое целое число в структуре - "rect.bottom"
;передаем нуль, чтобы получить контекст устройства рабочего стола
hDC := DllCall("GetDC", UInt, 0)
;создаем красную кисть (0x0000FF в формате BGR)
hBrush := DllCall("CreateSolidBrush", UInt, 0x0000FF)
;заполним указанный прямоугольник, используя кисть выше
DllCall("FillRect", UInt, hDC, Str, Rect, UInt, hBrush)
DllCall("ReleaseDC", UInt, 0, UInt, hDC) ;очистка
DllCall("DeleteObject", UInt, hBrush) ;очистка

