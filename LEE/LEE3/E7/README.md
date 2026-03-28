- Desafio com instruções de operações lógicas bit a bit.

Utilizando apenas as instruções:

    - AND, OR, XOR

Implemente a seguinte lógica:

    if (x, y, w) possui exatamente um valor impar
        z = 1
    else:
        z = 0

onde:
    x = rcx
    y = r10
    w = r12
    z = rax

Valores inicializados:
    -  rcx:          0x23e66f2
    -  r10:         0x33c7de5d
    -  r12:         0x2975aa0d
    -  rax: 0xffffffffffffffff

Restrições:
    - Somente as instruções AND, OR e XOR são permitidas.
    - Seu código deve ter no máximo 25 instruções.

Observação: serão executados múltiplos testes no código.
