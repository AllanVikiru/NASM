; using include files - to display a string
%include "run.asm"
section .data
        msg db "Assembly Programming using Macros"
        len equ $ - msg

section .text
    global _start
        _start:
            run msg, len
            ; values can be replaced with variables defined in section .data 
            ;however it limits the application of the macro
            exit