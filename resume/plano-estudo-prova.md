# 📚 Plano de Estudo — 2h para a prova de Sistemas Operacionais

---

## ⏱️ Cronograma cronometrado (120 min)

| Tempo | Bloco | O que fazer |
|-------|-------|-------------|
| 0:00–0:10 | **Fórmulas & potências** | Decorar a tabela de potências e as 3 fórmulas-chave (§1). |
| 0:10–0:55 | **PRÁTICAS / CÁLCULO** ⭐ | Os 5 tipos de questão de cálculo (§2). Refazer cada exemplo no papel. |
| 0:55–1:35 | **Teoria núcleo** | Memória virtual, MMU/TLB, paginação, substituição, gerência de memória (§3). |
| 1:35–1:55 | **Teoria secundária** | E/S e Sistemas de Arquivos (§4). |
| 1:55–2:00 | **Armadilhas V/F** | Ler a lista de pegadinhas (§5). |

**Regra de ouro:** se o tempo apertar, NÃO corte o bloco de práticas. Corte o §4.

---

## 1. 🧮 Folha de fórmulas (a cola que resolve tudo)

### Tabela de potências (decorar!)
| 2ⁿ | valor | | 2ⁿ | valor |
|----|-------|--|----|-------|
| 2⁰ | 1 | | 2⁶ | 64 |
| 2¹ | 2 | | 2⁷ | 128 |
| 2² | 4 | | 2⁸ | 256 |
| 2³ | 8 | | 2⁹ | 512 |
| 2⁴ | 16 | | 2¹⁰ | **1024 = 1K** |
| 2⁵ | 32 | | 2²⁰ = **1M**, 2³⁰ = **1G** |

### Fórmulas-chave
- **Endereços ↔ bits:** `nº de endereços = 2^bits` → `bits = log₂(endereços)`.
- **Método K/M/G:** separe em (potência pequena) × (K/M/G) e **some os expoentes**.
  - Ex.: `256K = 2⁸ × 2¹⁰ = 2¹⁸` → 18 bits / 262.144 endereços.
  - Ex.: `4M = 2² × 2²⁰ = 2²²` → 22 bits.
  - Inverso: "12 bits?" → `2¹² = 4096 = 4K`.
- **Blocos:** `nº de blocos = memória_total ÷ tamanho_do_bloco`.
- **Mapa de bits:** `1 bit por unidade de alocação`; tamanho do mapa = nº de unidades.
- **Tradução de endereço (paginação):**
  - `página = ⌊endereço_virtual ÷ tamanho_página⌋`
  - `offset = endereço_virtual mod tamanho_página`
  - `endereço_físico = (frame × tamanho_frame) + offset`
  - Se o frame da página = **X** (não residente) → **page fault** (responder `-1`).

---

## 2. ⭐ PRÁTICAS — os 5 tipos de cálculo (PRIORIDADE MÁXIMA)

### Tipo A — Bits / endereços / blocos (LEA11 E1-E2, revisão §6)
**Método:** use o método K/M/G acima.
- **Exemplo resolvido:** memória de 256K, palavra de 1 byte → `2⁸×2¹⁰ = 2¹⁸` →
  **262.144 blocos / 18 bits de endereço**.
- **Blocos:** memória de 1M com bloco de 4K → `2²⁰ ÷ 2¹² = 2⁸ = 256 blocos`.
- **Treine:** quantos bits para endereçar 2K? *(resposta: 2¹×2¹⁰ = 2¹¹ → 11 bits)*

### Tipo B — Mapa de bits (LEA11 E3-E5)
**Método:** cada unidade = 1 bit. `unidade = memória_total ÷ nº_de_bits(blocos)`.
Memória livre = (nº de bits 0) × tamanho_da_unidade.
- **Exemplo:** memória 1M, 256 blocos → unidade = `2²⁰ ÷ 2⁸ = 2¹² = 4K` por unidade.
- **Memória livre:** mapa `1 1 0 0 1 0 1 0` com unidade de 4K → 4 zeros → `4 × 4K = 16K livres`.

### Tipo C — Lista encadeada + First / Best / Worst Fit (LEA11 E6-E8, LEE11 E1-E2)
**Regras de alocação** (pedido = quanto a alocação solicita):
| Algoritmo | Escolhe |
|-----------|---------|
| **First Fit** | o **primeiro** buraco que cabe (≥ pedido) — para na 1ª ocorrência |
| **Best Fit** | varre tudo, pega o **menor** que cabe (fragmenta muito) |
| **Worst Fit** | varre tudo, pega o **maior** buraco |
| **Next Fit** | como First, mas começa da **última posição** usada |

Ao alocar: `buraco_novo = buraco − pedido`. Buraco que chega a **0** sai da lista
(⚠️ no LEE11, se o enunciado pedir, mantenha o nó zerado por coesão de índices).
- **Exemplo (lista `10 → 4 → 20 → 18 → 7 → 9 → 12 → 13`, pedido 15):**
  - First Fit → primeiro ≥ 15 é o **20** → vira **5**.
  - Worst Fit → maior é o **20** → vira **5** (coincidem em pedidos grandes).
  - Best Fit → menor que cabe também é o **18** → vira 3. *(só o 18 e o 20 cabem; 18 é o menor)*
- **Divergência (mesma lista, pedido 4):** First pega o **10**(→6); Worst pega o **20**(→16); Best pega o **4**(→0, sai).

> Memória livre numa lista `P/L` (LEA11 E6): some só os tamanhos dos nós **L/H**.
> Memória total (E7): some **todos** os nós × tamanho da unidade.

### Tipo D — Tradução página → frame e virtual → físico (LEA12 E1-E4) ⭐⭐
**Método:** `página = ⌊VA ÷ tam⌋`; `offset = VA mod tam`; `físico = frame×tam + offset`.
- **Página→frame (E1):** página 11 = faixa 44K-47K = **X** → **page fault → -1**.
- **VA→físico, página 4K (E3):** VA = **5597**.
  - página = ⌊5597 ÷ 4096⌋ = **1** (faixa 4K-7K), offset = 5597 − 4096 = **1501**.
  - página 1 → frame **6**; frame 6 = físico 24K = 24576.
  - físico = 24576 + 1501 = **26077**. ✅
- **VA→físico, página 8K (E4):** VA = **102300**.
  - página = ⌊102300 ÷ 8192⌋ = **12** (96K-104K), offset = 102300 − 98304 = **3996**.
  - página 12 → frame **2**; frame 2 = 16K = 16384.
  - físico = 16384 + 3996 = **20380**. ✅
- **Treine (E4, página 2K):** VA = 24105 → página ⌊24105/2048⌋ = 11 (22K-24K),
  offset 1577, frame 4 (8K=8192) → físico = 8192 + 1577 = **9769**.

### Tipo E — Substituição de páginas: NRU / Segunda Chance / Aging (LEA12 E5-E6, LEE12 E1-E4)

**NRU (Not Recently Used):** classifica por (R,M) e escolhe a **menor classe não vazia**.
| Classe | R M |
|--------|-----|
| 0 | 0 0 |
| 1 | 0 1 |
| 2 | 1 0 |
| 3 | 1 1 |
- **Exemplo (LEA12 E5):** páginas com (R,M)=(0,0): **4, 6, 9, 11**. Classe 0 não
  vazia → candidatas = **4 6 9 11**.

**Segunda Chance (= FIFO + bit R) (LEE12 E1):** olha a página da **frente** da fila:
- `R = 0` → **substitui** essa página.
- `R = 1` → zera R, manda pro **fim** da fila e olha a próxima. Repete até achar R=0.
- **Exemplo:** fila `A(1) B(0) C(1)` → A tem R=1 (zera, vai pro fim) → B tem R=0 →
  **substitui B**.

