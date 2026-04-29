# Descrição

 - Chamanda de Funções da libc (sistema operacional) -

Nesta atividade, você deverá escrever um código em assembly x86-64
que chame a função printf para imprimir a recompensa
desta atividade, que encontra-se separada em 3 partes:

 - 0x4040c0
 - 0x405400
 - 0x408b40

Já o endereço da função printf encontra-se em:

 - [0x40bcd8]: 0x7aa80342e100

Para utilizar a função printf, você deverá colocar no
registrador RDI o endereço da string de formatação da saída.
Para isso, você poderá escrever essa string ao final do seu payload
e referenciar seu posicionamento utilizando endereçamento relativo
em relação ao contador de programa (RIP).

A partir disso, cada um dos endereços de formação deverão ser
colocados, em ordem, nos registrador RSI, RDX e RCX, respectivamente.
Obs: Lembre-se que para chamar funções, a pilha deve estar alinhada.

O seu payload será colocado na seguinte região de memória fixa:

 - 0x424242000

---

## Resolução

```asm
and rsp, -16
lea rdi, [rip + fmt]
mov rsi, 0x4040c0
mov rdx, 0x405400
mov rcx, 0x408b40
xor eax, eax
call [0x40bcd8]

fmt:
    .asciz "%s%s%s"
```

- `and rsp, -16` — alinha a pilha em 16 bytes antes do call (requisito da ABI)
- `lea rdi, [rip + fmt]` — carrega o endereço da format string via RIP-relativo
- `rsi`, `rdx`, `rcx` — as 3 partes da recompensa (strings)
- `xor eax, eax` — zera `al` para indicar que não há argumentos em registradores `xmm` (obrigatório em chamadas variádicas como printf)
- `call [0x40bcd8]` — chama a função cujo endereço está armazenado em `[0x40bcd8]`
