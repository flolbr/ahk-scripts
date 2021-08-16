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
        Else If (InStr(Trim(title), "J-Link") and InStr(Trim(title), " - Terms of use"))
        {
            SkipJlinkTerms()
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

    Sleep, 500

    CoordMode, Mouse, Screen
    MouseGetPos, MouseX, MouseY
    CoordMode, Mouse, Relative
    MouseClick, Left, 20, 215
    MouseClick, Left, 240, 175
    CoordMode, Mouse, Screen
    MouseMove, MouseX, MouseY
}
SkipJlinkTerms()
{
    TrayTip, J-Link, Skipping terms prompt

    Sleep, 500

    CoordMode, Mouse, Screen
    MouseGetPos, MouseX, MouseY
    CoordMode, Mouse, Relative
    MouseClick, Left, 25, 283
    MouseClick, Left, 480, 283
    CoordMode, Mouse, Screen
    MouseMove, MouseX, MouseY
}