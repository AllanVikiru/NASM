%include 'functions.asm'

section .data
    msg1 db 'Enter name:', 0h
    msg2 db 'Hello,', 0h

section .bss
    sinput: resb 255

section .text
    global _start
        _start:
        mov eax, msg1
        call sprint

        mov edx, 255
        mov ecx, sinput
        mov ebx, 0
        mov eax, 3
        int 80h

        mov eax, msg2
        call sprint
        
        mov eax, sinput
        call sprint

        call quit