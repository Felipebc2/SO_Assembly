.intel_syntax noprefix
.global _start

.section .text

_start:
    mov rdi, 484337
    mov rsi, 0x48
    mov rdx, 0x65
    mov rax, 0x4041b8
    mov rax, [rax]
    call rax
