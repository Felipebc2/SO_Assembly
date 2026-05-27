# E4 — Tamanho Real de Alocação no Heap (malloc_usable_size)

O gerenciador de memória da libc é responsável por fornecer funções para
alocação e liberação dinâmica de memória em programas C. Ele gerencia um heap
privado do processo, atendendo solicitações de memória de diferentes tamanhos e
reutilizando blocos liberados para otimizar o uso do espaço.

Nos códigos em C, ao utilizar alocação dinâmica, nem sempre o tamanho informado
pelo usuário é o mesmo que o tamanho alocado. Isso ocorre porque o gerenciador
de memória precisa, além do espaço solicitado, armazenar informações adicionais
sobre o bloco alocado, além de manter um alinhamento adequado para garantir
acesso eficiente à memória.

Nesta atividade, estamos interessados especificamente no tamanho real disponível
para uso após a alocação de memória. Na pasta `/desafio`, há um arquivo chamado
`codigo.c` que realiza uma alocação de memória, o qual você deverá investigar e
responder ao validador o tamanho real alocado em bytes.
