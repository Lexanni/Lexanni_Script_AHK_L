/*
*
*    Numeric layout
*
*/

#If state.NumOn
    *vk51::return            ; [ Q ]
    *vk57::return            ; [ W ]
    *vk45::Send, 9           ; [ E ]
    *vk52::Send, 8           ; [ R ]
    *vk54::Send, 7           ; [ T ]
    *vk59::return            ; [ Y ]
    *vk55::Send, 7           ; [ U ]
    *vk49::Send, 8           ; [ I ]
    *vk4F::Send, 9           ; [ O ]
    *vk50::return            ; [ P ]
    *vkDB::return            ; [ [ ]
    *vkDD::return            ; [ ] ]

    *vk41::Send, 0           ; [ A ]
    *vk53::Send, 6           ; [ S ]
    *vk44::Send, 5           ; [ D ]
    *vk46::Send, 4           ; [ F ]
    *vk47::return            ; [ G ]
    *vk48::return            ; [ H ]
    *vk4A::Send, 4           ; [ J ]
    *vk4B::Send, 5           ; [ K ]
    *vk4C::Send, 6           ; [ L ]
    *vkBA::Send, 0           ; [ ; ]
    ; vkDE                   ; [ ' ] -> ShiftOn modifier
    ; vkDC::return           ; [ \ ] -> Control

    *vkE2::return            ; [ \ ] – EU key betwin LShift and Z
    *vk5A::Send, 3           ; [ Z ]
    *vk58::Send, 2           ; [ X ] -> `
    *vk43::Send, 1           ; [ C ]
    *vk56::return            ; [ V ]
    ; vk42                   ; [ B ] -> modifier for the Symbols layer
    *vk4E::return            ; [ N ]
    *vk4D::Send, 1           ; [ M ]
    *vkBC::Send, 2           ; [ , ]
    *vkBE::Send, 3           ; [ . ]
    *vkBF::return            ; [ / ]
#If