**Aging / Envelhecimento (aproximação de LRU) (LEE12 E2-E4):** a cada tick de relógio:
1. desloca o contador **1 bit à direita**;
2. insere o **bit R no bit mais significativo** (à esquerda);
3. zera o R.
Remove a página de **menor contador**.
- **Exemplo (contador de 8 bits):** página com contador `1000 0000` e R=1 no tick →
  shift right = `0100 0000`, insere R no MSB = `1100 0000`.
  Se outra está `0011 0000`, a candidata à substituição é a de **menor valor** = `0011 0000`.
- **Empate:** qualquer uma das empatadas serve como resposta.

---

## 3. 🧠 Teoria núcleo (discursivas + objetivas)

### Memória Virtual / MMU / TLB
- **Endereço virtual ≠ físico.** O processo só usa **virtuais**; a **MMU** (dentro
  da CPU) traduz virtual → físico. Nunca acessa o físico direto.
- **2 problemas que a abstração resolve:** **proteção** e **realocação**.
- **Swapping:** traz o processo **inteiro** (swap-in disco→RAM / swap-out RAM→disco).
  **Memória virtual:** processo roda **parcialmente** na RAM.
- **Página** = unidade fixa (lógica/disco). **Frame** = unidade física (RAM).
  **Page fault** = referência a página ausente da RAM (bit presente = 0).
- **Por que existe a TLB:** sem ela são **2 acessos** (tabela + dado). TLB é cache
  de traduções → **hit** = direto; **miss** = busca na tabela.
- **Soft miss** = não está na TLB, **mas está na RAM** (rápido).
  **Hard miss** = não está na TLB **nem na RAM** → buscar no disco (lento).
- **Entrada da tabela de páginas:** frame, bit presente/ausente, proteção (R/W/X),
  bit M (dirty), bit R (referência), bit de cache.
- **Tradeoff tamanho de página:** grande → tabela menor, mais fragmentação interna;
  pequena → tabela maior, menos fragmentação.
- **PTBR** (base da tabela) e **PTLR** (tamanho da tabela).

### Paginação — 3 estruturas de tabela
| Estrutura | Ideia | Vantagem | Desvantagem |
|-----------|-------|----------|-------------|
| **Hierárquica** | múltiplas tabelas, só cria o necessário (PT1/PT2/offset) | ocupa menos | mais níveis = mais acessos |
| **Hash** | nº da página **virtual** → função hash → lista (colisões) | boa em 64 bits | cresce rápido |
| **Invertida** | **1 entrada por frame** (pid + página virtual) | economiza quando virtual > físico | varre tudo → depende da TLB |
- **Por que a tabela fica gigante:** `2^bits ÷ tam_página × bytes_entrada`.
  64 bits + 4K → ~2⁵² entradas (inviável).
- **Alocação fixa** (nº máx. de páginas na criação) × **dinâmica** (varia, monitora).
- **Paginação por demanda começa com ZERO páginas** (1º acesso = page fault).
- **Política local** (só o processo) × **global** (todos os processos).

### Substituição de páginas (tabela comparativa)
| Algoritmo | Base | Observação |
|-----------|------|------------|
| **Ótimo** | futuro | só teórico/comparação |
| **NRU** | classes R/M | escolhe menor classe |
| **FIFO** | fila | simples, ruim |
| **Segunda Chance** | FIFO + R | R=1 ganha 2ª chance |
| **Relógio** | lista circular + R | versão eficiente do 2ª chance |
| **LRU** | tempo de uso | caro; **NFU** é a versão software (defeito: "não esquece") |
| **Working Set** | páginas dos últimos *t*s | pré-paginação |
| **WSClock** | Clock + Working Set | **o mais usado** |
- **Bit R:** limpo periodicamente. **Bit M:** nunca limpo (indica regravar no disco).

### Gerência de Memória
- **Fragmentação interna** (partições fixas: sobra dentro do bloco) ×
  **externa** (partições variáveis: buracos espalhados).
