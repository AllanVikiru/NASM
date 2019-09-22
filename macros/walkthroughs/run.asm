SYS_OUT equ 1
SYS_IN equ 0
SYS_WRITE equ 4
SYS_READ equ 3
SYS_EXIT equ 1
length equ 2

%macro run 2 ; macro name defined with 2 arguments
    mov eax, SYS_WRITE
    mov ebx, SYS_OUT
    mov ecx, %1 
        ; argument one  - to display Hello World 
        ;values can be replaced with variables defined in section .data 
    mov edx, %2 
        ; argument two - to set length of name 
        ;values can be replaced with variables defined in section .data
    int 80h
%endmacro

%macro exit 0 ; macro 'exit' declared with 0 parameters
    mov eax, 1
    int 80h
%endmacro