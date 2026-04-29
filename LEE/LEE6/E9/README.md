# Descrição

 - Chamanda da Syscall Write -

Nesta atividade, você deverá escrever um código em assembly x86-64
que chame a syscall write para imprimir o conteúdo
que foi lido do arquivo /desafio/recompensa.txt. Esse conteúdo
encontra-se no seguinte endereço:

 - 0x404358

Para utilizar a syscall write, lembre-se de colocar no
registrador RDI o descritor da saída que pretente utilizar,
no registrador RSI o endereço do buffer de escrita e no registrador
RDX o tamanho do buffer. Para esta atividade, o seu payload não
poderá exceder 40 bytes.

---

## Resolução

```asm
mov eax, 1
mov edi, 1
mov esi, 0x404358
mov edx, 100
syscall
```

- `eax = 1` — número da syscall `write`
- `edi = 1` — file descriptor `stdout`
- `esi = 0x404358` — endereço do buffer com o conteúdo lido
- `edx = 100` — tamanho máximo a imprimir (suficiente para a recompensa)

Usando registradores de 32 bits (`eax`, `edi`, `esi`, `edx`) em vez de 64 bits gera encodings menores (sem prefixo REX), mantendo o payload em 22 bytes — bem abaixo do limite de 40.
