SYS_OUT equ 1
SYS_IN equ 0
SYS_WRITE equ 4
SYS_READ equ 3
SYS_EXIT equ 1
length equ 2

%macro output 2
 mov eax,4
 mov ebx,1
 mov ecx,%1
 mov edx, %2
 int 80h
 %endmacro

%macro input 2
mov eax,3
mov ebx, 0
mov ecx, %1
mov edx, %2
int 80h
%endmacro

%macro subtract 2
mov eax , [%1]
sub eax, '0'
mov ebx, [%2]
sub ebx, '0'
sub eax, ebx
add eax,'0'
mov [result],eax
%endmacro

%macro exit 0
mov eax,1
int 80h
%endmacro