- Operadores Lógicos

Em x86, é possível realizar muitas operações lógicas bit a bit em registradores.

Utilizando como exemplo registradores de 8 bits, veja o seguinte:

 rax = 10101010
 rbx = 00110011

O operador AND entre os registradores é feito da seguinte forma:

    and rax, rbx

cujo o resultado é:

    rax = 00100010

Segue uma tabela com as operações lógicas disponíveis:

              AND          OR           XOR
           A | B | X    A | B | X    A | B | X
          ---+---+---  ---+---+---  ---+---+---
           0 | 0 | 0    0 | 0 | 0    0 | 0 | 0
           0 | 1 | 0    0 | 1 | 1    0 | 1 | 1
           1 | 0 | 0    1 | 0 | 1    1 | 0 | 1
           1 | 1 | 1    1 | 1 | 1    1 | 1 | 0

Nesta atividade, você deverá realizar a operação lógica AND entre os registradores
r9 e r11 e armazenar o resultado em rax.

Para esta atividade, as seguintes instruções NÃO estão disponíveis:

    - MOV, XCHG

Valores inicializados:
    -   r9: 0x6df491d61f60c5ae
    -  r11: 0x70616fa8f56a5eba

Obs: Lembre-se de não modificar os valores originais dos registradores citados.