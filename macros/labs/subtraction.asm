; lab exercise to subtract 2 single digit numbers where macros and EQU definitions 
; are defined in include file.

%include "include.asm" ;declare include file

section .data
    msg1 db "Enter the first digit:"
    len1 equ $ - msg1

    msg2 db "Enter the second digit:"
    len2 equ $ - msg2

    msg3 db "The result is:"
    len3 equ $ - msg3 ;define output prompts

section .text
    global _start
        _start:
            output msg1, len1
            input firstNumber, length 
            
            output msg2, len2
            input secondNumber, length ; declare input and output macros

            subtract firstNumber, secondNumber ; declare subtract macro
            
            output msg3, len3
            output result, length ;declare output macros
            
            exit ;declare exit macro

section .bss
    firstNumber resb 2
    secondNumber resb 2
    result resb 2 ; reserve bytes for input numbers and result
