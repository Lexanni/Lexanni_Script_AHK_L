#NoEnv
SetWorkingDir, %A_ScriptDir%

InputBox, File,, Имя файла для разбора:
InputBox, RegExText,, Регулярное выражение для поиска:

FileRead, TextFile, %File%

Loop, Parse, TextFile, %A_Space%%A_Tab%`n`r, `.`,
{
	SearhString := RegExReplace(A_LoopField, RegExText, "$1", ReplCount)
	If !ReplCount
		continue
;	MsgBox,, %RegExText%
	FileAppend, %SearhString%`r`n, OutFile.txt
}

TextFile =