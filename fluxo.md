```bash
as codigo.s -o codigo.o
ld codigo.o -o programa
objcopy --dump-section .text=programa-intrucoes.bin programa
xxd programa-intrucoes.bin
cat programa-intrucoes.bin | ./exercicio
```