global _start

section .text

_start:
    mov r9, 0
    int 3

    cmp rdi, 0
    je endloop

    whileloop:
    mov r8b, [rdi]
    cmp r8b, 0
    je endloop

    add r9, 1
    add rdi, 1
    jmp whileloop

    endloop:
    mov rax, r9
    int 3