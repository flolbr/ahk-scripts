#SingleInstance

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
; SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#IfWinActive ahk_class CabinetWClass
#+T::

ControlFocus, Edit1


try  ; Attempts to execute code.
{
ControlClick, ToolbarWindow323, , , , , x-10 y10
}
catch e  ; Handles the first error/exception raised by the block above.
{
    MsgBox, An exception was thrown!`nSpecifically: %e%
    Exit
}

ControlGetText, CurrentDir, Edit1 ; , Control, WinTitle, WinText, ExcludeTitle, ExcludeText

Send, {Escape}

ToolTip, "%CurrentDir%"

SetTimer, RemoveToolTip, -1000

Run flute.exe new "%CurrentDir%"

Return


RemoveToolTip:
ToolTip
Return