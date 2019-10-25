section .text
    global _start
    _start:
    mov esi, 4 ; esi - general purpose register
    mov ecx, 5
    clc ; clears carry flags

    l1:
    mov al, [num1+esi] ; al -register for lower significant bits
    adc al, [num2+esi]
    aaa ; stores 2 BCD digit result
    pushf
    or al, 30h
    popf ; 11-13 stores value of flags

    mov [sum+esi], al
    dec esi
    loop l1

    mov edx, len
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 80h

    mov edx, 5
    mov ecx, sum
    mov ebx, 1
    mov eax, 4
    int 80h

    mov eax, 1
    int 80h

section .data
    msg db 'The sum is: ', 0xa
    len equ $ - msg
    num1 db '12345'
    num2 db '23456'
    sum db '      ' ; 6 spaces
