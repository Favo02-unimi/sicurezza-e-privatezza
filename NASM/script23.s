.global _start
_start:
.intel_syntax noprefix

# rdi = src_addr 
# rsi = size

# rcx = b
# rdx = i

# r8 = curr_byte

# r12 = max_freq
# r13 = max_freq_byte

# --------------------------------------

mov rbp, rsp
sub rsp, 0x1fe                      # allocate rsi 2 bytes for every possible byte

mov rcx, 0                          # b
mov rdx, 0                          # i
mov r8, 0                           # curr_byte

mov r12, 0                          # max_freq
mov r13, 0                          # max_freq_byte

forloop1:
cmp rdx, rsi
jge fineforloop1

    mov r8b, [rdi + rdx]            # curr_byte
    
    shl r8, 1                       # r8 * 2
    neg r8                          # r8 = -r8
    inc word ptr[rsp + r8]          
    neg r8                          # -r8 = r8
    shr r8, 1                       # r8 /2
    inc rdx                         # i++

jmp forloop1

fineforloop1:
mov rcx, 0                          # b
# --------------------------------------

forloop2:
cmp rcx, 0xff
jg end

    shl rcx, 1                      #rcx * 2
    neg rcx
    mov r14w, [rsp + rcx]           #[stack_base - b]
    neg rcx
    shr rcx, 1                      #rcx / 2

    cmp r14w, r12w
    jle finecond1

        mov r12w, r14w
        mov r13, rcx

    finecond1:
    inc rcx                          # b++
    jmp forloop2

end:
mov rsp, rbp
mov rax, r13
ret
