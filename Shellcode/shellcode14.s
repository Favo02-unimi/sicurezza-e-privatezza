.global _start
_start:
.intel_syntax noprefix

#rax/eax = 0
#rdi/edi = 0        
#rsi/esi = rdx/edx

xor edi, edi
mov esi, edx

syscall
