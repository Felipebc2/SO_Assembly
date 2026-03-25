- Resto da Divisão

A operação de divisão em x86-64 também pode ser utilizada para calcular o resto
da divisão. Exemplo:

10 / 3 = 3, resto 1

ou, se o interesse for apenas no resto, a operação pode ser escrita da seguinte
forma:

10 % 3 = 1

onde esse operador é chamado de módulo, que retorna o resto da divisão. Neste
exercício, sua tarefa é calcular o seguinte:

    rbx % rdx

E o resultado deverá ser armazenado no registrador rax.
    
Valores inicializados:
    -  rbx: 0xb629f5f7a5f216
    -  rdx:           0x1fff

Obs: Lembre-se de não modificar os valores originais dos registradores citados.

Envie apenas o payload (código do segmento .text) em raw bytes: