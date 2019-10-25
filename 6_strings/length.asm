; code for operation ... len equ $ ...
section .data
msg db 'My String', 0ah

section .text
    global _start
        _start:
            mov ebx, msg
            mov eax, ebx ;both eax and ebx point to the same memory

        nextchar:
            cmp byte [eax], 0 ;compares the string one byte/character at a time
            jz finished
            inc eax
            jmp nextchar

        finished:
            sub eax, ebx ;find the string length
            
        ;print  
        mov edx, eax
        mov ecx, msg
        mov ebx, 1
        mov eax, 4
        int 80h

        ;exit
        mov eax, 1
        int 80h





