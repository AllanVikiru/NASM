section .data
        msg db "The macro 'exit' has run successfully"
        len equ $ - msg

%macro exit 0 ; declare macro 'exit' with 0 arguments
    mov eax, 1 ; SYS_EXIT
    int 80h
%endmacro

section .text
    global _start
        _start:
            mov eax, 4
            mov ebx, 1
            mov ecx, msg
            mov edx, len
            int 80h

            exit ; run macro exit



