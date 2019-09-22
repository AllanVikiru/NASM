section .data
        msg db "My name is Allan"
        len equ $ - msg

%macro name 2 ; macro name declared with 2 parameters
    mov eax, 4 ; SYS_WRITE
    mov ebx, 1 ; SYS_OUT
    mov ecx, msg ; argument one - to display name
    mov edx, len ; argument two - to set length of name
    int 80h
%endmacro

%macro exit 0
    mov eax, 1
    int 80h
%endmacro

section .text
    global _start
        _start:
            name msg, len ;run macro parsing parameters msg and len
            exit



