; creates HelloWorld.txt and writes Hello World

SECTION .data
    filename db 'HelloWorld.txt', 0h
    contents db 'Hello World', 0h

SECTION .text
global _start
    _start:
    ;creates file
    mov ecx, 0777
    mov ebx, filename
    mov eax, 8
    int 80h

    ;writes file
    mov edx, 12
    mov ecx, contents
    mov ebx, eax
    mov eax, 4
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h