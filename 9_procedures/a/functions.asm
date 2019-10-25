slen:
push rbx
mov ebx, eax

nextchar:
cmp byte [eax], 0
jz finished
inc eax
jmp nextchar

finished:
sub eax, ebx
pop rbx
ret

sprint:
push rdx
push rcx
push rbx
push rax
call slen

mov edx, eax
pop rax

mov ecx, eax
mov ebx, 1
mov eax, 4
int 80h

pop rbx
pop rcx
pop rdx
ret

sprintLF:
call sprint
push rax
mov eax, 0Ah
push rax
mov eax, esp
call sprint
pop rax
pop rax
ret

quit:
mov ebx, 0
mov eax, 1
int 80h
ret
