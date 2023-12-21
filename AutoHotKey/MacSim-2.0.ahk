; This script simulates MacOS arrow key behaviour, using HOME/END for CMD (Win), and swaps (CTRL) and (ALT) for OPT and CTRL 

; -----KEY GUIDE-----
; # Win.
; + Shift.
; ^ Ctrl. Note: ^A produces a different effect in some programs than ^a. This is because ^A presses Ctrl+Shift+A and !a presses Ctrl+A. If in doubt, use lowercase.
; ! Alt.Note: !A produces a different effect in some programs than !a. This is because !A presses Alt+Shift+A and ^a presses Alt+A. If in doubt, use lowercase.
; & An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey.

#Warn  ; Uncomment to enable warnings to assist with detecting common errors.
; SendMode("Input")  ; Recommended for new scripts due to its superior speed and reliability.
; SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.

; Uncomment for key history
; #InstallKeybdHook
; KeyHistory

; Swap Win and Alt Tab switching
; #Tab::
; {
;     Suspend(true)
;     Send("!{Tab}")
;     return
; }
; !Tab::
; {
;     Suspend(true)
;     Send("#{Tab}")
;     Suspend(false)
;     return
; }

; Cycle between windows of currently open application
!`::{
  OldClass := WinGetClass("A")
  ActiveProcessName := WinGetProcessName("A")
  WinClassCount := WinGetCount("ahk_exe" ActiveProcessName)
  IF WinClassCount = 1
      Return
  loop 2 {
    WinMoveBottom("A")
    WinActivate("ahk_exe" ActiveProcessName)
    NewClass := WinGetClass("A")
    if (OldClass != "CabinetWClass" or NewClass = "CabinetWClass")
      break
  }
}

; Quit the active app
#q::Send("!{f4}")

; Close the current window
#w::Send("^{f4}")

; Delete previous word
!Backspace::
{
    Suspend(true)
    Send("^{BS}")
    Suspend(false)
    return
}
; Delete next word
!Delete::
{
    Suspend(true)
    Send("^{Delete}")
    Suspend(false)
    return
}
; Delete entire line
#Backspace::
{
    Suspend(true)
    Send("+{Home}")
    Send("{BS}")
    Suspend(false)
    return
}

; Insertion point movement
; Command Arrows
#Left::
{
    Suspend(true)
    Send("{Home}")
    Suspend(false)
    return
}
#Right::
{
    Suspend(true)
    Send("{End}")
    Suspend(false)
    return
}
#Up::
{
    Suspend(true)
    Send("^{Home}")
    Suspend(false)
    return
}
#Down::
{
    Suspend(true)
    Send("^{End}")
    Suspend(false)
    return
}

; Command + Shift Arrows


+#Left::
{
    Suspend(true)
    Send("+{Home}")
    Suspend(false)
    return
}
+#Right::
{
    Suspend(true)
    Send("+{End}")
    Suspend(false)
    return
}
+#Up::
{
    Suspend(true)
    Send("+^{Home}")
    Suspend(false)
    return
}
+#Down::
{
    Suspend(true)
    Send("+^{End}")
    Suspend(false)
    return
}

; Alt Arrows

!Left::
{
    Suspend(true)
    Send("^{Left}")
    Suspend(false)
    return
}
!Right::
{
    Suspend(true)
    Send("^{Right}")
    Suspend(false)
    return
}
!Up::
{
    Suspend(true)
    Send("^{Up}")
    Suspend(false)
    return
}
!Down::
{
    Suspend(true)
    Send("^{Down}")
    Suspend(false)
    return
}

; Alt + Shift Arrows

+!Left::
{
    Suspend(true)
    Send("+^{Left}")
    Suspend(false)
    return
}
+!Right::
{
    Suspend(true)
    Send("+^{Right}")
    Suspend(false)
    return
}
+!Up::
{
    Suspend(true)
    Send("+^{Up}")
    Suspend(false)
    return
}
+!Down::
{
    Suspend(true)
    Send("+^{Down}")
    Suspend(false)
    return
}

; Ctrl Arrows
^Left::Send("^#{Left}")
^Right::Send("^#{Right}")
^Up::Send("#{Tab}")
^Down::Send("Esc")