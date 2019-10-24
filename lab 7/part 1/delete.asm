; delete file myFile.txt
SECTION .data
filename db 'myFile.txt', 0h

SECTION .text
global _start
    _start:
    mov ebx, filename
    mov eax, 10
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h