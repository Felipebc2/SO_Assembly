# 📝 Simulado B — Sistemas Operacionais

> Estrutura: **4 discursivas + 5 objetivas + 4 práticas (cálculo)**.
> Questões novas (tópicos iguais aos da prova). Faça sem consultar.
> Gabarito em `simulado-B-gabarito.md` (não abra antes de terminar!).

---

## Parte I — Discursivas

**D1.** O que é um **page fault**? Descreva o que o SO faz quando ele ocorre.
Diferencie **soft miss** de **hard miss**.

**D2.** Explique a diferença entre **fragmentação interna** e **fragmentação
externa**, e diga qual tipo de partição (fixa ou variável) causa cada uma.

**D3.** Explique como funciona a **TLB** e por que ela **acelera** a tradução de
endereços (cite o problema dos "2 acessos à memória").

**D4.** Diferencie as **três formas de E/S** (programada, por interrupções e
DMA) quanto ao **uso da CPU** e à **espera ocupada (polling)**.

---

## Parte II — Objetivas (marque só a letra)

**O1.** Sobre algoritmos de substituição de páginas:
- a) FIFO sempre remove a página menos usada recentemente.
- b) O algoritmo Ótimo é usado na prática por ser o mais eficiente.
- c) O algoritmo do Relógio é uma implementação eficiente do Segunda Chance.
- d) O LRU não considera o histórico de uso das páginas.

**O2.** Sobre memória virtual:
- a) Página e frame têm sempre tamanhos diferentes.
- b) A segmentação divide a memória em blocos de tamanho fixo.
- c) A paginação divide a memória em blocos de tamanho fixo.
- d) O frame é uma unidade do armazenamento secundário (disco).

**O3.** Sobre sistemas de arquivos / journaling:
- a) As propriedades ACID incluem Atomicidade e Durabilidade.
- b) O journaling elimina completamente a sobrecarga de escrita.
- c) O modo "full data" jornaliza apenas os metadados.
- d) O ext4 não utiliza journaling.

**O4.** Sobre gerência de memória livre:
- a) O mapa de bits torna rápido achar k unidades livres consecutivas.
- b) Na lista encadeada, os nós são mantidos ordenados.
- c) Memória liberada com `free()` volta imediatamente ao SO.
- d) Partições fixas otimizam o uso da memória.

**O5.** Sobre tabela de páginas:
- a) A tabela de páginas é compartilhada por todos os processos.
- b) Em 64 bits, uma tabela de páginas única é perfeitamente viável.
- c) A paginação hierárquica cria todas as tabelas de nível inferior no início.
- d) A tabela de páginas invertida tem uma entrada por frame físico.

---

## Parte III — Práticas / Cálculo

**P1. (Bits e blocos)** Memória principal de **1 GB**, endereçada por palavra de
**1 byte**.
- (a) Quantos **bits** para representar um endereço?
- (b) Com unidade de alocação de **8 KB**, quantos **blocos** existem?

**P2. (Tradução virtual → físico)** Página/frame de **4 KB**. Tabela:

| Página | Frame |
|--------|-------|
| 0 | 2 |
| 1 | X |
| 2 | 6 |
| 3 | X |
| 4 | 1 |
| 5 | 3 |

- (a) VA **18000** → físico?
- (b) VA **5000** → físico?

**P3. (First / Best / Worst Fit)** Buracos livres (KB), nesta ordem:
`[14, 6, 22, 9, 30, 5]`. Chega uma solicitação de **8 KB**. Como fica a lista
para:
- (a) First Fit
- (b) Best Fit
- (c) Worst Fit

**P4. (Aging / Envelhecimento)** Contadores de **4 bits**:

| Página | Contador | R |
|--------|----------|---|
| P0 | 0101 | 0 |
| P1 | 1100 | 1 |
| P2 | 0011 | 0 |
| P3 | 1001 | 1 |

Após **1 tick** (shift à direita + R no bit mais significativo + zera R):
- (a) Novo contador de cada página?
- (b) Qual a página **candidata à substituição**?
