^#WheelDown::
	Send, ^#{Right}
Return

^#WheelUp::
	Send, ^#{Left}
Return

; Media Keys

#+WheelUp::SoundSet +2

#+WheelDown::SoundSet -2

#+MButton::Send, {Media_Play_Pause}

#+XButton1::Send, {Media_Prev}

#+XButton2::Send, {Media_Next}