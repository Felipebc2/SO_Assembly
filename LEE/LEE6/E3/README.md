# Descrição

Em cenários mais realistas, alguns binários do sistema
possuem o bit SUID ativado e o usuário comum apenas o utiliza,
ao invés de gerar uma cópia.

Nesta atividade, um binário do sistema irá receber o bit SUID
para o usuário idp e você deverá utilizá-lo para recuperar
a sua recompensa, que é a resposta para a ativdade.

Neste exercício, o binário modificado é: `/bin/wget`

Observação: lembre-se de entender o que o binário faz, para
utilizá-lo corretamente.

---

## Resolução

O flag `-i` do wget lê um arquivo como lista de URLs e tenta buscar cada linha. Como wget é um binário compilado com SUID, ele executa como `idp` e consegue abrir `/desafio/recompensa.txt`. O conteúdo do arquivo aparece nas mensagens de saída ao tentar resolver cada linha como URL:

```bash
/bin/wget -i /desafio/recompensa.txt
```
