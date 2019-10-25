%macro read 4
mov eax, %1
mov ebx, %2
mov ecx, %3
mov edx, %4
int 80h
%endmacro

%macro write 4
mov eax, %1
mov ebx, %2
mov ecx, %3
mov edx, %4
int 80h
%endmacro

section .text
    global _start
        _start:
            write 4,1, msg, msg_len
            read 3,1, firstnumber, 2
            write 4,1, msg2, msg2_len
            read 3,1, secondnumber, 2

            mov eax, [firstnumber]
            sub eax, '0'

            mov ebx, [secondnumber]
            sub ebx, '0'

            add eax, ebx

            mov eax, '0'
            mov [result], eax

            write 4,1, msg3, msg3_len

            write 4,1, result, 2

            mov eax, 1
            int 80h

section .data
    msg db 'Enter First Number:', 10
    msg_len equ $ -msg
    msg2 db 'Enter Second Number:', 10
    msg2_len equ $ -msg2
    msg3 db 'Result:', 10
    msg3_len equ $ -msg3

section .bss
    firstnumber resb 4
    secondnumber resb 4
    result resb 4


