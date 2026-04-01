.intel_syntax noprefix
.global _start

.section .text

_start:
    xor rdi, rdi
    mov dil,  [0x404000]
    xor r8,  r8
    mov r8w, [0x404004]