;----- Типографика ----- ‰ ∞ — ≠ ± – ≈ § × ⌘ ° © ® ™ ѣ і ′ [ ] { } ‘ ’ « » − “ „ ” £ € $ 
#If TgOn
Enter::Send, {U+002E} ; .
; | 1 |
    vk31::Send, {U+00B1}    ; ±
; | 2 |
    vk32::Send, {U+002D}    ; - (минус)
; | 3 |
    vk33::Send, {U+007b}    ; . → {
; | 4 |
    ;~ vk34::Send, ≠
    vk34::Send, {U+007d}    ; , → }
    <+vk34::Send, ≈    ; , → [
; | 5 |
    ;~ vk35::Send, ±
    vk35::Send, ≈
; | 6 |
    vk36::Send, ™
; | 7 |
    vk37::Send, {U+00B1}    ; ±
; | 8 |
    ;~ vk38::Send, ±
    vk38::Send, ≠
    ;~ <+vk38::Send, ≈
; | 9 |
    ;~ vk39::Send, ≠
    <+vk39::Send, ≈
    vk39::Send, {U+005b}    ; , → [
    ;~ +vk39::Send, {U+007b}    ; , → {
    ;~ vk39::Send, {U+005d}    ; . → ]
; | 0 |
    vk30::Send, {U+005d}    ; . → ]
    ;~ vk30::Send, {U+007d}    ; . → }
    
; | - |
    vkBD::Send, {U+2013}      ; 
    +vkBD::Send, {U+2014}  ; —
; | = |
    vkBB::Send, {U+2248}    ; ≈
    +vkBB::Send, {U+2260}    ; ≠
    
    <+Space::Send, {U+002E} ; .
    Tab::Send, £ ; ф
    ;~ vk51::Send, ’ ; ж
    ;~ vk57::Send, ” ; б     
    vk51::Send, ‘ ; ж
    ;~ vkDE & vk57::Send, ‘ ; ж
    vk57::Send, “ ; б 
    ;~ +vk57::Send, {u+2019} ; ’ ; б 
    ;~ vk51::Send, ‘ ; ж
    ;~ vk57::Send, “ ; б
    vk45::Send, „ ; м
    vk52::Send, ⌘ ; ы
    vk54::Send, € ; э
    <+vk54::Send, € ; э
    vk59::Send, ѣ ; ъ 
    vk55::Send, і ; ю
    ;~ CapsLock & vk55::Send, ™ ; ю
    vk49::Send, ↑ ; ь
    ;~ CapsLock & vk49::Send, {U+007b} ; { ; ь
    vk4F::Send, ′ ; г
    ;~ CapsLock & vk4F::Send, {U+007d} ; } ; г
    ;~ vk50::Send, “ ; п
    vkDB::Send, ’ ; й    
    vk50::Send, ” ; п
    ;~ CapsLock & vk50::Send, ’ ; 
; | Ъ |
    ;~ vkDD::Send, ф
    vk41::Send, « ; в
    vk53::Send, $ ; л
    <+vk53::Send, {U+007b} ; { ; л
    vk44::Send, ® ; а
    <+vk44::Send, {U+007d} ; } ; а
    vk46::Send, ° ; е
    <+vk46::Send, £ ; е
    vk47::Send, § ; з
    vk48::Send, ∞ ; щ
    vk4A::Send, ← ; и
    <+vk4A::Send, ™ ; и
    vk4B::Send, ↓ ; о
    <+vk4B::Send, {U+005b} ; [ ; о
    vk4C::Send, → ; т
    <+vk4C::Send, {U+005d} ; ] ; т
    ;~ CapsLock & vk4C::Send, ™ ; т
    vkBA::Send, » ; к
	vkE2::Send, ¼ ; ц
    vk5A::Send, ⅓ ; ч
    vk58::Send, ½ ; у
	;~ vkE2::Send, ¼ ; ц
    ;~ vk5A::Send, ⅓ ; ч
    ;~ vk58::Send, ½ ; у
    ;~ vk43::Send, — ; {U+2012}    ; - (минус) н
    vk43::Send, − ; {U+2012}    ; - (минус) н
    vk56::Send, © ; д
    vk42::Send, ™ ; @
    vk4E::Send, ‰ ; р
    vk4D::Send, ¹ ; с
    <+vk4D::Send, ¹ ; с
    vkBC::Send, ² ; я
    <+vkBC::Send, ½ ; я
    vkBE::Send, ³ ; ш
    <+vkBE::Send, ⅓ ; ш
    vkBF::Send, × ; х
#If