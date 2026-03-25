.intel_syntax noprefix
.global _start

.section .text

_start:
    mov rax, r9
    imul rax, rdx
    add rax, r11