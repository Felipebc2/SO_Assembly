.intel_syntax noprefix
.global _start
.section .text

_start:
    mov r11w, 0x7FFFFFFFFFFFFFFF
    add r11w, 1