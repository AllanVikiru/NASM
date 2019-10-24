; appends updated to HelloWorld.txt
section .data
filename db 'myFile.txt', 0h
contents db '-updated-', 0h

section .text
global _start
    _start:
    mov ecx, 1
    mov ebx, filename
    mov eax, 5; ;call to sys_open
    int 80h

    mov edx, 2 ;whence argument
    mov ecx, 0 ; move cursor to 0 bytes section
    mov ebx, eax
    mov eax, 19 ; call to sys_seek
    int 80h

    mov edx, 9 ;size of bytes
    mov ecx, contents
    mov ebx, ebx
    mov eax, 4
    int 80h

    mov ebx, 0
    mov eax, 1
    int 80h