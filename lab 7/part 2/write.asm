section .text
    global _start
        _start:
        ; create a file
        mov eax, 8
        mov ebx, filename
        mov ecx, 0777
        int 80h

        mov[fd], eax

        ;write content 
        mov eax, 4
        mov ebx, [fd]
        mov ecx, parte
        mov edx, parte_len

        ;close file
        mov eax, 6
        mov ebx, [fd]
        int 80h

        mov ebx, 0
        mov eax, 1
        int 80h

section .data
    filename db 'file.txt'
    parte db 'Partition'
    parte_len equ $-parte

section .bss
    fd resb 1
