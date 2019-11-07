section .text
global _start
    _start:

    sub ah, ah
    mov al, '3'
    add bl, '3'
    aaa
    or al, 30h
    mov [res], eax

    mov edx, len
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 80h

    mov edx, 2
    mov ecx, res
    mov ebx, 1
    mov eax, 4
    int 80h

    mov eax, 1
    int 80h

section .data
    msg db 'The result is:', 0xa
    len equ $ - msg

section .bss
    res resb 2
    