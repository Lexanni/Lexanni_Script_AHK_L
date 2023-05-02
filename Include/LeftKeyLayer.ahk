#If LeftOn
	vk31::Send, {u+2081}	; 1 – ₁
	vk32::Send, {u+2082}	; 2 – ₂
	vk33::Send, {u+2083}	; 3 – ₃
	vk34::Send, {u+2084}	; 4 – ₄
	vk35::Send, {u+2085}	; 5 – ₅
	vk36::Send, {u+2086}	; 6 – ₆
	vk37::Send, {u+2087}	; 7 – ₇
	vk38::Send, {u+2088}	; 8 - ₈
	vk39::Send, {u+2089}	; 9 - ₉
	vk30::Send, {u+2080}	; 0 - ₀

	;~ vk51::SendRaw, \overbar
	;~ vk57::Send, {u+00AC}	; W = ¬
	vkC0::                  ; диакретическая точка над буквой в редакторе формул Word
        SendRaw, \dot
        Send, {Space}{Space}
    return
    Tab::Send, {u+03c6}     ; φ

/*
; | ] |
    vkDD::Send, {u+007e}   ; ~
; | - |
    vkBD::Send, {U+005f}     ; _
; | = |
    vkBB::Send, {u+002b}   ; +
*/
; | Q |
    vk51::Send, {u+002a}    ; *
;~ ; | E |
    ;~ vk45::Send, {u+00ab}  ; «
;~ ; | R |
    ;~ vk52::Send, {u+00bb}  ; »
;~ ; | E |
    ;~ vk45::Send, {u+003a}  ; :
;~ ; | R |
    ;~ vk52::Send, {u+003b}  ; ;

; | W |
    vk57::Send, {u+0024}    ; $
; | E |
    vk45::Send, {u+003c}    ; <
; | R |
    vk52::Send, {u+003e}    ; >
; | T |
    vk54::Send, {u+0025}    ; %

;~ ; | U |
    ;~ vk55::Send, {u+0025}    ; %
;~ ; | I |
    ;~ vk49::Send, {u+003c}    ; <
;~ ; | O |
    ;~ vk4F::Send, {u+003e}    ; >
;~ ; | I |
    ;~ vk49::Send, {U+0028}   ; (
;~ ; | O |
    ;~ vk4F::Send, {U+0029}   ; )
    vk4F::
        SendRaw, \degree
        Send, {Space}{Space}
    return
; | P |
    vk50::Send, {u+03c9}    ; ω
;~ ; | А |
    ;~ vk41::Send, {u+00b0}    ; °

; | А |
    vk41::Send, {u+003d}    ; =
; | S |
    vk53::Send, {u+002d}    ; -
; | D |
    vk44::Send, {u+002b}    ; +
; | F |
    vk46::Send, {u+0021}    ; !
/*
; | G |
    ;~ vk47::Send, {u+00a3}    ; £
    ;~ vk47::Send, {u+2206}    ; ∆
    vk47::Send, {u+203f}    ; ‿
; | H |
    ;~ vk48::Send, {u+00b0}    ; °
    vk48::Send, {u+22c3}    ; ⋃
; | J |
    vk4A::Send, {u+007b}    ; {
; | K |
    vk4B::Send, {u+005b}    ; [
; | L |
    vk4C::Send, {u+005d}    ; ]
; | ; |
    vkBA::Send, {u+007d}    ; }
; | \ |
    vkDC::Send, {u+007c}   ; |
; | N |
    vk4E::Send, {u+03C0}    ; π
; | M |
    vk4D::Send, {u+0027}   ; '
; | , |
    vkBC::Send, {u+005c}   ; \
; | . |
    vkBE::Send, {u+002f}    ; /
; | / |
    vkBF::Send, {u+007c}    ; |
; | X |
    ;~ vk58::Send, {u+00b2}    ; ²
; | Z |
    ;~ vk5A::Send, {u+00b3}    ; ³
; | C |
    vk43::Send, {u+002a}    ; *
    */
; | X |
    vk58::Send, {u+002f}   ; /
; | Z |
    vk5A::Send, {u+005c}    ; \
    /*
; | C |
    ;~ vk43::Send, {u+03b1}    ; α
; | X |
    ;~ vk58::Send, {u+03b2}   ; β
; | Z |
    ;~ vk5A::Send, {u+03b3}    ; γ
    */
; LShift
    LShift::Send, _
    ;~ LShift::Send, {u+2229}  ;  ∩


#If