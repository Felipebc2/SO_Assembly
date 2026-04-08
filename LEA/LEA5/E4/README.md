
- Stack Swap

Sem utilizar as instruções de manipulão direta da pilha (PUSH e POP), faça o
seguinte:
- Troque os valores do topo da pilha, da seguinte forma:

Antes:                           Depois:
 +-------------------+            +-------------------+
 |        A          | <- RSP     |        B          | <- RSP
 +-------------------+            +-------------------+
 |        B          |            |        A          |
 +-------------------+            +-------------------+
 |                   |            |                   |
 |                   |            |                   |
 |                   | <- RBP     |                   | <- RBP
 +-------------------+            +-------------------+


Valores inicializados:
    - (pilha) [0x7fffff1fffea] = 0x493220eea05aa771      <- Topo da pilha
    - (pilha) [0x7fffff1ffff2] = 0xff7b260e6f6d446a