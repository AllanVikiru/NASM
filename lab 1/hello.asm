section .data
        text db "Hello, World!" , 10 
        ; db - define bytes in hello world 
        ; each character in the string is a single byte
        ; 10 - newline character eg \n denotes new line in code
        ; text - name assigned to memory address 

section .text
    global _start ; for the linker to know the addressof a label

_start:        ; used for linker to start compiling
    mov rax, 1 ;***
    mov rdi, 1 ; define file descriptor - standard output (1) in rdi
    mov rsi, text ; move value of text to rsi register
    mov rdx, 14 ; move value of string length 14
    syscall ; a program requesting a service from the kernel
            ; they take arguments or a list of inputs - for writing 
            ; [sys_write - declare code to be executed] : 4

    mov rax, 60
    mov rdi, 0 ; load 0 as error code to define no errors
    syscall 
    ; sys_exit - define end of code