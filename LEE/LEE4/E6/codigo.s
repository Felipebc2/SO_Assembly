.intel_syntax noprefix
.global _start

.section .text

_start:
    mov rax, [rsp]
    add rax, [rsp + 8]
    add rax, [rsp + 16]
    add rax, [rsp + 24]
    add rax, [rsp + 32]
    mov rcx, 5
    cqo
    idiv rcx
    add rsp, 40
    sub rsp, 8
    mov [rsp], rax
