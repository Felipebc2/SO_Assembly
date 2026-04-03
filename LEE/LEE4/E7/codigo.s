.intel_syntax noprefix
.global _start

.section .text

_start:
    mov rax, r14
    imul rax, r9
    push rax
    mov rax, rsi
    imul rax, r15
    mov rbp, rax
    pop rax
    sub rax, rbp
    imul rax, r13
    push rax

    mov rax, r8
    imul rax, r9
    push rax
    mov rax, rsi
    imul rax, rdx
    mov rbp, rax
    pop rax
    sub rax, rbp
    imul rax, rdi
    push rax

    mov rax, r8
    imul rax, r15
    push rax
    mov rax, r14
    imul rax, rdx
    mov rbp, rax
    pop rax
    sub rax, rbp
    imul rax, rcx

    pop rbp
    sub rax, rbp
    pop rbp
    add rax, rbp