- **5 algoritmos de alocação:** First / Next / Best / Worst / Quick Fit.
  ⚠️ Best Fit fragmenta muito; Next Fit é **pior** que First Fit.
- **Mapa de bits** × **lista encadeada** (na prática, duplamente encadeada e ordenada).
- **malloc/free** via LibC: memória liberada **não volta** ao SO (vira bins/chunks).

---

## 4. 💾 Teoria secundária (E/S e Sistemas de Arquivos)

### Entrada/Saída
- **Programada × Interrupção × DMA:**
  | Técnica | CPU ocupada? | Espera ocupada (polling)? | Quem gerencia |
  |---------|--------------|---------------------------|---------------|
  | Programada | sim, o tempo todo | **sim** | CPU |
  | Interrupções | pouco | não | CPU (avisada) |
  | DMA | quase nada | não | controladora DMA |
- ⚠️ **DMA reduz uso da CPU** (não da E/S). Interrupções **têm prioridade**
  (menor número = maior prioridade).
- **4 camadas (cima→baixo):** usuário → independente de dispositivo → drivers →
  tratadores de interrupção (→ hardware). **Drivers rodam em modo kernel.**
- **Bloco** (endereçável, acesso aleatório: disco) × **caractere** (não endereçável:
  impressora, mouse). Clock não se encaixa em nenhum.
- **Serial** (barata, 1 linha) × **paralela** (cara, várias linhas).

### Sistemas de Arquivos
- **Ordem na partição:** MBR(setor 0) → boot → superbloco → bitmap livre →
  i-nodes → diretório-raiz → arquivos.
- **4 métodos de implementação:** contígua (frag.), encadeada (acesso aleatório
  lento), **FAT** (tabela na RAM — **não escala**, ex.: 1TB/1K/4B ≈ 3GB de tabela),
  **i-node** (só na RAM se aberto → escala).
- **i-node:** **10 ponteiros diretos + 1 indireto simples + 1 duplo + 1 triplo**.
- **Hard link** (incrementa contador; arquivo só some quando chega a 0) ×
  **soft link** (ponteiro; quebra se o original for removido).
- **Caminho absoluto** parte da **raiz** `/`; **relativo** parte do diretório atual.
- **Journaling:** registra a operação **antes** de fazer (idempotente, atômico).
  **ACID** = Atomicidade, Consistência, Isolamento, Durabilidade.
  Modos: full data / write-behind / ordered data. Custo: **escreve 2×**.

---

## 5. ⚠️ Armadilhas mais recorrentes (ler antes de entregar)

- **Realocação dinâmica** = soma em tempo de execução (estática = ao carregar).
- **Frame** é o físico (RAM); **página** é o lógico/disco.
- **DMA reduz uso da CPU**, não da E/S.
- **First Fit** = primeiro **grande o suficiente** (≠ tamanho exato).
- **Paginação por demanda** começa com **ZERO** páginas.
- **Drivers** rodam em **modo kernel**.
- **Caminho absoluto** parte da **raiz**.
- **Partição fixa** causa fragmentação interna (NÃO otimiza memória).
- **i-node** só está na memória quando o arquivo está **aberto** (não "sempre").
- **Hash** usa a página **virtual** (não a real); **invertida** tem 1 entrada por **frame**.
- Bit **R** é limpo periodicamente; bit **M** nunca.

---

### ✅ Checklist de véspera
- [ ] Sei a tabela de potências e o método K/M/G de cor.
- [ ] Resolvo VA→físico em < 1 min (página, offset, frame×tam + offset).
- [ ] Sei rodar First/Best/Worst Fit numa lista.
- [ ] Sei aplicar NRU, Segunda Chance e Aging (shift + R no MSB).
- [ ] Decorei as 3 estruturas de tabela e a tabela de substituição.
- [ ] Reli as armadilhas (§5).
