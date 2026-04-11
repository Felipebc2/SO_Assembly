# Intervalo

Dado o valor contido no registrador r10, o código deverá verificar se este
encontra-se estritamente entre os valores dos registradores r14 e r11.

       r14                 r10                           r11
        [-------------------------------------------------]

A verificação deverá retornar 1, se a verificação for verdadeira, e 0 caso
contrário. A resposta deverá ser inserida no registrador RAX.

Valores inicializados:
    -  r10:         0x13fc2cf0
    -  r14:         0x15d162a9
    -  r11:          0xe4fcccf
    -  rax: 0xffffffffffffffff

Observação: serão executados múltiplos testes no código.
