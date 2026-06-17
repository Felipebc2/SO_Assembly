# Resumo — Algoritmos de Substituição de Páginas

## Contexto geral
Quando ocorre um **page fault** e a memória está cheia, o SO precisa escolher uma página para remover e liberar espaço. Mesmo problema já visto em cache. Vários algoritmos foram propostos; o **Ótimo** serve de referência teórica para comparar os demais.

**Bits de controle (chave para vários algoritmos):**
- **R (Referenciada):** marcada a cada acesso; limpa periodicamente (a cada tick do relógio).
- **M (Modificada / dirty):** marcada na escrita; **nunca é limpa**, pois o SO precisa saber se a página deve ser regravada no disco.

---

## 1. Ótimo
- Remove a página que será referenciada **mais tarde no futuro** (menos chance de uso em breve).
- Cada página é marcada com o nº de instruções até a próxima referência.
- **Impossível na prática** (exige conhecer o futuro) → usado só para **simulação e comparação**.

## 2. NRU (Not Recently Used)
- Usa os bits **R** e **M** para classificar em 4 classes:

| Classe | R M | Significado |
|--------|-----|-------------|
| 0 | 00 | não referenciada, não modificada |
| 1 | 01 | não referenciada, modificada |
| 2 | 10 | referenciada, não modificada |
| 3 | 11 | referenciada, modificada |

- Remove uma página da **classe de menor número** (preferência: classe 0).
- Início: R e M = 0. R é limpo periodicamente; M não.

## 3. FIFO (First In First Out)
- Fila de páginas: início = mais antiga, final = mais nova.
- No page fault, remove a **do início** e insere a nova no final.
- **Simples, mas ineficiente** (pode descartar página muito usada) → pouco utilizado.

## 4. Segunda Chance
- = **FIFO + bit R**.
- Inspeciona o bit R da página mais antiga:
  - **R = 0** → velha e não usada → **substitui**.
  - **R = 1** → zera o R, move a página para o **final da fila** (atualiza tempo de carga, como se fosse recém-chegada) → continua a busca na próxima.

## 5. Relógio (Clock)
- **Melhoria do Segunda Chance** (mesma lógica, estrutura mais eficiente).
- Usa **lista circular** com um **ponteiro** apontando para a página mais antiga.
- Se **R = 0** → substitui. Se **R = 1** → zera R e avança o ponteiro.
- Vantagem: evita o custo de mover páginas na fila.

## 6. LRU (Least Recently Used)
- Remove a página **não usada há mais tempo** (princípio da localidade: o que foi muito usado recentemente tende a ser usado de novo).
- Custo alto: exige atualizar/reordenar a lista a cada acesso.
- **Implementação em hardware:** contador que avança a cada instrução.
- **Implementação em software (NFU — Not Frequently Used):** contadores por página iniciam em zero; a cada interrupção soma-se o bit R ao contador; no page fault remove a de **menor contador**.
  - **Problema do NFU:** "nunca esquece" — páginas muito usadas no início acumulam contador alto e podem nunca sair (não considera o tempo).

## 7. Working Set
- Conjunto de páginas que o processo **realmente usou nos últimos *t* segundos** de execução.
- Ideia: ter o working set em memória **antes** de o processo rodar.
- **Pré-paginação:** carregar essas páginas antes de retomar o processo (estima-se o nº de páginas pelo working set de quando foi interrompido).
- Usa o bit **R**.

## 8. WSClock
- = **Clock + Working Set**.
- **Muito utilizado** por unir simplicidade e boa performance.
- Lista circular de páginas com o **tempo do último acesso**; páginas carregadas entram na lista do working set.

---

## Comparação rápida (cola de revisão)

| Algoritmo | Base | Usa R | Usa M | Observação |
|-----------|------|:----:|:----:|------------|
| Ótimo | futuro | – | – | só teórico/comparação |
| NRU | classes R/M | ✓ | ✓ | 4 classes, escolhe menor |
| FIFO | fila | ✗ | ✗ | simples, ineficiente |
| Segunda Chance | FIFO + R | ✓ | ✗ | dá "2ª chance" se R=1 |
| Relógio | lista circular + R | ✓ | ✗ | versão eficiente do 2ª chance |
| LRU | tempo de uso | ✓ | ✗ | caro; NFU é a versão em software |
| Working Set | páginas dos últimos *t*s | ✓ | ✗ | pré-paginação |
| WSClock | Clock + WS | ✓ | ✗ | melhor custo-benefício, popular |

## Pontos que costumam cair em prova
- Diferença entre bit **R** (limpo periodicamente) e bit **M** (nunca limpo, indica gravar no disco).
- A tabela de **classes do NRU** (00/01/10/11).
- Por que FIFO é ruim e como **Segunda Chance** e **Relógio** o corrigem.
- A relação **Segunda Chance → Relógio** (mesma ideia, fila vs. lista circular).
- **NFU como aproximação em software do LRU** e seu defeito (não esquece o passado).
- O que é **working set** e **pré-paginação**.
- **WSClock = Clock + Working Set** e por que é o mais usado.
