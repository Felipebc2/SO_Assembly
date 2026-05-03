# Descrição

Em cenários mais realistas, alguns binários do sistema
possuem o bit SUID ativado e o usuário comum apenas o utiliza,
ao invés de gerar uma cópia.

Nesta atividade, um binário do sistema irá receber o bit SUID
para o usuário idp e você deverá utilizá-lo para recuperar
a sua recompensa, que é a resposta para a ativdade.

Neste exercício, o binário modificado é: `/bin/chown`

Observação: lembre-se de entender o que o binário faz, para
utilizá-lo corretamente.

---

## Resolução

O `chown` altera o dono de um arquivo. Com SUID do `idp`, é possível transferir a propriedade da recompensa para o usuário atual e então lê-la normalmente.

```bash
chown $(whoami) /desafio/recompensa.txt && cat /desafio/recompensa.txt
```
