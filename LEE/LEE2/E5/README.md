- Operações aritiméticas

Existem diversas instruções com o propósito de realizar operações aritinméticas
em registradores. Abaixo seguem alguns exemplos simples:

    add r█x, r⬤x        <==>        r█x = r█x + r⬤x
    sub r█x, r⬤x        <==>        r█x = r█x - r⬤x
    mul r⬤x             <==>        rdxrax = rax * r⬤x

No caso específico da instrução 'mul', o resultado da operação é armazenado
em dois registradores, rdx e rax. O registrador rdx armazena os bits mais
significativos do resultado e o registrador rax armazena os bits menos
significativos, que acontece em operações cujo o resultado é maior que o
tamanho de um registrador.

Nesta tarefa, você deverá escrever um programa para realizar a subtração de dois
números inteiros. O primeiro número está no registrador rbx e o segundo
número está no registrador r12. O resultado da subtração deverá ser armazenado
no registrador r14. E os registradores rbx e r12 deverão manter seus valores
iniciais.

Valores inicializados:
    -  rbx:       3070802352
    -  r12:  255734872754556

Envie apenas o payload (código do segmento .text) em raw bytes:
