# E3 — Heap Inspection via GDB

Nesta atividade, há um binário chamado `exercicio` na pasta `/desafio`. Esse
programa, quando em execução, possui área alocada para a heap. Nessa região de
memória, há um conteúdo que é uma sequência de caracteres que formam uma
mensagem. Essa mensagem é o objetivo do exercício.

Para saber que você está acessando o conteúdo correto, a mensagem possui o
prefixo "IDP-". Ao consultar o local correto, o conteúdo deverá aparecer como
"IDP-<MENSAGEM>", onde apenas MENSAGEM é o que deve ser informado como solução.
