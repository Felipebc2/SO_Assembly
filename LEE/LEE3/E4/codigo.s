.intel_syntax noprefix
.global _start

.section .text

_start:
    SUB RAX, RAX
    OR RAX, r14
    OR RAX, rcx

    SUB r10, r10
    OR r10, r14
    AND r10, rcx
    NOT r10

    AND RAX, r10
