; creates myFile.txt

SECTION .data
    filename db 'myFile.txt'

SECTION .text
global _start
    _start:
    mov ecx, 0777
    mov ebx, filename
    mov eax, 8
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h