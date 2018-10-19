; Partical Lexanni Script
; ---------- Раскладка YFLO -----------    

; | Q |

        vk51::Send, {u+0027}    ; '
        +vk51::Send, {u+0060}   ; `
; | W |
        vk57::Send, f
        +vk57::Send, F
; | E |
        vk45::Send, y
        +vk45::Send, Y
; | R |
        vk52::Send, {u+006c}
        +vk52::Send, {u+004c}   ; L
; | T |
        vk54::Send, {u+006f}
        +vk54::Send, {u+004f}   ; O
        ^!vk54::Send, {u+00f6}   ; ö
        ^!+vk54::Send, {u+00d6}   ; Ö
; | Y |
        vk59::Space
        +vk59::Send, {u+005e}   ; ^
; | U |
        ;~ vk55::Send, {u+0069}
        ;~ +vk55::Send, {u+0049}   ; I
        vk55::Send, {u+0063}
        +vk55::Send, {u+0043}   ; C
; | I |
        vk49::Send, {u+0064}
        +vk49::Send, {u+0044}   ; D
; | O |
        vk4F::Send, v
        +vk4F::Send, V
; | P |
        vk50::Send, w
        +vk50::Send, W
; | [ |
        vkDB::Send, x
        +vkDB::Send, X
; | ] |
        +vkDD::Send, {u+0023}    ; #
        ^!vkDD::Send, {u+007e}   ; ~
; | A |
        vk41::Send, m
        +vk41::Send, M

; | S |
        vk53::Send, {u+0073}
        +vk53::Send, {u+0053}   ; S
        ^!vk53::Send, {u+00df}   ; ß
; | D |
        vk44::Send, {u+0072}
        +vk44::Send, {u+0052}   ; R
; | F |
        vk46::Send, {u+0061}
        +vk46::Send, {u+0041}   ; A
        ^!vk46::Send, {u+00e4}  ; ä
        ^!+vk46::Send, {u+00c4}  ; Ä
; | G |
        vk47::Send, u
        +vk47::Send, U
        <^>!vk47::Send, ü
        <^>!+vk47::Send, Ü
; | H |
        vk48::Send, {u+006b}
        +vk48::Send, {u+004b}   ; K
; | J |
        vk4A::Send, {u+0065}
        +vk4A::Send, {u+0045}   ; E
        ;~ vk4A::Send, {u+006f}
        ;~ +vk4A::Send, {u+004f}   ; O
        ;~ ^!vk4A::Send, {u+00f6}   ; ö
        ;~ ^!+vk4A::Send, {u+00d6}   ; Ö
; | K |
        vk4B::Send, {u+0074}
        +vk4B::Send, {u+0054}   ; T
; | L |
        vk4C::Send, {u+0068}
        +vk4C::Send, {u+0048}   ; H
; | ; |
        vkBA::Send, g
        +vkBA::Send, G
; | ' |
        ;~ vkDE::Send, {u+002f}    ; /
        ;~ +vkDE::Send, {u+005c}   ; \
        *vkDE::SendEvent, {RShift Down}
        *vkDE Up::SendEvent, {RShift Up}
; | \ |
        ; vkDC::Send, {u+005c}   ; \
; | Z |
        vk5A::Send, q
        +vk5A::Send, Q
; | X |
        vk58::Send, j
        +vk58::Send, J
; | C |
        vk43::Send, {u+006e}
        +vk43::Send, {u+004e}   ; N 
; | V |
        vk56::Send, b
        +vk56::Send, B
; | B |
        vk42::Send, {u+0040}    ; @
        ;~ vk42::Send, {u+2665}    ; ♥
        ;~ vk42::Send, {u+1d25}    ; ᴥ
        +vk42::Send, {u+0026}   ; &
; | N |
        vk4E::Send, {u+0070}
        +vk4E::Send, {u+0050}   ; P
; | M |
        vk4D::Send, {u+0069}
        +vk4D::Send, {u+0049}   ; I
        ;~ vk4D::Send, {u+006e}
        ;~ +vk4D::Send, {u+004e}   ; N
; | , |
        vkBC::Send, z
        +vkBC::Send, Z
; | . |
        vkBE::Send, `,
        +vkBE::Send, `.

; | / |
        ;~ vkBF
