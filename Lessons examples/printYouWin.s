.global _start
_start:
.intel_syntax noprefix

    nop
    nop
    nop
    nop
    nop

    nop
    nop
    nop
    nop
    nop

    nop
    nop
    nop
    nop
    nop

    nop
    nop
    nop
    nop
    nop

    nop
    nop
    nop
    nop
    nop

    nop
    nop
    nop
    nop
    nop

    nop
    nop
    nop
    nop
    nop

    nop
    nop
    nop
    nop
    nop

    nop

#MOVE you win TO STACK
    mov r12, [rip+youWinText]
    push r12

#SYS_WRITE
    xor eax, eax
    mov al, 1

    xor edi, edi
    mov dil, 1

    mov rsi, rsp

    xor edx, edx
    mov dl, 7

    syscall

#EXIT USING sys_exit
	mov	rax, 60	
	mov	rdi, 0
	syscall

youWinText:
    .string "you win"
