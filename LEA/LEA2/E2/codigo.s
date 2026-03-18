.intel_syntax noprefix
.global _start
.section .text
_start:
    mov eax, 42
    mov edi, 0x7777
    movabs r11, 0xFEEDF00DC0CACAFE
