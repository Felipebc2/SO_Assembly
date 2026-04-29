# Descrição

 - Ler Arquivo -

Nesta atividade, você deverá escrever um código em assembly x86-64
que abra o arquivo, leia seu conteúdo e escreva na saída padrão.
O arquivo a ser lido é /desafio/recompensa.txt.
Você pode ler o conteúdo para qualquer área de memória com permissões
de leitura e escrita (sem variáveis globais explícitas dessa vez).
Por último, você poderá utilizar somente as seguintes syscalls:
 - open (openat)
 - read
 - write
Para esta atividade, o seu payload não poderá exceder 256 bytes.

---

## Resolução

```asm
lea rdi, [rip + path]
xor esi, esi
mov eax, 2
syscall

mov edi, eax
sub rsp, 100
mov rsi, rsp
mov edx, 100
xor eax, eax
syscall

mov edx, eax
mov eax, 1
mov edi, 1
mov rsi, rsp
syscall

path:
    .asciz "/desafio/recompensa.txt"
```

1. `open(path, O_RDONLY)` — abre o arquivo; `rax` recebe o fd
2. `read(fd, rsp, 100)` — lê até 100 bytes para a pilha; `rax` recebe bytes lidos
3. `write(1, rsp, bytes_lidos)` — escreve exatamente o que foi lido no stdout

O path é embutido no payload logo após o código e referenciado via RIP-relativo. O buffer é alocado na pilha com `sub rsp, 100`. Total: ~75 bytes.
