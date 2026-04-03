.intel_syntax noprefix
.global _start

.section .text

_start:
    pop rax
    pop rbx
    mov rcx, rax
    xor rcx, rbx
    push rax
    push rcx
    push rbx
