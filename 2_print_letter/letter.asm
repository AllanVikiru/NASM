section .text
    global _start
        _start:
            mov edx, len ;message length
            mov ecx, msg ;message to write
            mov ebx, 1 ;file descriptor (std out)
            mov eax, 4; sys_write
            int 80h

            mov edx, lenletter ;message length
            mov ecx, letter ;message to write
            mov ebx, 1 ;file descriptor (std out)
            mov eax, 4; sys_write
            int 80h

            mov eax, 1
            int 80h

section .data
        msg db 'The first letter of my name is: ' , 0xa
        len equ $ - msg

        letter times 4 db 'A', 0xa
        lenletter equ $ -letter

