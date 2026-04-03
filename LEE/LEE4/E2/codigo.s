.intel_syntax noprefix
.global _start

.section .text

_start:
    mov rax, [rsi]
    mov rbx, [rsi + 8]
    mov rcx, rax
    add rcx, rbx
    mov [r11], rcx
    xor rax, rbx
    mov [r11 + 8], rax