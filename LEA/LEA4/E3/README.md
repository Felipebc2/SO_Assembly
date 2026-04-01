- Leitura de Byte e Palavra

Utilizando apenas as instruções:
    - MOV e XOR

sendo permitido o uso de variantes dessas instruções, como por exemplo: movb,
xorb, etc..

Limitado as seguintes quantidade de instruções:
    - Total: máximo de 5 instruções

Execute o seguinte:
- Leia um byte que encontra-se no endereço 0x404000 para o registrador
  rdi.
- Leia uma palavra (WORD) que encontra-se no endereço 0x404004 para o
  registrador r8.

Atenção para não modificar o conteúdo da memória ou dos registradores, exceto
para os registradores rdi e r8.

Valores inicializados:
        - ( 8 bytes) [0x404000] = 0x36778efd13b86f1e
        - ( 1 byte ) [0x404000] = 0x1e
        - ( 1 byte ) [0x404001] = 0x6f
        - ( 1 byte ) [0x404002] = 0xb8
        - ( 1 byte ) [0x404003] = 0x13
        - ( 1 byte ) [0x404004] = 0xfd
        - ( 1 byte ) [0x404005] = 0x8e
        - ( 1 byte ) [0x404006] = 0x77
        - ( 1 byte ) [0x404007] = 0x36
        -                   rax = 0x24a954b7c0c3bae9
        -                   rbx = 0x2419dd78c9650631
        -                   rcx = 0xa9cfa81d96b9954f
        -                   rdx = 0x466c49f4d6303eb0
        -                   rsi = 0x60c083f75853fea2
        -                   rdi = 0xffffffffffffffff
        -                   rbp = 0x95e6437a3bd64da6
        -                   rsp = 0x3dd9953fe8708e49
        -                    r8 = 0xffffffffffffffff
        -                    r9 = 0x9176406c4a699fd9
        -                   r10 = 0x62c8dabbf83e1f59
        -                   r11 = 0xa539900c668fcace
        -                   r12 = 0x64b2478fc3f141f2
        -                   r13 = 0xbd494b59f040c2b1
        -                   r14 = 0x47019db610923fba
        -                   r15 = 0x8ba7aa724bb2bcc9