%include "procs.asm"

%macro printer 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro


section .data
    global array
    
    array:
        db 1
        db 2
        db 3
        db 1
        
    sum db 0
    
    sum_msg db 'The sum is: '
    sum_msg_len equ $ - sum_msg


section .text
    global _start
    _start:

    printer sum_msg, sum_msg_len

    mov  eax,4      ;number bytes to be summed 
    mov  ebx,0      ;EBX will store the sum
    mov  ecx,array  ;ECX will point to the current element to be summed
    
    ;extern procedure in procs.asm
    call addition

    add   ebx, '0' ;Convert the sum to ascii to print
    mov  [sum], ebx ;done, store result in "sum"
 
    printer sum, 1
    
    jmp exit; exit program
    
    
exit:
    mov eax, 1 ;exit call
    int 0x80    ;interrupt 