.intel_syntax noprefix
.global _start
.section .text
_start:
    xor rcx, rdi
    xor rdi, rcx
    xor rcx, rdi