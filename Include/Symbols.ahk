;--- Symbols ---

#If state.SymOn or (state.StickySymOn and A_PriorHotkey = "*vk42")
    vkBD::Send, {U+005f}    ; [ - ] -> _

    vk51::Send, {u+002a}    ; [ Q ] -> *
    vk57::Send, {u+002f}    ; [ W ] -> /
    vk45::Send, {u+003c}    ; [ E ] -> <
    vk52::Send, {u+003e}    ; [ R ] -> >
    vk54::Send, {u+0040}    ; [ T ] -> @
    vk59::Send, {u+0025}    ; [ Y ] -> %
    vk55::Send, {u+0026}    ; [ U ] -> &
    vk49::Send, {u+0028}    ; [ I ] -> (
    vk4F::Send, {u+0029}    ; [ O ] -> )
    vk50::Send, {u+002f}    ; [ P ] -> /
    vkDB::Send, {u+002a}    ; [ [ ] -> *
    vkDD::Send, {u+007e}    ; [ ] ] -> ~

    vk41::Send, {u+005e}    ; [ A ] -> ^
    vk53::Send, {u+0024}    ; [ S ] -> $
    vk44::Send, {u+0025}    ; [ D ] -> %
    vk46::Send, {u+0026}    ; [ F ] -> &
    vk47::Send, {u+002b}    ; [ G ] -> +
    vk48::Send, {u+002b}    ; [ H ] -> +
    vk4A::Send, {u+007b}    ; [ J ] -> {
    vk4B::Send, {u+005b}    ; [ K ] -> [
    vk4C::Send, {u+005d}    ; [ L ] -> ]
    vkBA::Send, {u+007d}    ; [ ; ] -> }
    ; vkDE                  ; [ ' ] -> ShiftOn modifier
    vkDC::Send, {u+007c}    ; [ \ ] -> |

    vkE2::Send, {u+003d}    ; [ <> ] –> =
    vk5A::Send, {u+005c}    ; [ Z ] -> \
    vk58::Send, {u+002f}    ; [ X ] -> /
    vk43::Send, {u+007c}    ; [ C ] -> |
    vk56::Send, {u+002d}    ; [ V ] -> -
    ; vk42                  ; [ B ] -> modifier for the Symbols layer
    vk4E::Send, {u+002d}    ; [ N ] -> -
    vk4D::Send, {u+007c}    ; [ M ] -> |
    vkBC::Send, {u+005c}    ; [ , ] -> \
    vkBE::Send, {u+002f}    ; [ . ] -> /
    vkBF::Send, {u+003d}    ; [ / ] –> =
#If

#If state.ShiftOn or (state.StickyShiftOn and (A_PriorHotkey = "*CapsLock" or A_PriorHotkey = "*vkDE"))
    ;~ vk31::Send,           ; [ 1 ] -> activates Navigation layer
    *vk32::Send,  {U+2013}   ; [ 2 ] -> – (En-Dash)
    *vk33::Send, {U+0029}    ; [ 3 ] -> (
    *vk34::Send, {U+0029}    ; [ 4 ] -> )
    *vk35::Send, {U+003B}    ; [ 5 ] -> ;
    *vk36::Send, {U+003A}    ; [ 6 ] -> :
    *vk37::Send, {U+003A}    ; [ 7 ] -> :
    *vk38::Send, {U+003B}    ; [ 8 ] -> ;
    *vk39::Send, {U+0028}    ; [ 9 ] -> (
    *vk30::Send, {U+0029}    ; [ 0 ] -> )
    *vkBD::Send, {U+2013}    ; [ - ] -> – (En-Dash)
    *vkBB::Send, {u+003d}    ; [ = ] -> =
#If

#UseHook On
    ;~ vk31::Send,           ; [ 1 ] -> activates Navigation layer
    *vk32::Send, {U+002D}    ; [ 2 ] -> -
    *vk33::Send, {U+0022}    ; [ 3 ] -> "
    *vk34::Send, {U+002E}    ; [ 4 ] -> .
    *vk35::Send, {U+002C}    ; [ 5 ] -> ,
    *vk36::Send, {U+003F}    ; [ 6 ] -> ?
    *vk37::Send, {U+003F}    ; [ 7 ] -> ?
    *vk38::Send, {U+002C}    ; [ 8 ] -> ,
    *vk39::Send, {U+002E}    ; [ 9 ] -> .
    *vk30::Send, {U+0022}    ; [ 0 ] -> "
    *vkBD::Send, {U+002D}    ; [ - ] -> -
    *vkBB::Send, {U+0021}    ; [ = ] -> !
#UseHook Off