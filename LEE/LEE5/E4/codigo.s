.intel_syntax noprefix
.global _start

.section .text

_start:
    mov ecx, [rax+4]
    mov eax, [rax]
    cmp eax, ecx
    jge fim
    mov eax, ecx
fim:
