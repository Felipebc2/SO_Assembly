.intel_syntax noprefix
.global _start

.section .text

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, 0x5544619a8000
    mov rdx, 256
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall
