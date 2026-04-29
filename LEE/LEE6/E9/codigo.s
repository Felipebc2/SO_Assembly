.intel_syntax noprefix
.global _start

.section .text

_start:
    mov eax, 1
    mov edi, 1
    mov esi, 0x404358
    mov edx, 100
    syscall
