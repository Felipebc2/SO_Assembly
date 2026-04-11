.intel_syntax noprefix
.global _start

.section .text

_start:
    cmp rdi, 3
    ja default
    jmp [rsi + rdi*8]
default:
    jmp [rsi + 4*8]
