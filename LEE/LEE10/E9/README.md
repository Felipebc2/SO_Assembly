Execute o arquivo exercicio, dentro da pasta /desafio, e siga as instruções.

O programa solicita um payload que leia o conteúdo da memória no endereço
0x55445e7c4000 (onde está o conteúdo de /desafio/recompensa.txt).
Apenas as syscalls read e exit são permitidas (sem write).

A dica indica que ambas as syscalls são necessárias. A solução usa um
mecanismo de oracle: read recebe 1 byte de stdin com o índice desejado,
e exit retorna o byte correspondente do flag como código de saída.
O grader executa o payload repetidamente, enviando 0, 1, 2... e lendo
o exit code de cada execução para reconstruir o conteúdo completo.
