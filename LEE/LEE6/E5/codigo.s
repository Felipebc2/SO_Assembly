.intel_syntax noprefix
.global _start

.section .text

_start:
    mov rdi, 1838
    mov rax, 0x404388
    mov rax, [rax]
    call rax
