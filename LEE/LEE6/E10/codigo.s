.intel_syntax noprefix
.global _start

.section .text

_start:
    xor eax, eax
    mov edi, 133
    mov esi, 0x404100
    mov edx, 100
    syscall
    mov edx, eax
    mov eax, 1
    mov edi, 1
    syscall
