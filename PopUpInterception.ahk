#SingleInstance, force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
#Persistent
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Gui +LastFound
hWnd := WinExist()

DllCall( "RegisterShellHookWindow", UInt,hWnd )
MsgNum := DllCall( "RegisterWindowMessage", Str,"SHELLHOOK" )
OnMessage( MsgNum, "ShellMessage" )
Return

ShellMessage( wParam,lParam ) {
    Local k
    If (wParam == 32772 && wParam != 6 && wParam != 16)
    {
        If ( wParam = 1 ) ;  HSHELL_WINDOWCREATED := 1
        {
            NewID := lParam
            SetTimer, MsgBox, -1
        }
        WinGetActiveTitle, title
        If (wParam == 32772 && Trim(title) == "License Missing")
        {
            SkipLicense()
        }
        Else
        {
            ; TrayTip, Ozone, =%title%=
        }
    }
}

MsgBox:
    WinGetTitle, Title, ahk_id %NewID%
    WinGetClass, Class, ahk_id %NewID%
    TrayTip, New Window Opened, Title:`t%Title%`nClass:`t%Class%
Return

SkipLicense()
{
    TrayTip, Ozone, Skipping license prompt

    MouseGetPos, MouseX, MouseY
    MouseClick, Left, 20, 215
    MouseClick, Left, 240, 175
    MouseMove, MouseX, MouseY
}