.intel_syntax noprefix
.global _start

.section .text

_start:
    mov eax, [r10]
    test eax, 0xF
    jnz nao_div
    mov rax, 1
    jmp fim
nao_div:
    mov rax, 0
fim:
