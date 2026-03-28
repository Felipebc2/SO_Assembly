.intel_syntax noprefix
.global _start

.section .text

_start:
    AND RAX, rbx
    AND RAX, 1
    XOR RAX, 1
