.intel_syntax noprefix
.global _start

.section .text

_start:
    mov rax, [r10]
    mov rcx, [r10+8]
    cmp rax, rcx
    jge segundo
    mov rax, rcx
segundo:
    mov rcx, [r10+16]
    cmp rax, rcx
    jge fim
    mov rax, rcx
fim:
