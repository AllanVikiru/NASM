; Procedure to include in the cat.asm
     addition:
         add  ebx, [ecx]
         add  ecx,1      ;move pointer to next element
         dec  eax        ;decrement counter
         jnz  addition        ;if counter not 0, then loop again
         ret