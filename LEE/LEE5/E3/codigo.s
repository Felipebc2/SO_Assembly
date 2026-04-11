.intel_syntax noprefix
.global _start

.section .text

_start:
    mov rax, [rsp]
    mov rcx, [rsp+8]
    imul rax, rcx
    jno fim
    mov rax, -1
fim:
