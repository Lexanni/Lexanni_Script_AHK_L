; Partical Lexanni Script 
; ---------- Раскладка MSREK ---------
;~ #UseHook, On
;~ #InputLevel 1
#If (KState = 2) ; !StickyKeys and EngLayoutOn and !NumOn 
; | Q |
    vk51::Send, v
    <+vk51::Send, V
; | W |
    vk57::Send, {u+0066}
    <+vk57::Send, {u+0046}   ; F
; | E |
    vk45::Send, {u+0079}
    <+vk45::Send, {u+0059}   ; Y
; | R |
    vk52::Send, {u+006c}
    <+vk52::Send, {u+004c}   ; L
; | T |
    ;~ vk54::Space
    vk54::Send, {u+0040}    ; @
    <+vk54::Send, {u+002a}   ; *
; | Y |
    ;~ vk59::Space
    vk59::Send, {u+0026}   ; &
    <+vk59::Send, {u+005e}   ; ^
; | U |
    vk55::Send, {u+0069}
    <+vk55::Send, {u+0049}   ; I
; | I |
    vk49::Send, {u+0064}
    <+vk49::Send, {u+0044}   ; D
; | O |
    vk4F::Send, {u+0062}
    <+vk4F::Send, {u+0042}   ; B
; | P |
    vk50::Send, w
    <+vk50::Send, W
; | [ |
    vkDB::Send, x
    <+vkDB::Send, X
; | ] |
    <+vkDD::Send, {u+0023}    ; #
    >+vkDD::Send, {u+007e}   ; ~
; | A |
    vk41::Send, {u+006d}
    <+vk41::Send, {u+004d}   ; M
; | S |
    vk53::Send, {u+0073}
    <+vk53::Send, {u+0053}   ; S
    >+vk53::Send, {u+00df}   ; ß
; | D |
    vk44::Send, {u+0072}
    <+vk44::Send, {u+0052}   ; R
; | F |
    vk46::Send, {u+0065}
    <+vk46::Send, {u+0045}   ; E
; | G |
    vk47::Send, k
    <+vk47::Send, K
; | H |
    vk48::Send, j
    <+vk48::Send, J
; | J |
    vk4A::Send, {u+006f}
    <+vk4A::Send, {u+004f}   ; O
    >+vk4A::Send, {u+00f6}   ; ö
    >+<+vk4A::Send, {u+00d6}   ; Ö
; | K |
    vk4B::Send, {u+0074}
    <+vk4B::Send, {u+0054}   ; T
; | L |
    vk4C::Send, {u+0068}
    <+vk4C::Send, {u+0048}   ; H
; | ; |
    vkBA::Send, {u+0075}
    <+vkBA::Send, {u+0055}   ; U
    >+vkBA::Send, {u+00fc}   ; ü
    >+<+vkBA::Send, {u+00dc}   ; Ü
; | ' |
    ;~ vkDE::Send, {u+002f}    ; /
    ;~ <+vkDE::Send, {u+005c}   ; \
    ;~ *vkDE::SendEvent, {RShift Down}
    ;~ *vkDE Up::SendEvent, {RShift Up}
; | \ |
    ; vkDC::Send, {u+005c}   ; \
; | Z |
    ;~ vk5A::Send, {u+006b}
    ;~ <+vk5A::Send, {u+004b}   ; K
    vk5A::Send, {u+007a}
    <+vk5A::Send, {u+005a}   ; Z
;~ ; | X |
    ;~ vk58::Send, {u+0079}
    ;~ <+vk58::Send, {u+0059}   ; Y
; | X |
    vk58::Send, {u+0027}    ; '
    <+vk58::Send, {u+0060}   ; `
; | B |    
    *vk42::SendEvent, {RShift Down}
    *vk42 up::SendEvent, {RShift Up}
; | C |
    vk43::Send, {u+0061}
    <+vk43::Send, {u+0041}   ; A
    >+vk43::Send, {u+00e4}  ; ä
    >+<+vk43::Send, {u+00c4}  ; Ä
; | V |
    vk56::Send, c
    <+vk56::Send, C
; | B |
; смотри выше на 2 клавиши. оно там потому, что Ä не набиралось, если оставить здесь… хз…
    ;~ vk42::Send, z
    ;~ <+vk42::Send, Z
    ;~ vk42::Send, {u+0040}    ; @
    ;~ vk42::Send, {u+2665}    ; ♥
    ;~ vk42::Send, {u+1d25}    ; ᴥ
    ;~ <+vk42::Send, {u+0026}   ; &
;~ ; | N |
    ;~ vk4E::Send, {u+0071}
    ;~ <+vk4E::Send, {u+0051}   ; Q
; | N |
    vk4E::Send, {u+0070}
    <+vk4E::Send, {u+0050}   ; P
; | M |
    vk4D::Send, {u+006e}
    <+vk4D::Send, {u+004e}   ; N
; | , |
    ;~ vkBC::Send, {u+006a}
    ;~ <+vkBC::Send, {u+004a}   ; J
    ;~ vkBC::Send, {u+0071}
    ;~ <+vkBC::Send, {u+0051}    ; Q
    vkBC::Send, {u+0067}
    <+vkBC::Send, {u+0047}    ; G    
    >+vkBC::Send, {u+005c}   ; \
;~ ; | . |
    ;~ vkBE::Send, {u+007a}
    ;~ <+vkBE::Send, {u+005a}    ; Z
; | . |
    vkBE::Send, {u+0071}
    <+vkBE::Send, {u+0051}    ; Q
    ;~ vkBE::Send, {u+006a}
    ;~ <+vkBE::Send, {u+004a}   ; J
    >+vkBE::Send, {u+002f}    ; /
 ; | / |
;   vkBF
#If
;~ #InputLevel 0
;~ #UseHook, Off