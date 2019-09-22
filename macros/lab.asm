; lab exercise to subtract 2 numbers
SYS_OUT equ 1
SYS_IN equ 0
SYS_WRITE equ 4
SYS_READ equ 3
SYS_EXIT equ 1

section .data
    msg1 db "Enter the first digit:"
    len1 equ $ - msg1

    msg2 db "Enter the second digit:"
    len2 equ $ - msg2

    msg3 db "The result is:"
    len3 equ $ - msg3

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
    mov eax, [firstNumber]
    sub eax, '0'
    mov ebx, [secondNumber]
    sub ebx, '0'
    sub eax, ebx
    add eax, '0'
    mov[result], eax
%endmacro

%macro exit 0 ; macro 'exit' declared with 0 parameters
    mov eax, 1
    int 80h
%endmacro


section .text
    global _start
        _start:
            output msg1, len1
            input firstNumber, 2
            
            output msg2, len2
            input secondNumber, 2

            subtract firstNumber, secondNumber
            
            output msg3, len3
            output result, 2
            
            exit

section .bss
    firstNumber resb 2
    secondNumber resb 2
    result resb 2
