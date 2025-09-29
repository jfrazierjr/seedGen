#SingleInstance Force
SetWorkingDir %A_ScriptDir%
;if not A_IsAdmin
;    Run *RunAs "%A_ScriptFullPath%"

#Include %A_ScriptDir%
#Include stdio.ahk

/*
* Defined Co-ordinates
*
*/

Coordmode, Mouse, Screen

; Save Box
saveX := 1750
saveY := 770

; Back box

backX := 370
backY := 1194

; Quit

; Ravenhearst 6.2
quitX := 581
quitY := 1225

; Alpha 18.3
quitX := 1150
quitY := 1377

if WinExist("7 Days to die")
{
    Stdout("Activating 7 Days to die")
    WinActivate, 7 Days to die
    app := 7 Days to die
}
else if WinExist("7 Days to Die")
{
    Stdout("Activating 7 Days to Die")
    WinActivate, 7 Days to Die
    app := 7 Days to Die
}
else if WinExist("7 Days To Die")
{
    Stdout("Activating 7 Days To Die")
    WinActivate, 7 Days To Die
    app := 7 Days To Die
}
else
{
    Stdout("Could not find 7 days to die application to close it.")
    Exit, 1
}

Stdout("Clicking Back button to Save")
MouseClick, Left, backX, backY ; Location of the Back button

Sleep, 500

Stdout("Clicking Save")
Sleep, 1500
MouseClick, Left, saveX, saveY ; Location of the Back button

Sleep 8000
Stdout("Exiting game ")
MouseClick, Left, quitX, quitY ; Click on screen to ensure it's active

NR_temp =0 ; init

TimeOut = 30000 ; milliseconds to wait before deciding it is not responding - 100 ms seems reliable under 100% usage

WinGet, wid, ID, %app% ; retrieve the ID of a window to check

Responding := DllCall("SendMessageTimeout", "UInt", wid, "UInt", 0x0000, "Int", 0, "Int", 0, "UInt", 0x0001, "UInt", TimeOut, "UInt *", NR_temp)

if Responding = 0 ; 1= responding, 0 = Not Responding
{
    Stdout("7 Days to Die is not responding")
    Exit, 1
}

Sleep, 2500

MouseClick, Left, quitX, quitY ; Click on screen to ensure it's active

Responding := DllCall("SendMessageTimeout", "UInt", wid, "UInt", 0x0000, "Int", 0, "Int", 0, "UInt", 0x0002, "UInt", TimeOut, "UInt *", NR_temp)

if Responding = 0 ; 1= responding, 0 = Not Responding
{
    Stdout("7 Days to Die is not responding")
    Exit, 1
}

Sleep, 500

MouseClick, Left, quitX, quitY ; Click on screen to ensure it's active

Sleep, 500

Send, {F1}

Sleep, 500

Send, xui open mainMenu

Sleep, 500

Send, {Return}

Sleep, 500

Send, {F1}

Sleep, 500

MouseClick, Left, quitX, quitY ; Quit button

Sleep, 500

/* vim: set ts=4 sw=4 tw=100 et :*/
