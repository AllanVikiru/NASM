%include "include.asm"

section .data
    msg1 db "Enter first number"
    len1 equ $ -msg1

    msg2 db "Enter second number"
    len2 equ $ -msg2

    msg3 db "Result is:"
    len3 equ $ -msg3


section .text
     global _start
     _start:
     output msg1, len1
     input firstNumber, length

     output msg2, len2
     input secondNumber, length

     subtract firstNumber, secondNumber

     output msg3, len3
     output result, length

     exit

section .bss
    firstNumber resb 2
    secondNumber resb 2
    result resb 2