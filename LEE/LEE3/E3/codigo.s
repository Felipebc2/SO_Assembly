.intel_syntax noprefix
.global _start

.section .text

_start:
    XOR RAX, RAX
    OR RAX, r9
    AND RAX, r11
