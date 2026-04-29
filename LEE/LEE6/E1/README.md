# Descrição

Em cenários mais realistas, alguns binários do sistema
possuem o bit SUID ativado e o usuário comum apenas o utiliza,
ao invés de gerar uma cópia.

Nesta atividade, um binário do sistema irá receber o bit SUID
para o usuário idp e você deverá utilizá-lo para recuperar
a sua recompensa, que é a resposta para a ativdade.

Neste exercício, o binário modificado é: `/bin/grep`

Observação: lembre-se de entender o que o binário faz, para
utilizá-lo corretamente.

---

## Resolução

O bit SUID no `/bin/grep` faz com que ele execute com os privilégios do usuário `idp`, independente de quem o invoca. Isso permite ler arquivos que normalmente só o `idp` conseguiria acessar.

O arquivo de recompensa fica em `/desafio/recompensa.txt`, protegido para leitura apenas pelo `idp`. Para exibir o conteúdo:

```bash
/bin/grep '' /desafio/recompensa.txt
```

Como o processo roda com EUID do `idp` (por causa do SUID), o grep consegue abrir e imprimir o conteúdo de arquivos que pertencem a esse usuário — e assim recuperar a recompensa.
