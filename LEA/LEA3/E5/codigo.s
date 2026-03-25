.intel_syntax noprefix
.global _start

.section .text

_start:
    mov rdi, rdx
    mov rdx, 0
    mov rax, rbx
    div rdi
    mov rax, rdx
    mov rdx, rdi
