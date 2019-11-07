section .text
global _start
    _start:
    mov edx, len1
    mov ecx, msg1
    mov ebx, 1
    mov eax, 4
    int 80h

    mov eax, 3
    mov ebx, 0
    mov ecx, minuend
    mov edx, 2
    int 80h

    mov eax, 3
    mov ebx, 0
    mov ecx, subtrahend
    mov edx, 2
    int 80h

    sub ah,ah
    mov al, [minuend]
    sub al, [subtrahend]
    aas
    or al, 30h
    mov [res], ax

    mov edx, 2
    mov ecx, res
    mov ebx, 1
    mov eax, 4
    int 80h

    mov eax, 1
    int 80h

section .data
    msg1 db 'Enter the minuend followed by the subtrahend', 0xa
    len1 equ $ -msg1

section .bss
    res resb 2
    minuend resb 2
    subtrahend resb 2
