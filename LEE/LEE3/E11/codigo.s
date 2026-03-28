.intel_syntax noprefix
.global _start

.section .text

_start:
    MOV rdi, [0x404000]
    ADD QWORD PTR [0x404000], 0x42
