/*
*
*    ВЛАЕЗ layout
*
*/

#If (state.Layout = "RU") and (state.ShiftOn or (state.StickyShiftOn and (A_PriorHotkey = "*CapsLock" or A_PriorHotkey = "*vkDE")))
    vk51::Send, Ж           ; [ Q ]
    vk57::Send, Б           ; [ W ]
    vk45::Send, М           ; [ E ]
    vk52::Send, Ы           ; [ R ]
    vk54::Send, Э           ; [ T ]
    vk59::Send, {u+042a}    ; [ Y ] -> Ъ (Unicode because sometimes not works)
    vk55::Send, Ю           ; [ U ]
    vk49::Send, Ь           ; [ I ]
    vk4F::Send, Г           ; [ O ]
    vk50::Send, П           ; [ P ]
    vkDB::Send, Й           ; [ [ ]
    vkDD::Send, Ф           ; [ ] ]

    vk41::Send, В           ; [ A ]
    vk53::Send, Л           ; [ S ]
    vk44::Send, А           ; [ D ]
    vk46::Send, Е           ; [ F ]
    vk47::Send, З           ; [ G ]
    vk48::Send, Щ           ; [ H ]
    vk4A::Send, И           ; [ J ]
    vk4B::Send, О           ; [ K ]
    vk4C::Send, Т           ; [ L ]
    vkBA::Send, К           ; [ ; ]
    ; vkDE                  ; [ ' ] -> ShiftOn modifier
    vkDC::return            ; [ \ ]

    vkE2::Send, Ц           ; [ \ ] – EU key betwin LShift and Z
    vk5A::Send, Ч           ; [ Z ]
    vk58::Send, У           ; [ X ]
    vk43::Send, Н           ; [ C ]
    vk56::Send, Д           ; [ V ]
    ; vk42                  ; [ B ] -> modifier for the Symbols layer
    vk4E::Send, Р           ; [ N ]
    vk4D::Send, С           ; [ M ]
    vkBC::Send, Я           ; [ , ]
    vkBE::Send, Ш           ; [ . ]
    vkBF::Send, Х           ; [ / ]
#If

#If (state.Layout = "RU")
    vk51::Send, ж           ; [ Q ]
    vk57::Send, б           ; [ W ]
    vk45::Send, м           ; [ E ]
    vk52::Send, ы           ; [ R ]
    vk54::Send, э           ; [ T ]
    vk59::Send, {u+044a}    ; [ Y ] -> ъ (Unicode because sometimes not works)
    vk55::Send, ю           ; [ U ]
    vk49::Send, ь           ; [ I ]
    vk4F::Send, г           ; [ O ]
    vk50::Send, п           ; [ P ]
    vkDB::Send, й           ; [ [ ]
    vkDD::Send, ф           ; [ ] ] -> #

    vk41::Send, в           ; [ A ]
    vk53::Send, л           ; [ S ]
    vk44::Send, а           ; [ D ]
    vk46::Send, е           ; [ F ]
    vk47::Send, з           ; [ G ]
    vk48::Send, щ           ; [ H ]
    vk4A::Send, и           ; [ J ]
    vk4B::Send, о           ; [ K ]
    vk4C::Send, т           ; [ L ]
    vkBA::Send, к           ; [ ; ]
    ; vkDE                  ; [ ' ] -> ShiftOn modifier
    vkDC::return            ; [ \ ]

    vkE2::Send, ц           ; [ \ ] – EU key betwin LShift and Z
    vk5A::Send, ч           ; [ Z ]
    vk58::Send, у           ; [ X ]
    vk43::Send, н           ; [ C ]
    vk56::Send, д           ; [ V ]
    ; vk42                  ; [ B ] -> modifier for the Symbols layer
    vk4E::Send, р           ; [ N ]
    vk4D::Send, с           ; [ M ]
    vkBC::Send, я           ; [ , ]
    vkBE::Send, ш           ; [ . ]
    vkBF::Send, х           ; [ / ]
#If