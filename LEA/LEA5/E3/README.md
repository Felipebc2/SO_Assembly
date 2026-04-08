
- Stack Push

Sem utilizar as instruções de manipulão direta da pilha (PUSH e POP), faça o
seguinte:
- Insira o valor presente no registrador r15 no topo da pilha, e ajuste o
  registrador RSP para que a pilha aponte para o topo da pilha.

Antes:                           Depois:
                                  +-------------------+
                                  |        B          | <- RSP
 +-------------------+            +-------------------+
 |        A          | <- RSP     |        A          |
 +-------------------+            +-------------------+
 |                   |            |                   |
 |                   |            |                   |
 |                   | <- RBP     |                   | <- RBP
 +-------------------+            +-------------------+


Valores inicializados:
    - (pilha) [0x7fffff1fffea] = 0xdb3044fd5233f6f6      <- Topo da pilha
    - (pilha) [0x7fffff1ffff2] = 0xdd76ee7c8a3847ba      <- Próximo valor da pilha
    - r15 = 0x7242adf3aa1b9d62


Envie apenas o payload (código do segmento .text) em raw bytes: