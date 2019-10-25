%include 'lol.asm'
section .text
    global _start
        _start:
        mov ecx, 0

        nextNumber:
        inc ecx
        mov eax, ecx
        add eax, 48
        push rax
        mov eax, esp
        call sprintLF

        pop rax
        cmp ecx, 10
        jne nextNumber
        
        call quit