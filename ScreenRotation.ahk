#SingleInstance force

; Insert::
; CoordMode, Mouse, Screen  ; Place ToolTips at absolute screen coordinates:
; MouseGetPos, mouseXpos, mouseYpos
; 	if (mouseXpos > 1920)
; 	{
; 		device := 1
; 	}
; 	else
; 	{
; 		device := 2
; 	}

; 	ToolTip % "I'm a tooltip (" . mouseXpos . ") (" . device . ")"
; 	Run % "display64.exe /device " . device . " /rotate 0"
; Return

#!Up::Rotate(0)
#!Right::Rotate(90)
#!Down::Rotate(180)
#!Left::Rotate(270)

Rotate(angle)
{
	CoordMode, Mouse, Screen  ; Place ToolTips at absolute screen coordinates:
	MouseGetPos, mouseXpos, mouseYpos
	if (mouseXpos > 1920)
	{
		device := 1
	}
	else
	{
		device := 2
	}

	; ToolTip % "I'm a tooltip (" . mouseXpos . ") (" . device . ")"
	Run % "cmd /c display64.exe /display none /device " . device . " /rotate " . angle

	Sleep, 1000
	MouseMove, mouseXpos, mouseYpos, 0
}