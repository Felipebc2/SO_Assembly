# E7 - Determinante

Nesta atividade, você deverá calcular o determinante da seguinte matriz 3x3:

        | a b c |
    D = | d e f |
        | g h i |

    a = r13
    b = rdi
    c = rcx
    d = r8
    e = r14
    f = rsi
    g = rdx
    h = r15
    i = r9

E o resultado deverá ser armazenado no registrador rax.

    D = a(ei - fh) - b(di - fg) + c(dh - eg)

Valores inicializados:
    -  r13:         0x2f
    -  rdi:         0x8a
    -  rcx:         0x43
    -   r8:          0xe
    -  r14:         0x5f
    -  rsi:         0xd8
    -  rdx:         0x81
    -  r15:         0x51
    -   r9:         0xfb

Restrições (ou recomendações):
    - Você não pode usar os registradores: rbx, r10, r11, r12
    - A pilha está disponível para uso
