section .text
global _start
    _start:
    call display
    
    mov eax, 1
    int 80h

    display:
    mov ecx, 256

    next:
    push rcx
    mov eax, 4
    mov ebx, 1
    mov ecx, achar
    mov edx, 1
    int 80h

    pop rcx
    mov dx, [achar]
    cmp byte [achar], 0dh
    inc byte [achar]
    loop next
    ret

section .data
achar db '0'