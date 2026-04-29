# Descrição

 - Chamanda de Múltiplas Syscalls -

Nesta atividade, você deverá escrever um código em assembly x86-64
que chame a syscall read, a partir de um file descriptor
previamente aberto, para ler o conteúdo do arquivo
/desafio/recompensa.txt. O valor do fd é:

 - 133

Você pode ler o conteúdo para qualquer área de memória com permissões
de leitura e escrita, como por exemplo a própria área de memória do
seu payload, alguma variável global ou até mesmo a pilha.
Esses são os endereços de memória que você pode utilizar para armazenar:

 - PAYLOAD: 0x424242000  (qualquer offset em até 0x1000 bytes)
 -  BUFFER:    0x404100  (variável global)

Lembre-se que a quantidade de bytes lidos com read são salvas no
registrador RAX (retorno da chamada). A partir do conteúdo lido,
você deverá imprimir o conteúdo utilizando utilizando a syscall
write, de maneira similar ao desafio anterior.
Para esta atividade, o seu payload não poderá exceder 100 bytes.

---

## Resolução

```asm
xor eax, eax
mov edi, 133
mov esi, 0x404100
mov edx, 100
syscall
mov edx, eax
mov eax, 1
mov edi, 1
syscall
```

1. `read(133, 0x404100, 100)` — lê até 100 bytes do fd 133 para o buffer global
2. O retorno da syscall (`rax`) contém o número de bytes lidos
3. `mov edx, eax` — passa esse valor como tamanho para o `write`
4. `write(1, 0x404100, bytes_lidos)` — imprime exatamente o que foi lido no stdout

`rsi` não precisa ser recarregado entre as duas syscalls pois o endereço do buffer é o mesmo. Total: 33 bytes.
