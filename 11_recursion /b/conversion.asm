section .bss
Buff resb 1

section .text
global _start
    _start:

    Read: 
        mov eax, 3
        mov ebx, 0
        mov ecx, Buff
        mov edx, 1
        int 80h

        cmp eax, 0
        je Exit

        cmp byte[Buff], 61h
        jb Write
        cmp byte[Buff], 7Ah
        ja Write

        sub byte [Buff], 20h

    Write:
        mov eax, 4
        mov ebx, 1
        mov ecx, Buff
        mov edx, 1
        int 80h
        jmp Read

    Exit:
        mov eax, 1
        mov ebx, 0
        int 80h 

section .data


; ./conversion > allupper.txt < conversion.asm