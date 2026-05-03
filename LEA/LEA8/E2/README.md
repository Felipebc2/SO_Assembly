# Descrição

Em cenários mais realistas, alguns binários do sistema
possuem o bit SUID ativado e o usuário comum apenas o utiliza,
ao invés de gerar uma cópia.

Nesta atividade, um binário do sistema irá receber o bit SUID
para o usuário idp e você deverá utilizá-lo para recuperar
a sua recompensa, que é a resposta para a ativdade.

Neste exercício, o binário modificado é: `/bin/sed`

Observação: lembre-se de entender o que o binário faz, para
utilizá-lo corretamente.

---

## Resolução

O `sed` com script vazio imprime o arquivo sem modificações, funcionando como `cat`, mas com os privilégios do SUID.

```bash
sed '' /desafio/recompensa.txt
```
