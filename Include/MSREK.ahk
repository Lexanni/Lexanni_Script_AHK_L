/*
*
*    MSREK layout
*
*/

#If (state.Layout = "EN") and (state.ShiftOn or (state.StickyShiftOn and (A_PriorHotkey = "*CapsLock" or A_PriorHotkey = "*vkDE")))
    vk51::Send, V           ; [ Q ]
    vk57::Send, F           ; [ W ]
    vk45::Send, Y           ; [ E ]
    vk52::Send, L           ; [ R ]
    vk54::return            ; [ T ]
    vk59::return            ; [ Y ]
    vk55::Send, I           ; [ U ]
    vk49::Send, D           ; [ I ]
    vk4F::Send, B           ; [ O ]
    vk50::Send, W           ; [ P ]
    vkDB::Send, X           ; [ [ ]
    vkDD::Send, {u+0023}    ; [ ] ] -> #

    vk41::Send, M           ; [ A ]
    vk53::Send, S           ; [ S ]
    vk44::Send, R           ; [ D ]
    vk46::Send, E           ; [ F ]
    vk47::Send, K           ; [ G ]
    vk48::Send, J           ; [ H ]
    vk4A::Send, O           ; [ J ]
    vk4B::Send, T           ; [ K ]
    vk4C::Send, H           ; [ L ]
    vkBA::Send, U           ; [ ; ]
    ; vkDE                  ; [ ' ] -> ShiftOn modifier
    vkDC::return            ; [ \ ]

    vkE2::return            ; [ \ ] – EU key betwin LShift and Z
    vk5A::Send, Z           ; [ Z ]
    vk58::Send, {u+0060}    ; [ X ] -> `
    vk43::Send, A           ; [ C ]
    vk56::Send, C           ; [ V ]
    ; vk42                  ; [ B ] -> modifier for the Symbols layer
    vk4E::Send, P           ; [ N ]
    vk4D::Send, N           ; [ M ]
    vkBC::Send, G           ; [ , ]
    vkBE::Send, Q           ; [ . ]
    vkBF::return            ; [ / ]
#If

#If (state.Layout = "EN")
    vk51::Send, v           ; [ Q ]
    vk57::Send, f           ; [ W ]
    vk45::Send, y           ; [ E ]
    vk52::Send, l           ; [ R ]
    vk54::return            ; [ T ]
    vk59::return            ; [ Y ]
    vk55::Send, i           ; [ U ]
    vk49::Send, d           ; [ I ]
    vk4F::Send, b           ; [ O ]
    vk50::Send, w           ; [ P ]
    vkDB::Send, x           ; [ [ ]
    vkDD::Send, {u+0023}    ; [ ] ] -> #

    vk41::Send, m           ; [ A ]
    vk53::Send, s           ; [ S ]
    vk44::Send, r           ; [ D ]
    vk46::Send, e           ; [ F ]
    vk47::Send, k           ; [ G ]
    vk48::Send, j           ; [ H ]
    vk4A::Send, o           ; [ J ]
    vk4B::Send, t           ; [ K ]
    vk4C::Send, h           ; [ L ]
    vkBA::Send, u           ; [ ; ]
    ; vkDE                  ; [ ' ] -> ShiftOn modifier
    vkDC::return            ; [ \ ]

    vkE2::return            ; [ \ ] – EU key betwin LShift and Z
    vk5A::Send, z           ; [ Z ]
    vk58::Send, {u+0027}    ; [ X ] -> '
    vk43::Send, a           ; [ C ]
    vk56::Send, c           ; [ V ]
    ; vk42                  ; [ B ] -> modifier for the Symbols layer
    vk4E::Send, p           ; [ N ]
    vk4D::Send, n           ; [ M ]
    vkBC::Send, g           ; [ , ]
    vkBE::Send, q           ; [ . ]
    vkBF::return            ; [ / ]
#If