# Guia rápido para a escrita e submissão de código assembly

## Escrita de código assembly

### Montar o código `.s` e gerar o arquivo objeto `.o`

```bash
as codigo.s -o codigo.o
```

### Ligar o arquivo objeto e gerar o executável

```bash
ld codigo.o -o programa
```

### Extrair a seção `.text` do executável

```bash
objcopy --dump-section .text=programa-intrucoes.bin programa
```

### Conferir os bytes gerados e extraídos

```bash
xxd programa-intrucoes.bin
```

ou

```bash
hd programa-intrucoes.bin
```

## Submissão das instruções para o desafio

### Submissão dos bytes do arquivo binário utilizando o comando `cat`

```bash
cat programa-intrucoes.bin | ./exercicio
```
