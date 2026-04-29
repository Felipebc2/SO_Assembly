.intel_syntax noprefix
.global _start

.section .text

_start:
    lea rdi, [rip + path]
    xor esi, esi
    mov eax, 2
    syscall

    mov edi, eax
    sub rsp, 100
    mov rsi, rsp
    mov edx, 100
    xor eax, eax
    syscall

    mov edx, eax
    mov eax, 1
    mov edi, 1
    mov rsi, rsp
    syscall

path:
    .asciz "/desafio/recompensa.txt"
