.intel_syntax noprefix
.global _start

.section .text

_start:
    movzx r12, BYTE PTR [0x404000]
    movzx rax, WORD PTR [0x404004]