.intel_syntax noprefix
.global _start

.section .text

_start:
    AND r8, 0
    OR r8, rcx
    AND r8, 1

    AND r9, 0
    OR r9, r10
    AND r9, 1

    AND r11, 0
    OR r11, r12
    AND r11, 1

    AND r13, 0
    OR r13, r8
    AND r13, r9
    AND r13, r11
    XOR r13, 1

    AND r14, 0
    OR r14, r8
    XOR r14, r9
    XOR r14, r11

    AND r14, r13

    AND RAX, 0
    OR RAX, r14
