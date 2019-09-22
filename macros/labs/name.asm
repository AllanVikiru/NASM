;lab exercise for user name input and displaying it as output

length equ 20

section .data
        msg db "My name is: "
        len equ $ - msg

%macro output 2 ; macro prompt declared with 2 parameters
    mov eax, 4 ; SYS_WRITE
    mov ebx, 1 ; SYS_OUT
    mov ecx, %1 ; argument one - to display 'My name is' prompt
    mov edx, %2 ; argument two - to set length of prompt
    ; setting these values allows for different arguments to be parsed through the same macro
    int 80h
%endmacro

%macro input 2 ; macro input declared with 2 parameters
    mov eax, 3 ; SYS_READ
    mov ebx, 0 ; SYS_IN
    mov ecx, name ; argument one - input variable name
    mov edx, length ; argument two - length of input variable
    ; setting these values limits the parameters of the macro to name and length only
    int 80h
%endmacro

%macro exit 0
    mov eax, 1
    int 80h
%endmacro

section .text
    global _start
        _start:
            output msg, len ; run macro output parsing parameters msg and len
            input name, length ; run macro input parsing parameters name and length
            output name, length ; run macro output parsing parameters name and length
            exit

section .bss
    name resb 20
    



