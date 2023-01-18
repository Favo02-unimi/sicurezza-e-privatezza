.global _start
_start:
.intel_syntax noprefix

#rdi = src_addr

mov rax, 0

cmp rdi, 0
je end

    whileloop:
    cmp byte ptr[rdi], 0
    je end

        cmp byte ptr[rdi], 90
        jg finecond

            push rax
            push rdi

            mov rdi, [rdi]

            mov r12, 0x403000
            call r12

            pop rdi
            mov [rdi], rax
            pop rax

            inc rax

        finecond:
        inc rdi

    jmp whileloop

end:
ret
