.intel_syntax noprefix
.global _start

.section .text

_start:
    sub rsp, 8

    xor edi, edi
    mov rsi, rsp
    mov edx, 1
    xor eax, eax
    syscall

    movzx ecx, byte ptr [rsp]
    mov rax, 0x55445e7c4000
    movzx edi, byte ptr [rax + rcx]

    mov eax, 60
    syscall
