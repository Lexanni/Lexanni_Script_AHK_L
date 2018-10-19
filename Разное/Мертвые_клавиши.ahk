>!vkBA::return ; RAlt+:
>!vk36::return ; RAlt+^

#If A_PriorHotkey = ">!vkBA"
    vk41::Send, ä  ; A
    +vk41::Send, Ä   ; Shift+A
    vk53::Send, ß  ; S
    vk55::Send, ü  ; U
    +vk55::Send, Ü  ; Shift+U
    vk4F::Send, ö  ; O
    +vk4F::Send, Ö  ; Shift+O
#If

#If A_PriorHotkey = ">!vk36"
    vk41::Send, â  ; A
    +vk41::Send, Â   ; Shift+A
    vk53::Send, ŝ  ; S
	+vk53::Send, Ŝ  ; Shift+S
    vk55::Send, û  ; U
    +vk55::Send, Û  ; Shift+U
    vk4F::Send, ô  ; O
    +vk4F::Send, Ô  ; Shift+O
#If
