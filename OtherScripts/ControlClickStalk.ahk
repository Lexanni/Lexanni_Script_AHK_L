#NoEnv
SetWorkingDir %A_ScriptDir%
logfile = Control_Log.txt


~LButton::
~RButton::
~MButton::
 WinGetTitle, Title, A
 CoordMode Mouse
 MouseGetPos, sX, sY, sWin, sC
 CoordMode Mouse, Relative
 MouseGetPos, rX, rY
 ControlGet HWND, HWND,, %sC%, A
 log .= "`n`nClicked " . Substr(A_ThisHotkey, 2) . " on window " . Title . " at " . A_Now
        . "`nControl: " . sC . " HWND: " . HWND
        . "`nScreen:"
        . "`nX: " . sX . " Y: " . sY
        . "`nRelative:"
        . "`nX: " . rX . " Y: " . rY
return


^#vk47::MsgBox % Log
^!#vk53::
 FileDelete %logFile%
 FileAppend %log%, % LogFile
 Run % LogFile
return