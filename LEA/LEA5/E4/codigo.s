.intel_syntax noprefix
.global _start

.section .text

_start:
    mov rax, [rsp]
    mov rbx, [rsp+8]
    mov [rsp], rbx
    mov [rsp+8], rax