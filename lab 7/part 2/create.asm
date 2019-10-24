section .text
    global _start
        _start:
        ; create a file
        mov eax, 8
        mov ebx, filename
        mov ecx, 0777
        int 80h

        mov ebx, 0
        mov eax, 1
        int 80h

section .data
    filename db 'file.txt'
