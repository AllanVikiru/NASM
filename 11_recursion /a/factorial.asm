SYS_OUT equ 1
SYS_WRITE equ 4
SYS_EXIT equ 1
length equ 1

%macro output 2
mov eax, SYS_WRITE
mov ebx, SYS_OUT
mov ecx, %1
mov edx, %2
%endmacro

section .data
    msg db 'Factorial(3) = '
    len equ $ - msg

section .bss
    num resb 1

section .text
global _start
    _start:
    mov ebx, 3
    call factorial

    aas
    or eax, 30h
    mov [num], eax
    
    output msg, len
    output num, length
    call quit

compute:
    dec ebx
    call factorial
    inc ebx
    mul ebx
    ret

factorial:
    cmp ebx, 1
    jg compute
    mov eax, 1
    ret

quit:
    mov eax, SYS_EXIT
    mov ebx, 0
    int 80h 
