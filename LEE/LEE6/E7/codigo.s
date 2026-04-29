.intel_syntax noprefix
.global _start

.section .text

_start:
    mov rdi, 9248619
    mov rsi, 0x56
    movsd xmm0, [rip + float_val]
    mov rax, 0x4047c0
    mov rax, [rax]
    call rax

float_val:
    .double 362.428
