.intel_syntax noprefix
.global _start

.section .text

_start:
    push rsi
    push r13
    pop rsi
    pop r13
