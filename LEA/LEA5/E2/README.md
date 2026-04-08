
- Stack Pop

Sem utilizar as instruções de manipulão direta da pilha (PUSH e POP), faça o
seguinte:
- Retire o valor presente no topo da pilha, armazene-o no registrador rsi, e
  ajuste o registrador RSP para que a pilha aponte para o próximo valor da pilha.

Antes:                           Depois:
 +-------------------+
 |        A          | <- RSP
 +-------------------+            +-------------------+
 |        B          |            |        B          | <- RSP
 +-------------------+            +-------------------+
 |                   |            |                   |
 |                   |            |                   |
 |                   | <- RBP     |                   | <- RBP
 +-------------------+            +-------------------+


Valores inicializados:
    - (pilha) [0x7fffff1fffea] = 0x6dcb4918c52215d3      <- Topo da pilha
    - (pilha) [0x7fffff1ffff2] = 0xd6c4a3e6fe13d6e5      <- Próximo valor da pilha
    - rsi = 0xc77f9132f2d8d501