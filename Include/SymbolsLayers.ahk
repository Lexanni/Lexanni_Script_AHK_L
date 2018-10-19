;---- Четвертый ряд ---

#If (A_PriorHotkey = "*CapsLock") or (A_PriorHotkey = "*vkDE") or ShiftOn
    vk31::Send, {U+0025}      ; %
    vk32::Send, {U+2014}      ; 1 -> — (Em Dash)
    vk33::Send, {U+0028}      ; (
    vk34::Send, {U+0029}   ; )
    ;~ vk33::Send, {U+0029}      ; )
    ;~ vk34::Send, {U+0028}   ; (
    vk35::Send, {U+003B}   ; ;
    vk36::Send, {U+003A}   ; :
    vk37::Send, {U+003A}   ; :
    vk38::Send, {U+003B}   ; ;
    vk39::Send, {U+0028}   ; (
    vk30::Send, {U+0029}   ; )
    ;~ vkBD::Send, {U+2014}  ; — ; | - |
    vkBD::Send, {U+2013}  ; – (En-Dash)
    vkBB::Send, {u+003d}   ; = ; | = |
    vkDD::Send, {u+0023}    ; # ; | ] |
#If

;------ "И" слой -------
#If (A_PriorHotkey = "*vk42") or SLOn ; ((A_PriorHotkey = "*vk42") or (A_PriorHotkey = "*RShift"))
    vk32::Send, {U+2013}      ; 1 -> – (En Dash)
    vk33::Send, {U+2116}      ; №
    vk34::Send, {U+0024}   ; $
    ;~ vk35::Send, {U+0025}   ; %
    vk59::Send, {U+0025}
    vk36::Send, {U+005e}   ; ^
    vk38::Send, {u+002a}  ; *
    vk39::Send, {U+007b}  ; {
    vk30::Send, {U+007d}  ; }
; | ] |   
    vkDD::Send, {u+007e}   ; ~   
; | - |
    vkBD::Send, {U+005f}     ; _    
; | = |
    vkBB::Send, {u+002b}   ; + 
; | Q |
    ;~ vk51::Send, {u+00a9}    ; ©
    vk51::Send, {u+002a}  ; *
;~ ; | E |
    ;~ vk45::Send, {u+00ab}  ; «
;~ ; | R |
    ;~ vk52::Send, {u+00bb}  ; »
;~ ; | E |
    ;~ vk45::Send, {u+003a}  ; :
;~ ; | R |
    ;~ vk52::Send, {u+003b}  ; ;
; | W |
    vk57::Send, {u+002a}    ; *
; | E |
    vk45::Send, {u+003c}    ; <
; | R |
    vk52::Send, {u+003e}    ; > 
; | U |
    ;~ vk55::Send, {u+0025}    ; %
    vk55::Send, {u+005e}    ; %
;~ ; | I |
    ;~ vk49::Send, {u+003c}    ; <
;~ ; | O |    
    ;~ vk4F::Send, {u+003e}    ; > 
; | I |
    vk49::Send, {U+0028}   ; (
; | O |    
    vk4F::Send, {U+0029}   ; )
; | P |    
    vk50::Send, {u+0024}    ; $
; | [ |
    vkDB::Send, {u+0026}    ; &
    
; | ] |
    ;~ vkDD::Send, {u+0000}    ; Заглушка!
    
    
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
; | G |
    ;~ vk47::Send, {u+00a3}    ; £
    ;~ vk47::Send, {u+2206}    ; ∆
    vk47::Send, {u+203f}    ; ‿
; | H |
    ;~ vk48::Send, {u+00b0}    ; °
    ;~ vk48::Send, {u+22c3}    ; ⋃
    vk48::Send, {u+00b7}    ; ⋃
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
; | X |
    vk58::Send, {u+002f}   ; /
; | Z |
    vk5A::Send, {u+005c}    ; \
; | C |
    ;~ vk43::Send, {u+03b1}    ; α
; | X |
    ;~ vk58::Send, {u+03b2}   ; β
; | Z |
    ;~ vk5A::Send, {u+03b3}    ; γ
; LShift
    LShift::Send, {u+002a}  ; * 
    ;~ LShift::Send, {u+2229}  ; ∩ 
    
#If

;~ #If (A_PriorHotkey = "~Space")
    ;~ vk59::Send, {U+0022}
;~ #If

#If FRaw    ; Тестовые переназначения для F-ряда
    F1::return
    F2::return
    F3::Send, {u+0028} ; (
    F4::Send, {u+0029} ; )
    F5::Send, {u+003b} ; ;
    F6::Send, {u+003a} ; :
    F7::Send, {u+003a} ; :
    F8::Send, {u+003b} ; ;
    F9::Send, {u+0028} ; (
    F10::Send, {u+0029} ; )
    F11::return

#If


; Внимание! Важно, чтобы эта секция находилась здесь, внизу. Если будет выше — работать не будет.
;~ #If StickyKeys 
; | ` |
    ;~ vkC0::Send, {U+0021}       ; !    
    ;~ +vkC0::Send, {U+0025}      ; %
    vk31::Send, {U+0021}       ; !
    vk32::Send, {U+002D}       ;  1 -> - (Hyphen-Minus)
    vk33::Send, {U+0022}       ; "
    vk34::Send, {U+002E}    ; .
    vk35::Send, {U+002C}    ; ,
    vk36::Send, {U+003F}    ; ?
    vk37::Send, {U+003F}    ; ?
    vk38::Send, {U+002C}    ; ,
    vk39::Send, {U+002E}    ; .
    vk30::Send, {U+0022}    ; "
    vkDD::Send, {u+2026}    ; …
    vkBD::Send, {U+002D}    ; -
    vkBB::Send, {U+0021}    ; !
    

