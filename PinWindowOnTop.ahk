#SingleInstance, force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#F12::
    WinGetPos, WinX, WinY, WinWidth, WinHeight, A
    MouseGetPos, MouseX, MouseY
    ToolTip, Pos: %MouseX% %MouseY%
    Winset, Alwaysontop, , A
    WinGet, ExStyle, ExStyle, A
    If ((MouseX > 0) And (MouseX < WinWidth)) And ((MouseY > 0) And (MouseY < WinHeight))
        If (ExStyle & 0x8)  ; 0x8 is WS_EX_TOPMOST.
            ToolTip, Pinned on top ; , %WinX%, WinY
        Else
            ToolTip, Unpinned ; , WinX, WinY
    Else
        If (ExStyle & 0x8)  ; 0x8 is WS_EX_TOPMOST.
            ToolTip, Pinned on top, WinWidth / 2, WinHeight / 2
        Else
            ToolTip, Unpinned, WinWidth / 2, WinHeight / 2
    SetTimer, RemoveToolTip, -2000
Return


return

RemoveToolTip:
ToolTip
return