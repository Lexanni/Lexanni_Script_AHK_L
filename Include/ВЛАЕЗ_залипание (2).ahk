;---- Раскладка ВЛАЕЗ ---
;~ #UseHook, On
#If (KState = 1) and A_PriorHotkey = "vk50"
    vk59::Send, к
#If
#If (KState = 1) and ((A_PriorHotkey = "*CapsLock") or (A_PriorHotkey = "*vkDE") or ShiftOn)
    Tab::Send, Ф
    vk51::Send, Ж
    vk57::Send, Б
    vk45::Send, М
    vk52::Send, Ы
    vk54::Send, Э
    vk59::Send, {u+042a} ; Ъ
    ;~ vk59::Send, {u+2026}    ; …
    ;~ vk59::Send, {u+007e}   ; ~
    ;~ vk59::Send, {u+0023}    ; #
    vk55::Send, Ю
    ;~ vk49::Send, {u+044a} ; ъ
    vk49::Send, {u+042c} ; Ь
    ;~ >+vk49::Send, {u+044a} ; Ъ
    vk4F::Send, Г
    vk50::Send, П
    vkDB::Send, Й
    vk41::Send, В
    vk53::Send, Л
    vk44::Send, А
    vk46::Send, Е
    vk47::Send, З
    vk48::Send, Щ
    vk4A::Send, И
    vk4B::Send, О
    vk4C::Send, Т
    vkBA::Send, К
    vkE2::Send, Ц
    LShift::Send, Ц
    vk5A::Send, Ч
    vk58::Send, У
    vk43::Send, Н
    vk56::Send, Д
    vk4E::Send, Р
    vk4D::Send, С
    vkBC::Send, Я
    vkBE::Send, Ш
    vkBF::Send, Х
#If
;~ #If (KState = 1) and A_PriorHotkey = "*vk42"
;~ ; | X |
    ;~ vk58::Send, {u+045e}    ; ў
;~ #If 
;~ #If (KState = 1) and A_PriorHotkey = "*vk42"
#If (KState = 1) 
    Tab::Send, ф
    vk51::Send, ж
    vk57::Send, б
    vk45::Send, м 
    vk52::Send, ы
    vk54::Send, э
    vk59::Send, {u+044a} ; ъ | Юникод потому, что по-другому глючит
    vk49::Send, {u+044c} ; ь
    vk55::Send, ю
    vk4F::Send, г
    vk50::Send, п
    vkDB::Send, й
    vk41::Send, в
    vk53::Send, л
    ;~ vkDD::Send, ф ; | Ъ |
    vk44::Send, а
    vk46::Send, е
    vk47::Send, з
    vk48::Send, щ
    vk4A::Send, и
    vk4B::Send, о
    vk4C::Send, т
    vkBA::Send, к
    vkE2::Send, ц
    $LShift::Send, ц
    vk5A::Send, ч
    vk58::Send, у
    vk43::Send, н
    vk56::Send, д
    vk4E::Send, р
    vk4D::Send, с
    vkBC::Send, я
    vkBE::Send, ш
    vkBF::Send, х
#If

;~ #InputLevel 0
;~ #UseHook, Off

; | Э |
    ;~ vkDE::Send, {u+002f}    ; /
    ;~ vkDE::Send, {u+005c}   ; \
    ;~ *vkDE::SendEvent, {RShift Down}
    ;~ *vkDE Up::SendEvent, {RShift Up}
; | \ |
    ;~ vkDC::Send, ф
	;~ vkDC::Send, Ф
; | < |


    
;~ #If LongLShift 
    ;~ *$vkE2::SendEvent, {LShift Down} ;клавиша <> ; 
    ;~ vkE2 Up::SendEvent, {LShift Up}
    ;~ #InputLevel 1
    ;~ $LShift::Send, ф
    ;~ $LShift::Send, Ф
    ;~ #InputLevel 0
;~ #If

