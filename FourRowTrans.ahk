﻿;---- Четвертый ряд ---
;~ #UseHook, On
/*
;~ #If !StickyKeys
; | ` |
    ;~ vkC0::Send, {U+0021}       ; !    
    ;~ +vkC0::Send, {U+0025}      ; %
; | 1 |
    vk31::Send, {U+0021}       ; !    
    +vk31::Send, {U+0025}      ; %
; | 2 |    
    vk32::Send, {U+002D}       ;  1 -> - (Hyphen-Minus)
    +vk32::Send, {U+2014}      ; 1 -> — (Em Dash)
    >+vk32::Send, {U+2013}      ; 1 -> – (En Dash)
; | 3 |
    vk33::Send, {U+0022}       ; "
    ;~ vk33::Space
    +vk33::Send, {U+0028}      ; (
    >+vk33::Send, {U+2116}      ; №
; | 4 |
    vk34::Send, {U+002E}    ; .
    +vk34::Send, {U+0029}   ; )
    >+vk34::Send, {U+0024}   ; $
; | 5 |
    vk35::Send, {U+002C}    ; ,
    +vk35::Send, {U+003B}   ; ;
    >+vk35::Send, {U+0025}   ; %
; | 6 |
    vk36::Send, {U+003F}    ; ?
    +vk36::Send, {U+003A}   ; :
    >+vk36::Send, {U+005e}   ; ^
; | 7 |
    vk37::Send, {U+003F}    ; ?
    +vk37::Send, {U+003A}   ; :
; | 8 |
    vk38::Send, {U+002C}    ; ,
    +vk38::Send, {U+003B}   ; ;
    >+vk38::Send, {u+002a}  ; *
; | 9 |
    vk39::Send, {U+002E}    ; .
    +vk39::Send, {U+0028}   ; (
    >+vk39::Send, {U+007b}  ; {
; | 0 |
    vk30::Send, {U+0022}    ; "
    +vk30::Send, {U+0029}   ; )
    >+vk30::Send, {U+007d}  ; }
; | ] |
    vkDD::Send, {u+2026}    ; …
    ;~ vkDD::Send, {BackSpace Down}
    ;~ vkDD Up::Send, {BackSpace Up}
    +vkDD::Send, {u+007e}   ; ~
    <+vkDD::Send, {u+0023}    ; #
; | - |
    vkBD::Send, {U+002D}      ; -
    ;~ +vkBD::Send, {U+2014}  ; —
    +vkBD::Send, {U+2013}     ; 
    >+vkBD::Send, {U+005f}     ; _    
; | = |
    vkBB::Send, {U+0021}    ; !
    +vkBB::Send, {u+003d}   ; =   
    >+vkBB::Send, {u+002b}   ; + 
; | Q |
    >+vk51::Send, {u+00a9}    ; ©
; | E |
    >+vk45::Send, {u+00ab}  ; «
; | R |
    >+vk52::Send, {u+00bb}  ; »
; | U |
    >+vk55::Send, {u+0025}    ; %
; | I |
    >+vk49::Send, {u+003c}    ; <
; | O |
    >+vk4F::Send, {u+003e}    ; >
; | P |
    >+vk50::Send, {u+0024}    ; $
; | G |
    >+vk47::Send, {u+00a3}
; | K |
    >+vk4B::Send, {u+005b}    ; [
; | L |
    >+vk4C::Send, {u+005d}    ; ]
; | \ |
    >+vkDC::Send, {u+007c}   ; |
; | , |
    >+vkBC::Send, {u+005c}   ; \ 
; | . |
    >+vkBE::Send, {u+002f}    ; /
;~ #If
;~ #UseHook, Off
*/

#If (A_PriorHotkey = "*CapsLock") or (A_PriorHotkey = "*vkDE") or ShiftOn
    vk31::Send, {U+0025}      ; %
    vk32::Send, {U+2014}      ; 1 -> — (Em Dash)
    ;~ vk33::Send, {U+0028}      ; (
    ;~ vk34::Send, {U+0029}   ; )
    vk33::Send, {U+0029}      ; )
    vk34::Send, {U+0028}   ; (
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
#If (A_PriorHotkey = "*vk42") ; ((A_PriorHotkey = "*vk42") or (A_PriorHotkey = "*RShift"))
    vk32::Send, {U+2013}      ; 1 -> – (En Dash)
    vk33::Send, {U+2116}      ; №
    vk34::Send, {U+0024}   ; $
    vk35::Send, {U+0025}   ; %
    vk36::Send, {U+005e}   ; ^
    
    vk38::Send, {u+002a}  ; *
    vk39::
    Send, ^{vk49}
    SendRaw, (смеется)
    Send, ^{vk49}
    return
    
    ;~ vk39::Send, {U+007b}  ; {
    ;~ vk39::
    ;~ Send, ^{vk49}
    ;~ SendRaw, (шёпотом)
    ;~ Send, ^{vk49}
    ;~ return
    
    
    ;~ vk30::Send, {U+007d}  ; }
    vk30::
    Send, {F9}
    ;~ Send, ^{vk49}
    SendRaw, (…)
    ;~ Send, ^{vk49}
    Send, {F8}
    return
    
    vkDD::Send, {u+007e}   ; ~  ; | ] |    
