/*
*
*    Navigation Layer Exp
*
*/

#If state.NavOn
    vk51::return            ; [ Q ]
    vk57::return            ; [ W ]
    vk45::return            ; [ E ]
    vk52::return            ; [ R ]
    vk54::return            ; [ T ]
    vk59::return            ; [ Y ]
    vk55::Send, {Backspace} ; [ U ]
    vk49::Send, {Up}        ; [ I ]
    vk4F::Send, {Down}      ; [ O ]
    vk50::Send, {Del}       ; [ P ]
    vkDB::return            ; [ [ ]
    vkDD::return            ; [ ] ]

    vk41::return            ; [ A ]
    vk53::return            ; [ S ]
    vk44::return            ; [ D ]
    vk46::return            ; [ F ]
    vk47::return            ; [ G ]
    vk48::return            ; [ H ]
    vk4A::Send, ^{Left}     ; [ J ]
    vk4B::Send, {Left}      ; [ K ]
    vk4C::Send, {Right}     ; [ L ]
    vkBA::Send, ^{Right}    ; [ ; ]
    ; vkDE                  ; [ ' ] -> ShiftOn modifier
    vkDC::return            ; [ \ ]

    vkE2::return            ; [ \ ] – EU key betwin LShift and Z
    vk5A::return            ; [ Z ]
    vk58::return            ; [ X ]
    vk43::return            ; [ C ]
    vk56::return            ; [ V ]
    ; vk42                  ; [ B ] -> modifier for the Symbols layer
    vk4E::return            ; [ N ]
    vk4D::Send, ^+{Left}    ; [ M ]
    vkBC::Send, +{Tab}      ; [ , ]
    vkBE::Send, {Tab}       ; [ . ]
    vkBF::Send, ^+{Right}   ; [ / ]
#If