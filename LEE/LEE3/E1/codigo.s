.intel_syntax noprefix
.global _start

.section .text

_start:
    MOV RAX, r12
    SHR RAX, 40
    SHL RAX, 56
    SHR RAX, 56