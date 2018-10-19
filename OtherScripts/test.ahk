; Example #1: The basic concept of try/catch/throw.

try  ; Attempts to execute code.
{
    HelloWorld()
    MakeToast()
}
catch e  ; Handles the first error/exception raised by the block above.
{
    MsgBox, An exception was thrown!`nSpecifically: %e%
    Exit
}

HelloWorld()  ; Always succeeds.
{
    MsgBox, Hello, world!
}

MakeToast()  ; Always fails.
{
    ; Jump immediately to the try block's error handler:
    throw A_ThisFunc " is not implemented, sorry"
}