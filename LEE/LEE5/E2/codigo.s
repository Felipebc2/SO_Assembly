.intel_syntax noprefix
.global _start

.section .text

_start:
    mov eax, [r13]
    cmp eax, 0x7f45cafe
    je soma
    cmp eax, 0x00005AAD
    je subtracao

    mov eax, [r13+4]
    mov ecx, [r13+8]
    mov edx, [r13+12]
    imul eax, ecx
    imul eax, edx
    jmp fim

soma:
    mov eax, [r13+4]
    mov ecx, [r13+8]
    mov edx, [r13+12]
    add eax, ecx
    add eax, edx
    jmp fim

subtracao:
    mov eax, [r13+4]
    mov ecx, [r13+8]
    mov edx, [r13+12]
    sub eax, ecx
    sub eax, edx

fim:
