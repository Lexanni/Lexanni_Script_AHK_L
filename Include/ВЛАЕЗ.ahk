;---- Экспериментальная русская раскладка ---
#UseHook, On
#If (KState = 1) ; !StickyKeys and !EngLayoutOn and !NumOn 
; | Tab |
    Tab::Send, ф
    <+Tab::Send, Ф
; | Й |
    vk51::Send, ж
    <+vk51::Send, Ж
; | Ц |
    vk57::Send, б
    <+vk57::Send, Б
; | У |
    vk45::Send, м
    <+vk45::Send, М
; | К |
    vk52::Send, ы
    <+vk52::Send, Ы
; | Е |
    vk54::Send, э
    <+vk54::Send, Э
; | Н |
    vk59::Send, {u+044a} ; ъ | Юникод потому, что по-другому глючит
    <+vk59::Send, {u+042a} ; Ъ
    ;~ vk59::Send, {u+2026}    ; …
    ;~ vk59::Send, {u+007e}   ; ~
    ;~ <+vk59::Send, {u+0023}    ; #
; | Г |
    vk55::Send, ю
    <+vk55::Send, Ю
; | Ш |
    ;~ vk49::Send, ы
    ;~ <+vk49::Send, Ы
    vk49::Send, {u+044c} ; ь
    ;~ <+vk49::Send, {u+044a} ; ъ
    <+vk49::Send, {u+042c} ; Ь
    ;~ <+>+vk49::Send, {u+044a} ; Ъ
; | Щ |
    vk4F::Send, г
    <+vk4F::Send, Г
; | З |
    vk50::Send, п
    <+vk50::Send, П
; | Х |
    vkDB::Send, й
    <+vkDB::Send, Й
; | Ъ |
    ;~ vkDD::Send, ф
    ;~ <+vkDD::Send, Ф
    ;~ vkDD::Send, {u+2026}    ; …
    ;~ +vkDD::Send, {u+007e}   ; ~
    ;~ <+vkDD::Send, {u+0023}    ; #
; | Ф |
    vk41::Send, в
    <+vk41::Send, В
; | Ы |
    vk53::Send, л
    <+vk53::Send, Л
    ;~ >+vk53::Send, {u+00df}   ; ß
; | В |
    vk44::Send, а
    <+vk44::Send, А
; | А |
    vk46::Send, е
    <+vk46::Send, Е
; | П |
    vk47::Send, з
    <+vk47::Send, З
; | Р |
    vk48::Send, щ
    <+vk48::Send, Щ
; | О |
    vk4A::Send, и
    <+vk4A::Send, И
    ;~ >+vk4A::Send, {u+00f6}   ; ö
    ;~ >+<+vk4A::Send, {u+00d6}   ; Ö
; | Л |
    vk4B::Send, о
    <+vk4B::Send, О
; | Д |
    vk4C::Send, т
    <+vk4C::Send, Т
; | Ж |
    vkBA::Send, к
    <+vkBA::Send, К
    ;~ >+vkBA::Send, {u+00fc}   ; ü
    ;~ >+<+vkBA::Send, {u+00dc}   ; Ü
; | Э |
    ;~ vkDE::Send, {u+002f}    ; /
    ;~ <+vkDE::Send, {u+005c}   ; \
    ;~ *vkDE::SendEvent, {RShift Down}
    ;~ *vkDE Up::SendEvent, {RShift Up}
; | \ |
    ;~ vkDC::Send, ф
	;~ <+vkDC::Send, Ф
; | < |
	vkE2::Send, ц
	<+vkE2::Send, Ц
    
;~ #If LongLShift 
    ;~ *$vkE2::SendEvent, {LShift Down} ;клавиша <> ; 
    ;~ vkE2 Up::SendEvent, {LShift Up}
    ;~ #InputLevel 1
    ;~ $LShift::Send, ф
    ;~ <+$LShift::Send, Ф
    ;~ #InputLevel 0
;~ #If


; | Я |
    vk5A::Send, ч
    <+vk5A::Send, Ч
; | Ч |
    vk58::Send, у
    <+vk58::Send, У
    ;~ vk58::Send, {u+044c} ; ь
    ;~ <+vk58::Send, {u+044a} ; ъ
    ;~ >+vk58::Send, {u+042c} ; Ь
    ;~ <+>+vk58::Send, {u+044a} ; Ъ
; | С |
    vk43::Send, н
    <+vk43::Send, Н
; | М |
    vk56::Send, д
    <+vk56::Send, Д
; | И |
    ;~ vk42::Send, {u+25cb} ; ○
    ;~ vk42::Send, -
    *vk42::SendEvent, {RShift Down}
    *vk42 up::SendEvent, {RShift Up}
    ;~ <+vk42::Send, {u+25a0} ; ■
    ;~ <+vk42::Send, _
    ;~ <+vk42::Send, _
; | Т |
    vk4E::Send, р
    <+vk4E::Send, Р
; | Ь |
    vk4D::Send, с
    <+vk4D::Send, С
; | Б |
    vkBC::Send, я
    <+vkBC::Send, Я
; | Ю |
    vkBE::Send, ш
    <+vkBE::Send, Ш
 ; | . |
    vkBF::Send, х
    <+vkBF::Send, Х
;~ #InputLevel 0
#If
#UseHook, Off