# Gerenciamento de Memória — Resumo para Prova

## 1. Introdução e o problema da memória

No "mundo ideal" o programador teria memória **grande, rápida, não volátil e barata** — impossível com a tecnologia atual. A solução é a **hierarquia de memória**, gerenciada pelo **Gerenciador de Memória** (parte do SO que abstrai o uso para o usuário).

**Funções do Gerenciador de Memória:**
- Controlar quais partes estão em uso (livres x ocupadas)
- Alocar memória aos processos por demanda
- Liberar memória quando o processo termina
- Tratar o **swapping** (chaveamento entre memória principal ↔ disco e memória ↔ cache)

---

## 2. Monoprogramação

- Inicialmente **não existia abstração de memória**: cada programa acessava diretamente a **memória física** (ex.: `mov [0x1337], rax`, onde `0x1337` é endereço físico).
- **Apenas um processo por vez**; o novo programa sobrescreve o anterior.
- Três organizações de posicionamento do SO:
  - **(a)** SO em RAM embaixo + programa em cima → computadores de grande porte
  - **(b)** SO em ROM em cima + programa embaixo → sistemas embarcados
  - **(c)** Drivers em ROM + programa + SO em RAM → primeiros PCs
- A ROM era a **BIOS** (Basic Input Output System), hoje substituída pela **UEFI** (Unified Extensible Firmware Interface).

---

## 3. Multiprogramação

**Como armazenar N processos?** Ideias iniciais (hoje **obsoletas**):
1. **Partições fixas** com uma fila de execução por partição.
2. Registradores **base** e **limite**: a cada acesso soma-se o base e verifica-se o limite.

**Problema central:** programas com endereços absolutos (ex.: `JMP 28`) saltam para regiões que não são deles quando carregados em endereços deslocados.

**Primeira solução (IBM 360): Realocação Estática** — ao carregar, um **offset** era somado a cada endereço. Precisava de informação adicional sobre quais campos eram endereços.

---

## 4. Espaços de Endereçamento

Referenciar endereços físicos diretamente é perigoso (pode derrubar o SO). Dois problemas a resolver:
1. **Proteção** — impedir acesso indevido (a memória de outro processo / SO)
2. **Realocação** — posicionar programas em regiões deslocadas

**Solução:** abstração do **Espaço de Endereçamento** = conjunto de endereços que um processo pode usar. Cada processo tem o seu, independente dos outros (salvo compartilhamento explícito), análogo à CPU virtual.

> A solução com base+limite resolve isso, mas é **obsoleta** pelo custo de somas e checagens a cada instrução.

---

## 5. MMU (Memory Management Unit)

- Hoje os endereços usados pelo programa são **endereços virtuais**, formando o **Espaço de Endereçamento Virtual**.
- A CPU envia o endereço virtual à **MMU**, que **traduz/mapeia** para o **endereço físico** antes de ir ao barramento de memória.
- O programa **nunca** acessa o endereço físico real diretamente — há sempre um passo de tradução em hardware.
- A MMU hoje costuma estar **junto ao processador** (já foi módulo separado).

---

## 6. Swapping vs. Memória Virtual

Na prática, a memória exigida pelos processos é maior que a disponível. Duas abordagens:

**Swapping** (estratégia mais simples):
- Traz o processo **inteiro** para a memória, executa durante sua fatia de tempo, e depois o devolve ao disco.
- **Swap-out:** memória → disco (área de swap). **Swap-in:** disco → memória.
- Processos ociosos não ocupam memória.

**Memória Virtual:**
- Processo executa mesmo estando **parcialmente** na memória principal.
- O espaço de endereçamento virtual pode ser igual, maior ou menor que a memória física.

**Crescimento de memória por processo:**
- **Fixo** (simples) ou **dinâmico** (realidade — pode invadir o espaço de outro).
- Layout deixa **espaço para expansão** (ex.: dados crescem para cima, pilha cresce para baixo).

---

## 7. Tipos de Memória Particionada

