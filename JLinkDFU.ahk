#SingleInstance, force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#if (WinActive("ahk_exe Ozone.exe"))
F2::
    ; Run, ssh testbench "cd /home/pi/Documents/testbench/; sudo /home/pi/Documents/testbench/build/testbench/debug/TestBench xml/pairing.xml"
    ; Run, ssh testbench "cd /home/pi/Documents/testbench/; sudo /home/pi/Documents/testbench/build/testbench/debug/TestBench xml/pairing-B1.xml"
    Run, ssh testbench "cd /home/pi/Documents/testbench/; sudo /home/pi/Documents/testbench/build/testbench/debug/TestBench xml/pairing-B2.xml"
    ; Run, ssh testbench "cd /home/pi/Documents/testbench/; sudo /home/pi/Documents/testbench/build/testbench/debug/TestBench xml/dfu_receiver.xml"
    ; Run, ssh testbench "cd /home/pi/Documents/testbench/; sudo /home/pi/Documents/testbench/build/testbench/debug/TestBench xml/dfu_pw.xml"
    ; Run, ssh testbench "cd /home/pi/Documents/testbench/; sudo /home/pi/Documents/testbench/build/testbench/debug/TestBench xml/quick_dfu.xml"
    Sleep, 100
    MouseClick, Left
    Sleep, 500
    Send, {F4}
    Sleep, 500
    Send, {F5}
#if