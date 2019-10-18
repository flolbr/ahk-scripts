#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#F12::
	Winset, Alwaysontop, , A
	WinGet, ExStyle, ExStyle, A
	If (ExStyle & 0x8)  ; 0x8 is WS_EX_TOPMOST.
	   ToolTip, Pinned on top
	Else
	   ToolTip, Unpinned
	SetTimer, RemoveToolTip, -2000
Return


return

RemoveToolTip:
ToolTip
return