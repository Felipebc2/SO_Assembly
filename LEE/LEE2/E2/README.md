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

Nesta tarefa, você deverá escrever um programa para realizar a soma de dois
números inteiros. O primeiro número está no registrador r11 e o segundo
número está no registrador r9. O resultado da soma deverá ser armazenado
no registrador r13. E os registradores r11 e r9 deverão manter seus valores
iniciais.

Valores inicializados:
    -  r11:   0xf09c0230
    -   r9:   0xb893a68e
