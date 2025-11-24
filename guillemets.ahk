#SingleInstance Force

; AltGr + y
<^>!y::
{
    ; Checks if CapsLock is on
    if GetKeyState("CapsLock", "T") {
        SendText "›"
    } else {
        SendText "»"
    }
}

; Shift + AltGr + y
+<^>!y::
{
    ; Checks if CapsLock is on
    if GetKeyState("CapsLock", "T") {
        SendText "»"
    } else {
        SendText "›"
    }
}

; AltGr + x
<^>!x::
{
    ; Checks if CapsLock is on
    if GetKeyState("CapsLock", "T") {
        SendText "‹"
    } else {
        SendText "«"
    }
}

; Shift + AltGr + x
+<^>!x::
{
    ; Checks if CapsLock is on
    if GetKeyState("CapsLock", "T") {
        SendText "«"
    } else {
        SendText "‹"
    }
}

; ; AltGr + -
; <^>!-::
; {
;     SendText "–"
; }

; ; AltGr + a
; <^>!a::
; {
;     ; Checks if CapsLock is on
;     if GetKeyState("CapsLock", "T") {
;         SendText "Æ"
;     } else {
;         SendText "æ"
;     }
; }

; ; Shift + AltGr + a
; +<^>!a::
; {
;     ; Checks if CapsLock is on
;     if GetKeyState("CapsLock", "T") {
;         SendText "æ"
;     } else {
;         SendText "Æ"
;     }
; }
