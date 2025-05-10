/*
*
*    Navigation Layer
*
*/

#If state.NavOn
    vk51::return            ; [ Q ]
    vk57::return            ; [ W ]
    vk45::return            ; [ E ]
    vk52::return            ; [ R ]
    vk54::return            ; [ T ]
    vk59::return            ; [ Y ]
    vk55::Send, ^{Left}     ; [ U ]
    vk49::Send, {Up}        ; [ I ]
    vk4F::Send, ^{Right}    ; [ O ]
    vk50::Send, {Backspace} ; [ P ]
    vkDB::Send, {Del}       ; [ [ ]
    vkDD::return            ; [ ] ]

    vk41::return            ; [ A ]
    vk53::return            ; [ S ]
    vk44::return            ; [ D ]
    vk46::return            ; [ F ]
    vk47::return            ; [ G ]
    vk48::Send, {Home}      ; [ H ]
    vk4A::Send, {Left}      ; [ J ]
    vk4B::Send, {Down}      ; [ K ]
    vk4C::Send, {Right}     ; [ L ]
    vkBA::Send, {End}       ; [ ; ]
    ; vkDE                  ; [ ' ] -> ShiftOn modifier
    ; vkDC::return          ; [ \ ] -> Control

    vkE2::return            ; [ \ ] - EU key betwin LShift and Z
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
