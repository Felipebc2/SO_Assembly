# Descrição

Nesta atividade, você deverá escrever um código em assembly x86-64
que chame uma função cujo o valor do endereço encontra-se no
seguinte endereço: 0x404158
Este endereço é um ponteiro que aponta para a função que você deve chamar.
Ou seja, você precisa desreferenciar esse ponteiro para obter o endereço
da função e então chamá-la.
O seu código será colocado na seguinte região de memória fixa: 0x424242000

---

## Resolução

Carregar o endereço do ponteiro em `rax`, desreferenciar para obter o endereço da função e chamá-la:

```asm
mov rax, 0x404158
mov rax, [rax]
call rax
```

Como o código fica em `0x424242000` (longe do alvo), não é possível usar `call` com offset relativo. Usar `call rax` resolve isso — carregamos o endereço absoluto da função no registrador e chamamos indiretamente.
