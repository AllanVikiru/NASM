SYS_OUT equ 1
SYS_IN equ 0
SYS_WRITE equ 4
SYS_READ equ 3
SYS_EXIT equ 1
length equ 2

%macro output 2 ; macro output declared with 2 parameters
    mov eax, SYS_WRITE
    mov ebx, SYS_OUT
    mov ecx, %1 ; argument one - to display prompt
    mov edx, %2 ; argument two - to set length of prompt
    int 80h
%endmacro

%macro input 2 ; macro input declared with 2 parameters
    mov eax, SYS_READ
    mov ebx, SYS_IN 
    mov ecx, %1 ; argument one - to define input variable
    mov edx, %2 ; argument two - to set length of variable
    int 80h
%endmacro

%macro subtract 2
    mov eax, [%1]
    sub eax, '0'
    mov ebx, [%2]
    sub ebx, '0'
    sub eax, ebx
    add eax, '0'
    mov[result], eax
%endmacro

%macro exit 0 ; macro 'exit' declared with 0 parameters
    mov eax, 1
    int 80h
%endmacro