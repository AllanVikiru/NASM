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

section .text
    global _start
        _start:
            mov eax, SYS_WRITE
            mov ebx, SYS_OUT
            mov ecx, msg1
            mov edx, len1
            int 80h

            mov eax, SYS_READ
            mov ebx, SYS_IN
            mov ecx, firstNumber
            mov edx, 2
            int 80h

            mov eax, SYS_WRITE
            mov ebx, SYS_OUT
            mov ecx, msg2
            mov edx, len2
            int 80h

            mov eax, SYS_READ
            mov ebx, SYS_IN
            mov ecx, secondNumber
            mov edx, 2
            int 80h

            ; moving the first number to eax register and second number to ebx
            ; and subtracting ascii '0' to convert it into a decimal number
            mov eax, [firstNumber]
            sub eax, '0'

            mov ebx, [secondNumber]
            sub ebx, '0'

            sub eax, ebx
            add eax, '0'

            mov[result], eax

            mov eax, SYS_WRITE
            mov ebx, SYS_OUT
            mov ecx, msg3
            mov edx, len3
            int 80h

            mov eax, SYS_WRITE
            mov ebx, SYS_OUT
            mov ecx, result
            mov edx, 2
            int 80h

            mov eax, SYS_EXIT
            int 80h

            
  
section .bss
    firstNumber resb 2
    secondNumber resb 2
    result resb 2

