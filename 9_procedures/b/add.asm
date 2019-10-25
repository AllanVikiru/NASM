SYS_OUT equ 1
SYS_IN equ 0
SYS_WRITE equ 4
SYS_READ equ 3
SYS_EXIT equ 1

section .data
    msg1 db "Enter first number:" ,0xa
    len1 equ $ -msg1

    msg2 db "Enter second number:" ,0xa
    len2 equ $ -msg2

    msg db "The sum is:" ,0xa
    len equ $ -msg
    lf db 0x0A

section .bss
        firstNumber resb 2
        secondNumber resb 2
        sum resb 2

section .text 
    global _start
        _start:

        mov eax, SYS_WRITE
        mov ebx, SYS_OUT
        mov ecx, msg1
        mov edx, len1
        int 80h

        mov eax, SYS_READ
        mov ebx, SYS_IN
        mov ecx, firstNumber
        mov edx, 2
        int 80h

        mov eax, SYS_WRITE
        mov ebx, SYS_OUT
        mov ecx, msg2
        mov edx, len2
        int 80h

        mov eax, SYS_READ
        mov ebx, SYS_IN
        mov ecx, secondNumber
        mov edx, 2
        int 80h

        mov eax, [firstNumber]
        sub eax, '0'

        mov ebx, [secondNumber]
        sub ebx, '0'
        call sumOf

        mov eax, SYS_WRITE
        mov ebx, SYS_OUT
        mov ecx, msg
        mov edx, len
        int 80h

        mov eax, SYS_WRITE
        mov ebx, SYS_OUT
        mov ecx, sum
        mov edx, 2
        int 80h

        mov eax, 1
        mov ebx, 0
        int 80h

        sumOf:
        add eax, ebx

        add eax, '0'
        mov[sum], eax
        ret


    

