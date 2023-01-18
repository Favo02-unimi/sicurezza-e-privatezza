global _start

section .text

_start:
    cmp dword[rdi], 0x7f454c46
    je cond1
    cmp dword[rdi], 0x00005A4D
    je cond2
    jmp cond3

    cond1:
    mov eax, [rdi + 4]
    add eax, [rdi + 8]
    add eax, [rdi +12]
    jmp done

    cond2:
    mov eax, [rdi + 4]
    sub eax, [rdi + 8]
    sub eax, [rdi +12]
    jmp done

    cond3:
    mov eax, [rdi + 4]
    imul eax, [rdi + 8]
    imul eax, [rdi +12]
    jmp done

    done:
