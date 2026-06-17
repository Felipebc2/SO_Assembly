# ✅ Gabarito — Simulado B

> ⚠️ Não abra antes de terminar o `simulado-B.md`!

---

## Parte I — Discursivas

**D1.** **Page fault** = referência a uma página que **não está na RAM** (bit de
presença = 0). Quando ocorre, a MMU dispara uma interrupção e o **SO**: localiza
a página no disco, escolhe um frame livre (ou remove uma página via algoritmo de
substituição se a RAM estiver cheia), carrega a página no frame, atualiza a
tabela de páginas e reexecuta a instrução. **Soft miss** = não está na TLB, mas
está na RAM (só atualiza a TLB — rápido). **Hard miss** = não está na TLB nem na
RAM → buscar no disco (lento).

**D2.** **Fragmentação interna** = espaço desperdiçado **dentro** de um bloco/
partição (o processo não preencheu tudo). Causada por **partições fixas**.
**Fragmentação externa** = buracos livres **espalhados** entre as partições, que
somados dariam espaço, mas não são contíguos. Causada por **partições variáveis**.

**D3.** A tabela de páginas fica na RAM, então cada acesso exigiria **2 acessos à
memória** (1 para ler a tabela + 1 para o dado), dobrando o custo. A **TLB** é
uma cache de traduções (página→frame) **dentro da MMU**, que guarda as
traduções usadas mais recentemente. Em um **TLB hit**, a tradução é imediata,
sem ir à tabela de páginas → evita o 2º acesso. Funciona por **localidade**
(poucas páginas concentram a maioria dos acessos).

**D4.**
- **Programada:** CPU faz tudo e fica em **espera ocupada (polling)** — ocupada
  o tempo todo.
- **Interrupções:** CPU envia o comando e fica livre; o dispositivo **avisa por
  interrupção** ao terminar. Sem polling, CPU pouco ocupada.
- **DMA:** um controlador faz a transferência **no lugar da CPU**; a CPU quase
  não participa (só programa o DMA e recebe a interrupção final).

---

## Parte II — Objetivas

| Questão | Resposta |
|---------|----------|
| O1 | **c** (Relógio = versão eficiente do Segunda Chance) |
| O2 | **c** (paginação = blocos de tamanho fixo) |
| O3 | **a** (ACID inclui Atomicidade e Durabilidade) |
| O4 | **b** (lista encadeada mantida ordenada) |
| O5 | **d** (invertida = 1 entrada por frame) |

---

## Parte III — Práticas

**P1.**
- (a) 1 GB = 2³⁰ → **30 bits**.
- (b) 1G ÷ 8K = 2³⁰ ÷ 2¹³ = 2¹⁷ = **131.072 blocos**.

**P2.** (T = 4096)
- (a) VA 18000: página = ⌊18000/4096⌋ = **4** (4×4096=16384); offset = 18000 −
  16384 = **1616**. Página 4 → frame **1** → físico = 1×4096 + 1616 = **5712**.
- (b) VA 5000: página = ⌊5000/4096⌋ = **1** → frame **X** → **page fault (-1)**.

**P3.** Lista inicial `[14, 6, 22, 9, 30, 5]`, pedido 8 KB:
- (a) First Fit → primeiro ≥8 é o **14** → vira 6 → `[6, 6, 22, 9, 30, 5]`.
- (b) Best Fit → menor ≥8 é o **9** → vira 1 → `[14, 6, 22, 1, 30, 5]`.
- (c) Worst Fit → maior é o **30** → vira 22 → `[14, 6, 22, 9, 22, 5]`.

**P4.** Após 1 tick:
- (a)
  - P0: 0101 → 0010, R=0 → **0010**
  - P1: 1100 → 0110, R=1 → **1110**
  - P2: 0011 → 0001, R=0 → **0001**
  - P3: 1001 → 0100, R=1 → **1100**
- (b) Menor: P2 = 0001 (1) → **candidata = P2**.

---

### Pontuação sugerida
- Discursivas: 1,0 cada (4,0) · Objetivas: 0,4 cada (2,0) · Práticas: 1,0 cada (4,0)
- **Total: 10,0**
