# Descrição

Nesta atividade, você deverá escrever um código em assembly x86-64
que chame uma função cujo o valor do endereço encontra-se no
seguinte endereço: 0x4041b8
Este endereço é um ponteiro que aponta para a função que você deve chamar.
Já a função recebe três parâmetros:
 - Parametro 01: 484337
 - Parametro 02: H
 - Parametro 03: e
Caso os parâemtros estejam corretos, a função irá imprimir o conteúdo do
arquivo /desafio/recompensa.txt.


O endereço da função é fixo e não muda entre execuções. Além disso, seu código
será colocado na seguinte região de memória fixa: 0x424242000

---

## Resolução

Pela ABI x86-64, os três primeiros argumentos vão em `rdi`, `rsi`, `rdx`. Os caracteres `'H'` e `'e'` são passados pelo valor ASCII (0x48 e 0x65):

```asm
mov rdi, 484337
mov rsi, 0x48
mov rdx, 0x65
mov rax, 0x4041b8
mov rax, [rax]
call rax
```
