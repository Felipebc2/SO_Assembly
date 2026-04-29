# Descrição

Nesta atividade, você deverá escrever um código em assembly x86-64
que chame uma função cujo o valor do endereço encontra-se no
seguinte endereço: 0x4047c0
Este endereço é um ponteiro que aponta para a função que você deve chamar.
Já a função recebe três parâmetros:
 - Parametro 01: 9248619
 - Parametro 02: V
 - Parametro 03: 362.428
Repare que o terceiro parâmetro é um número de ponto flutuante com precisão dupla.
Nesse caso, o registrador o qual deverá receber esse parâmetro é o xmm0
(seja bem-vindo novo registrador).
Pesquise sobre ele e como ele é utilizado. Se precisar de uma região de memória
Lembre-se que após a sua chamada de função, nada mais é executado.
Caso os parâmetros estejam corretos, a função irá imprimir o conteúdo do
arquivo /desafio/recompensa.txt.

---

## Resolução

Pela ABI x86-64, argumentos inteiros vão em `rdi`, `rsi`, `rdx`... e argumentos de ponto flutuante vão em `xmm0`, `xmm1`, `xmm2`... independentemente da posição dos inteiros.

O double `362.428` não pode ser carregado como imediato — precisa vir da memória. A solução é embuti-lo no próprio segmento `.text` com `.double` e carregá-lo via endereçamento RIP-relativo:

```asm
mov rdi, 9248619
mov rsi, 0x56
movsd xmm0, [rip + float_val]
mov rax, 0x4047c0
mov rax, [rax]
call rax

float_val:
    .double 362.428
```

`movsd` (move scalar double) carrega 64 bits de memória para `xmm0`. O endereçamento `[rip + float_val]` é PC-relativo — o assembler calcula o offset automaticamente.
