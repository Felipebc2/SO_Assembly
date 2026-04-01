.intel_syntax noprefix
.global _start

.section .text

_start:
    mov rax, [0x404000]

    lea r15, [rax]
    and r15, 0xff

    lea rbp, [rax]
    shr rbp, 8
    and rbp, 0xff

    lea r12, [rax]
    shr r12, 16
    and r12, 0xff

    shr rax, 24
    and rax, 0xff
    and rdx, rax