#SingleInstance, force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#if (WinActive("ahk_exe firefox.exe") or WinActive("ahk_exe chrome.exe"))
^!N::
	Send, ^l
	Sleep, 100
	Send, ^c
	Send, ^w
	Send, ^n
	Sleep, 200
	Send, ^v
	Sleep, 100
	Send, {Enter}
Return
#if