| | Partições Fixas (estática) | Partições Variáveis (dinâmica) |
|---|---|---|
| Tamanho/número | Fixos | Variam |
| Memória | Tende a desperdiçar | Otimiza o uso |
| Implementação | Mais simples | Mais complexa (alocar/liberar) |
| Fragmentação | — | Interna **e** externa |

---

## 8. Gerenciamento de Memória Livre

Quando a memória é alocada dinamicamente, o SO precisa rastrear a memória em uso. **Duas formas principais:**

### 8.1 Mapa de Bits
- Memória dividida em **unidades de alocação**; cada unidade tem 1 bit: **0 = livre, 1 = ocupado**.
- Tamanho da unidade é crítico: unidade **grande** → desperdício; unidade pequena → mapa grande.
- Controle simples, mas **achar k unidades livres consecutivas é lento** (precisa varrer o mapa).

### 8.2 Lista Encadeada
- Lista (na prática **duplamente encadeada**) de nós que representam segmentos **livres (L/H)** ou **processos (P)**, com endereço de início e comprimento.
- Mantida **ordenada**; ao liberar, o nó tem dois vizinhos → **4 combinações** de fusão possíveis (vizinhos podem ser processo ou área livre).

---

## 9. Algoritmos de Alocação (na Lista Encadeada)

> Todos sabem de antemão quanto de memória é pedido.

| Algoritmo | Como funciona | Observação |
|---|---|---|
| **First Fit** | Pega o **primeiro** espaço grande o suficiente | Menor busca; bom na prática |
| **Next Fit** | Como First Fit, mas começa **a partir da última posição** usada | Parece bom, mas é **pior** que o First Fit |
| **Best Fit** | Varre **toda** a lista e pega o **menor** que serve | Mais lento; **fragmenta muito** (deixa sobras minúsculas) |
| **Worst Fit** | Pega sempre o **maior** espaço | Ideia: deixar sobra utilizável; na prática também é ruim |
| **Quick Fit** | Mantém **listas separadas** por tamanhos padrões de espaços livres | Achar é rápido; **liberar é caro** (fundir vizinhos), e sem fusão a fragmentação domina |

---

## 10. Gerenciamento no Espaço de Usuário

- O próprio processo gerencia memória para **evitar pedir ao SO** (reduz overhead).
- Ao ser criado, o processo recebe o **Heap**, ajustável em tempo de execução via bibliotecas — no Linux padrão, a **LibC**.

**LibC:**
- Fornece `malloc` (alocar) e `free` (liberar).
- Blocos liberados **não voltam ao SO**; ficam na área de gerenciamento da biblioteca para reuso.
- Implementações: **dlmalloc** (Doug Lea, mais famosa/genérica), **ptmalloc2** (extensão com threads), **jemalloc** (FreeBSD).

**ptmalloc / dlmalloc:**
- Memória liberada vira **bins** (porções recicladas), organizadas em listas encadeadas.
- A própria área liberada guarda os **metadados** (estrutura **chunk**: `prev_size`, `size` com flags `n`=non_main_arena, `m`=is_mmaped, `p`=prev_inuse, ponteiros `fd`/`bk`...).
- **5 tipos de bins:**
  - 62 small bins
  - 63 large bins
  - 1 unsorted bin
  - 10 fast bins (otimização recente)
  - 64 tcache bins por thread (otimização recente)
- **small bins:** listas de até **512 bytes**, tamanho fixo, rápidos.

---

## Pontos que costumam cair na prova
- Diferença **endereço físico × endereço virtual** e o papel da **MMU**.
- Os **2 problemas** dos endereços físicos: **proteção** e **realocação**.
- **Swap-in / Swap-out** e diferença Swapping × Memória Virtual.
- **Fragmentação interna × externa** e qual tipo de partição causa qual.
- Comparar os **5 algoritmos de alocação** (saber que Best Fit fragmenta e Next Fit é pior que First Fit).
- Mapa de bits × lista encadeada (vantagens/desvantagens).
- `malloc`/`free`, papel da LibC e que memória liberada **não retorna** imediatamente ao SO.
