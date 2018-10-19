; Partical Lexanni Script
; ---------- Раскладка MSREK ---------
;~ #UseHook, On
;~ #InputLevel 1
#If (KState = 2) and ((A_PriorHotkey = "*CapsLock") or (A_PriorHotkey = "*vkDE") or ShiftOn)
    vkDD::Send, {u+0023}    ; # 
    vk51::Send, V
    vk57::Send, F
    vk45::Send, Y
    vk52::Send, L
    ;~ vk54::Send, {u+002a}   ; * | T |
    ;~ vk59::Send, {u+005e}   ; ^ | Y |
    vk54::Send, Ä   ; | T |
    vk59::Send, Ö   ; | Y |
    vk55::Send, I
    vk49::Send, D
    vk4F::Send, B
    vk50::Send, W
    vkDB::Send, X
    vk41::Send, M
    vk53::Send, S
    vk44::Send, R
    vk46::Send, E
    vk47::Send, K
    vk48::Send, J
    vk4A::Send, O
    vk4B::Send, T
    vk4C::Send, H
    vkBA::Send, U
    ;~ vkDE::Send, {u+002f}    ; / ; | ' |
    ; vkDC::Send, {u+005c}   ; \ ; | \ |
    vk5A::Send, Z
    vk58::Send, {u+0060}   ; `
    vk43::Send, A
    vk56::Send, C
    vk4E::Send, P
    vk4D::Send, N
    vkBC::Send, G
    vkBE::Send, Q
    vkBF::Send, Ü ; | / |
#If

#If (KState = 2) and A_PriorHotkey = "*vk42" ; ((A_PriorHotkey = "*vk42") or (A_PriorHotkey = "*RShift"))
    vkDD::Send, {u+007e}   ; ~
    ;~ vk4A::Send, {u+00f6}   ; ö
    ;~ vkBA::Send, {u+00fc}   ; ü
    vk43::Send, {u+0251}    ; ɑ
    LShift::Send, {u+03b2}  ; β    
    ;~ vk53::Send, {u+00df}   ; ß
    ;~ vkBC::Send, {u+005c}   ; \
    ;~ vkBE::Send, {u+002f}    ; /
    vk54::Send, {u+0040}    ; @; | T |
    vk59::Send, {u+0026}   ; &; | Y |
    ; vk46::Send, {u+03b5}    ; ε
#If

;~ #If (KState = 2) and ((A_PriorHotkey = "*vkBF") or (A_PriorHotkey = "*vkE2"))
    ;~ vk4A::Send, {u+00d6}   ; Ö
    ;~ vkBA::Send, {u+00dc}   ; Ü
    ;~ vk43::Send, {u+00c4}  ; Ä
;~ #If

#If (KState = 2) and !LeftON and !RightOn
    vk51::Send, v
    vk57::Send, f
    vk45::Send, y
    vk52::Send, l
    ;~ vk54::Send, {u+0040}    ; @; | T |
    ;~ vk59::Send, {u+0026}   ; &; | Y |
    ;~ vk54::Send, ä    ; @; | T |
    vk54::Send, ^{vkBF}    ; @; | T |
    ;~ vk59::Send, ö   ; &; | Y |
    vk59::Send, {U+003B}  ; ";" ; | Y |
    vk55::Send, i
    vk49::Send, d
    vk4F::Send, b
    vk50::Send, w
    vkDB::Send, x
    vkDD::Send, {u+0023} ; # 
    vk41::Send, m
    vk53::Send, s
    vk44::Send, r
    vk46::Send, e
    vk47::Send, k
    vk48::Send, j
    vk4A::Send, o
    vk4B::Send, t
    vk4C::Send, h
    vkBA::Send, u
    vkDC::Send, ^{vkBF}
    ;~ LShift::Send, ß
    LShift::
        gosub, AltOnOff
        KeyWait, LShift
        gosub, AltOnOff
    return
    vk5A::Send, z
    ;~ *vk42::SendEvent, {RShift Down}
    ;~ *vk42 up::SendEvent, {RShift Up}
    ;~ vk42::Send, ß
    vk58::Send, {u+0027}    ; ' | X |
    vk43::Send, a
    vk56::Send, c
    vk4E::Send, p
    vk4D::Send, n
    vkBC::Send, g
    vkBE::Send, q
    ;~ vkBF::Send, ü ; | / |
    vkBF::Send, ^{vkBF}
#If
;~ #InputLevel 0
;~ #UseHook, Off