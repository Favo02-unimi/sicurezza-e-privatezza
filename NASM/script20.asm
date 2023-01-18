global _start

section .text

_start:
    mov r9, 0
    mov rax, 0

    forloop:
    add rax, [rdi + r9 * 8]
    add r9, 1

    cmp r9, rsi
    jne forloop

    div r9