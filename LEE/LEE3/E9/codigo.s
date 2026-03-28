.intel_syntax noprefix
.global _start

.section .text

_start:
    MOVZX rbx, BYTE PTR [0x404000]
