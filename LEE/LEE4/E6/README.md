# E6 - Como as Operações da Pilha Funcionam

Ao executar a instrução push, o valor do registrador RSP é decrementado em 8
bytes e o valor do registrador apontado na instrução é armazenado na pilha.
De uma maneira similar, o funcionamento dessa instrução pode ser visto
da seguinte maneira:

    PUSH REG        <==>        SUB RSP, 8
                                MOV [RSP], REG

De maneira análoga, a instrução pop funciona da seguinte maneira:

    POP REG         <==>        MOV REG, [RSP]
                                ADD RSP, 8

Sem utilizar as instruções push e pop, é possível realizar operações de
manipulação da pilha utilizando instruções de movimentação de dados e
aritméticas. Assim, o objetivo desta atividade é executar o seguinte:

Sem utilizar as instruções:
    - PUSH e POP

Execute o seguinte:
- Calcule a média aritmética dos cinco qwords (inteiros com sinal) armazenados
  no topo da pilha, desconsiderando sua parte fracionária (somente parte inteira)
- Remova todos esses cinco valores da pilha
- Armazene o resultado da média no topo da pilha

Valores inicializados:
     - (stack) [0x7fffff1fffd8]: 0x339412602624   <- topo (RSP)
     - (stack) [0x7fffff1fffe0]: 0x3a6391da9d6
     - (stack) [0x7fffff1fffe8]: 0x4bc47e436671
     - (stack) [0x7fffff1ffff0]: 0x416f8e6b824e
     - (stack) [0x7fffff1ffff8]: 0x7716a440f510
