- Leitura de Bytes

A movimentação de conteúdo (leitura e escrita) entre memória e cpu possui um
custo muito alto para a performance de programas. Por isso, deve-se evitar ao
máximo utilizar essas movimentações.

Limitado as seguintes quantidades de instruções:
    - MOV: máximo de 1 instrução

Execute o seguinte:
- Leia um byte que encontra-se no endereço 0x404000 para o registrador r15
- Leia um byte que encontra-se no endereço 0x404001 para o registrador rbp
- Leia um byte que encontra-se no endereço 0x404002 para o registrador r12
- Leia um byte que encontra-se no endereço 0x404003 para o registrador rdx

Valores inicializados:
        - ( 8 bytes) [0x404000] = 0x5308376cfba91d4d
        - ( 1 byte ) [0x404000] = 0x4d
        - ( 1 byte ) [0x404001] = 0x1d
        - ( 1 byte ) [0x404002] = 0xa9
        - ( 1 byte ) [0x404003] = 0xfb
       -                   rax = 0xd525dea7325c26ae
       -                   rbx = 0x2b1bd2497135bbc3
       -                   rcx = 0xfe9a0174685cf0f0
       -                   rdx = 0xffffffffffffffff
       -                   rsi = 0x97bb8f20d878d6bf
       -                   rdi = 0x5d6d72ddeb61b60b
       -                   rbp = 0xffffffffffffffff
       -                   rsp = 0x9c69ddcd99abba9f
       -                    r8 = 0x5d0c27222e3f213d
       -                    r9 = 0xdb575b0a5708a012
       -                   r10 = 0x2656f8ea8edc694a
       -                   r11 = 0xf2a2444ba3efa6bb
       -                   r12 = 0xffffffffffffffff
       -                   r13 = 0x8921e54bf328e4d5
       -                   r14 = 0x67ea4d8481028b69
       -                   r15 = 0xffffffffffffffff