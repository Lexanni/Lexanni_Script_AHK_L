/*
*
*    Ctrl layer
*
*/

#If state.CtrlOn
    vk51::Send, ^{vk56}     ; [ Q ] -> Ctrl+V
    vk57::Send, ^{vk46}     ; [ W ] -> Ctrl+F
    vk45::Send, ^{vk59}     ; [ E ] -> Ctrl+Y
    vk52::Send, ^{vk4C}     ; [ R ] -> Ctrl+L
    vk54::return            ; [ T ]
    vk59::return            ; [ Y ]
    vk55::Send, ^{vk49}     ; [ U ] -> Ctrl+I
    vk49::Send, ^{vk44}     ; [ I ] -> Ctrl+D
    vk4F::Send, ^{vk42}     ; [ O ] -> Ctrl+B
    vk50::Send, ^{vk57}     ; [ P ] -> Ctrl+W
    vkDB::Send, ^{vk58}     ; [ [ ] -> Ctrl+X
    vkDD::return            ; [ ] ]

    vk41::Send, ^{vk4D}     ; [ A ] -> Ctrl+M
    vk53::Send, ^{vk53}     ; [ S ] -> Ctrl+S
    vk44::Send, ^{vk52}     ; [ D ] -> Ctrl+R
    vk46::Send, ^{vk45}     ; [ F ] -> Ctrl+E
    vk47::Send, ^{vk4B}     ; [ G ] -> Ctrl+K
    vk48::Send, ^{vk4A}     ; [ H ] -> Ctrl+J
    vk4A::Send, ^{vk4F}     ; [ J ] -> Ctrl+O
    vk4B::Send, ^{vk54}     ; [ K ] -> Ctrl+T
    vk4C::Send, ^{vk48}     ; [ L ] -> Ctrl+H
    vkBA::Send, ^{vk55}     ; [ ; ] -> Ctrl+U
    ; vkDE                  ; [ ' ] -> ShiftOn modifier
    ; vkDC::return          ; [ \ ] -> Control

    vkE2::return            ; [ <> ]
    vk5A::Send, ^{vk5A}     ; [ Z ] -> Ctrl+Z
    vk58::Send, ^{vkDE}     ; [ X ] -> Ctrl+'
    vk43::Send, ^{vk41}     ; [ C ] -> Ctrl+A
    vk56::Send, ^{vk43}     ; [ V ] -> Ctrl+C
    ; vk42                  ; [ B ] -> modifier for the Symbols layer
    vk4E::Send, ^{vk50}     ; [ N ] -> Ctrl+P
    vk4D::Send, ^{vk4E}     ; [ M ] -> Ctrl+N
    vkBC::Send, ^{vk47}     ; [ , ] -> Ctrl+G
    vkBE::Send, ^{vk51}     ; [ . ] -> Ctrl+Q
    vkBF::return            ; [ / ]
#If