; | - |
    vkBD::Send, {U+005f}     ; _    
; | = |
    vkBB::Send, {u+002b}   ; + 
; | Q |
    vk51::Send, {u+00a9}    ; ©
; | E |
    vk45::Send, {u+00ab}  ; «
; | R |
    vk52::Send, {u+00bb}  ; »
; | U |
    ;~ vk55::Send, {u+0025}    ; %
   
; | I |
    ;~ vk49::Send, {u+003c}    ; <
; | O |    
    ;~ vk4F::Send, {u+003e}    ; >    
; | P |    
    ;~ vk50::Send, {u+0024}    ; $
    
    vk55::
    ;~ Send, {Tab}
    Send, ^{vk42}
    SendRaw, Жен.:
    Send, ^{vk42}
    ;~ Send, {Tab}
    return   
    
    vk49::
    ;~ Send, {Tab}
    Send, ^{vk42}
    SendRaw, Иван Федотович:
    Send, ^{vk42}
    ;~ Send, {Tab}
    return


    vk4F::
    ;~ Send, {Tab}
    Send, ^{vk42}
    SendRaw, Лариса:
    Send, ^{vk42}
    ;~ Send, {Tab}
    return


    vk50::
    ;~ Send, {Tab}
    Send, ^{vk42}
    SendRaw, Михаил:
    Send, ^{vk42}
    ;~ Send, {Tab}
    return
; M
    vk4D::
    Send, {F9} 
    SendRaw, нрзб`.
    Sleep, 100
    Send, ^{vk55}    
    Sleep, 100
    Send, {F8}
    return
; [
    vkDB::
    Send, ^{vk42}
    SendRaw, Коля:
    Send, ^{vk42}
    return
    
; | G |
    vk47::Send, {u+00a3}
; | K |
    vk4B::Send, {u+005b}    ; [
; | L |
    vk4C::Send, {u+005d}    ; ]
; | \ |
    vkDC::Send, {u+007c}   ; |
; | , |
    vkBC::Send, {u+005c}   ; \ 
; | . |
    vkBE::Send, {u+002f}    ; /
; | F |
    ;~ vk46::Send, {U+0451}    ; ё
; | T |
    ;~ vk54::Send, {U+0401}    ; Ё
;~ ; | S |
    ;~ vk53::
        ;~ Send, ^{vk49}
        ;~ SendRaw, (Технический разговор.)
        ;~ Send, ^{vk49}
    ;~ return
    ;~ vk44::SendRaw, Ковшов В.Л.:
    ;~ vk41::SendRaw, Семисаженова Ю.В.:
#If

;~ #If StickyKeys ; Внимание! Важно, чтобы эта секция находилась здесь, внизу. Если будет выше — работать не будет.
; | ` |
    ;~ vkC0::Send, {U+0021}       ; !    
    ;~ +vkC0::Send, {U+0025}      ; %
    ;~ vk31::Send, {U+0021}       ; !
    vk31::Enter
    vk32::Send, {U+002D}       ;  1 -> - (Hyphen-Minus)
    ;~ vk33::Send, {U+0022}       ; "
    vk33::LCtrl
    vk34::Send, {U+002E}    ; .
    vk35::Send, {U+002C}    ; ,
    vk36::Send, {U+003F}    ; ?
    vk37::Send, {U+003F}    ; ?
    vk38::Send, {U+002C}    ; ,
    vk39::Send, {U+002E}    ; .
    vk30::Send, {U+0022}    ; "
    vkDD::Send, {u+2026}    ; …
    vkBD::Send, {U+002D}      ; -
    vkBB::Send, {U+0021}    ; !
    vkDC::Send, ^{BackSpace}
;~ #If

^vk38::Send, ^{Left}
^vk39::Send, ^{Right}

*vk6B::!+vk6B
*vk6D::!+vk6D

 