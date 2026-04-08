.intel_syntax noprefix
.global _start

.section .text

_start:
    mov rsi, [rsp]
    add rsp, 8