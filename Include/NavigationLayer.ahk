;----- Navigation layer ---------
#If (KState = 7)
 vk49::Send, {Up}		    ; | I |
 vk4B::Send, {Down}		; | K |
 vk4A::Send, {Left}		; | J |
 vk4C::Send, {Right}	    ; | L |
 vk38::SendRaw, /*		    ; | 8 |
 vk39::SendRaw, */		    ; | 9 |
 vkDD::Send, {Del}		    ; | ] |
 vk55::Send, {Home}		; | U |
 vk4f::Send, {End}		    ; | O |
 ;~ $vkDC::Send, {u+005c}{u+0030} ; \0	; | \ |
 
 vk48::Send, ^{Left}        ; | J |
 vkBA::Send, ^{Right}       ; | ; |
 

vkBC::Send, +{Tab}     ; \ ; | , |
vkBE::Send, {Tab}      ; / ; | . |
vkBF::Send, ^+{Right}      ; | / |
vk4D::Send, ^+{Left}       ; | M |

;~ ^vk50::SendEvent, {WheelUp}
;~ ^vkBA::SendEvent, {WheelDown}

vkBD::Send, _              ; | - |
BackSpace::Send, ^{BackSpace}
#If

; | , |
    ;~ vkBC::Send, {u+005c}   ; \ 
; | . |
    ;~ vkBE::Send, {u+002f}    ; /