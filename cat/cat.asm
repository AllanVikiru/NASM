%macro print_and_display 2
;output function
mov eax, 4
mov ebx, 1
mov ecx, %1
mov edx, %2
int 80h

;input
mov eax, 3
mov ebx, 0
mov ecx, %1
mov edx, %2
int 80h
%endmacro

section .data
    global x

    largest db 0
    largest_len equ $ -largest

    msg db 'Largest Number is:', 10
    msg_len equ $ -msg

section .text
    global _start
    _start:
            mov ecx, 3
            mov eax, '1'

           ;loop to populate array x
            l1:
            mov [x], eax
            mov eax, 4
            mov ebx, 1
            push rcx

            mov ecx, x
            mov edx, 1
            int 80h

            mov eax, [x]
            sub eax, '0'
            inc eax
            add eax, '0'
            pop rcx
            loop l1

            int 80h

            ;largest 
            mov esi, eax
            mov cl, [esi]
            inc esi
            mov al, [esi]
            dec cl
            inc esi

            l2:
            cmp al, [esi]
            jnc skip
            mov al, [esi]

            skip:
            inc esi
            loop l2
            mov [ebx], al
            int 80h
            
            mov [largest], ebx
            
            print_and_display msg, msg_len
            print_and_display largest, largest_len

            ; exit program
            jmp exit
    
    
            exit:
            mov eax, 1 
            int 80h    
section .bss
x resb 3
