section .text
    global _start
    _start:
    mov ecx, 10
    mov eax, '9'

    l1:
    mov [num], eax
    mov eax, 4
    mov ebx, 1
    push rcx

    mov ecx, num
    mov edx, 1
    int 80h

    mov eax, [num]
    sub eax, '0'
    dec eax
    add eax, '0'
    pop rcx
    loop l1

    mov eax, 1
    int 80h

section .bss
    num resb 1