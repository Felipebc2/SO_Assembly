.intel_syntax noprefix
.global _start

.section .text

_start:
    pop rax
    imul rax, rdi
    push rax
