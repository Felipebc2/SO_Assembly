# E1 - Escrita em Memória

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
    - [0x404692] = 0xCA
    - [0x404693] = 0xFE
    - [0x404694] = 0xC4
    - [0x404695] = 0xF3
    - [0x404696] = 0xC0
    - [0x404697] = 0xC4
    - [0x404698] = 0xC0
    - [0x404699] = 0x1A

Valores inicializados:
        - rdi = 0x404692
        - [0x404692] = 0xffffffffffffffff

Restrições:
    - Instruções permitidas: MOV, INC, DEC
    - Máximo de instruções permitidas: 2
