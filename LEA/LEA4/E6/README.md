- Escrita em Memória

Um detalhe importante de armazenamento é que os bytes são armazenados em ordem
revertida na memória. Por exemplo:
[0x444440] = 0x00000000abcdeeff

É armazenado byte por byte nos seguintes endereços:
[0x444440] = 0xff
[0x444441] = 0xee
[0x444442] = 0xcd
[0x444443] = 0xab
[0x444444] = 0x00
[0x444445] = 0x00
[0x444446] = 0x00
[0x444447] = 0x00

A essa organização revertida, onde cada palavra é armazenada em ordem
revertida, chamamos de little-endian.

Nesta atividade, você deverá alterar o conteúdo dos endereços de memória abaixo
para os seguintes valores:
    - [0x40430e] = 0xCA
    - [0x40430f] = 0xFE
    - [0x404310] = 0xC4
    - [0x404311] = 0xF3
    - [0x404312] = 0xC0
    - [0x404313] = 0xC4
    - [0x404314] = 0xC0
    - [0x404315] = 0x1A

Valores inicializados:
        - rsi = 0x40430e
        - [0x40430e] = 0xffffffffffffffff

Restrições:
    - Instruções permitidas: MOV, INC, DEC