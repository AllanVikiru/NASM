SYS_READ equ 3
SYS_WRITE equ 4
SYS_EXIT equ 1
SYS_IN equ 0
SYS_OUT equ 1

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
      int 80h    ;constant for 'enter first digit' output 

      mov eax, SYS_READ
      mov ebx, SYS_IN
      mov ecx, firstNumber
      mov edx, 2
      int 80h    ;read first number

      mov eax, SYS_WRITE
      mov ebx, SYS_OUT
      mov ecx, msg2
      mov edx, len2
      int 80h   ;constant for 'enter second digit' output

      mov eax, SYS_READ
      mov ebx, SYS_IN
      mov ecx, secondNumber
      mov edx, 2
      int 80h     ;read second number

      mov eax, [firstNumber]
      sub eax, '0'   ; move digits to eax and ebx registers and 
      mov ebx, [secondNumber]
      sub ebx, '0'   ; subtracting ascii '0' to convert it into a decimal number

      add eax, ebx    ;add values in eax and ebx registers
     
      mov ecx, result
      mov edx, 2      ; store result in eax and return default screen in case of errors

      cmp eax, 10 ;compare result with 10
      jb Digit ; if greater jump to  function digit

     

      mov byte [ecx], '1' ; write 1 into a byte and move it to ecx  
      inc ecx 
      inc edx ;increment ecx and edx by 1
      sub eax, 10 ;subtract 10 from eax

      Digit:
      add eax, '0' ;add ascii 0 to eax
      mov [ecx], eax ;copy content in eax to ecx 
    
      mov eax, SYS_WRITE
      mov ebx, SYS_OUT
      mov ecx, msg3
      mov edx, len3
      int 80h   ;display 'the result is:' output

      mov eax, SYS_WRITE
      mov ebx, SYS_OUT
      mov ecx, result
      mov edx, 2
      int 80h   ;display result
      
      mov eax, SYS_EXIT
      int 80h
     
section .bss ;declare variables
  firstNumber resb 2
  secondNumber resb 2
  result resb 4