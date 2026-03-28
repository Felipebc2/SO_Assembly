.intel_syntax noprefix
.global _start

.section .text

_start:
    MOV RAX, r9
    IMUL RAX, rbx
    IMUL RAX, r11

    MOV r10, r9
    IMUL r10, r8
    IMUL r10, r12
    SUB RAX, r10

    MOV r10, r14
    IMUL r10, rcx
    IMUL r10, r11
    SUB RAX, r10

    MOV r10, r14
    IMUL r10, r8
    IMUL r10, rdi
    ADD RAX, r10

    MOV r10, r13
    IMUL r10, rcx
    IMUL r10, r12
    ADD RAX, r10

    MOV r10, r13
    IMUL r10, rbx
    IMUL r10, rdi
    SUB RAX, r10
