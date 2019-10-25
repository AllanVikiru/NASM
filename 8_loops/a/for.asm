section .data
    msg db "Repeating Message", 10
    len equ $ -msg

section .text
    global _start
    _start:
            mov eax, 0 ; count
            jmp forloop

            forloop:
            cmp eax, 20
            je finished
            push rax ;eax doesnt work w/ pop and push so we use 64-bit registers like rax
            
            mov eax, 4
            mov ebx, 1
            mov ecx, msg
            mov edx, len
            int 0x80

            pop rax ;eax doesnt work w/ pop and push so we use 64-bit registers like rax
            add eax, 1
            jmp forloop

            finished:
            mov eax, 1
            mov ebx, 0
            int 0x80
