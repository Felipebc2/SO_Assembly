Execute o arquivo exercicio, dentro da pasta /desafio, e siga as instruções.

O programa solicita um payload em assembly x86-64 que abra o arquivo
/desafio/recompensa.txt, leia seu conteúdo e escreva na saída padrão.
Somente as syscalls open (openat), read e write são permitidas.
O payload não pode exceder 256 bytes e será executado na região de
memória fixa 0x424242000 (rwx).

Um filtro de bytes bloqueia as sequências 0f05 (syscall), 0f34 (sysenter)
e 80cd (int 0x80) no payload enviado. A solução usa self-modifying code:
escreve os bytes proibidos em tempo de execução antes de executar cada syscall.
