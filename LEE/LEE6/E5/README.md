# Descrição

Nesta atividade, você deverá escrever um código em assembly x86-64
que chame uma função cujo o valor do endereço encontra-se no
seguinte endereço: 0x404388
Este endereço é um ponteiro que aponta para a função que você deve chamar.
Já a função recebe um inteiro como parâmetro e se esse valor for igual a 1838
ela irá imprimir o conteúdo do arquivo /desafio/recompensa.txt.

O endereço da função é fixo e não muda entre execuções. Além disso, seu código
será colocado na seguinte região de memória fixa: 0x424242000

---

## Resolução

Pela convenção de chamada x86-64 (System V AMD64 ABI), o primeiro argumento inteiro vai em `rdi`. Carregamos `1838` em `rdi`, desreferenciamos o ponteiro para obter o endereço da função e chamamos via registrador:

```asm
mov rdi, 1838
mov rax, 0x404388
mov rax, [rax]
call rax
```
