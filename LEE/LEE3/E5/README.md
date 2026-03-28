- Desafio com instruções de operações lógicas bit a bit.

As instruções lógicas são fundamentais em linguagens de baixo nível. Elas
permitem manipular diretamente os bits de um registrador, possibilitando
a implementação de expressões booleanas, máscaras e até expressões condicionais
sem a necessidade de desvios (branches).

Nesta atividade, utilizando apenas as instruções:

    - AND, OR, XOR

Você deverá implementar a seguinte lógica:

    if x for par:
        y = 0
    else:
        y = 1

onde:
    x = r13
    y = rax

Valores inicializados:
    -  r13:          0x3ffce27
    -  rax: 0xffffffffffffffff

Observação: serão executados múltiplos testes no código.
