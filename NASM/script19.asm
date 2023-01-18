global _start

section .text

_start:
    
    cmp rdi, 4
    jge defaulttt
    jmp [rsi + rdi * 8]

    defaulttt:
    jmp [rsi + 32]
