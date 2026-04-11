.intel_syntax noprefix
.global _start

.section .text

_start:
    xor rax, rax
    mov rcx, r10
    sub rcx, r14
    jz fim
    mov rdx, r10
    sub rdx, r11
    jz fim
    xor rcx, rdx
    jns fim
    mov rax, 1
fim:
