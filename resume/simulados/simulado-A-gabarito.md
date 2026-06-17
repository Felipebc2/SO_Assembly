# ✅ Gabarito — Simulado A

> ⚠️ Não abra antes de terminar o `simulado-A.md`!

---

## Parte I — Discursivas

**D1.** Endereço **virtual** = o que o processo usa (espaço de endereçamento
virtual); endereço **físico** = posição real na RAM. A **MMU** (dentro da CPU)
**traduz** virtual → físico a cada acesso; o programa nunca toca o físico
diretamente. Os 2 problemas resolvidos: **proteção** (impedir acesso à memória
de outro processo/SO) e **realocação** (carregar o programa em posições
deslocadas). *(0,25 cada: virtual, físico, MMU/tradução, os 2 problemas)*

**D2.** **Swapping**: traz o processo **inteiro** do disco para a RAM, executa,
e o devolve inteiro ao disco. **swap-out** = RAM→disco; **swap-in** = disco→RAM.
**Memória virtual**: o processo executa estando **parcialmente** na RAM (só as
páginas necessárias), permitindo programas maiores que a RAM. *(diferença
inteiro × parcial é o ponto central)*

**D3.** **R (referência)**: marcado a cada acesso à página; **limpo
periodicamente** (a cada tick do relógio) para refletir uso recente.
**M (modificação/dirty)**: marcado na **escrita**. O bit M **nunca é limpo**
porque o SO precisa saber se a página foi alterada e, portanto, **precisa ser
regravada no disco** antes de ser substituída (se fosse limpo, perderia-se essa
informação e a página suja seria descartada sem salvar).

**D4.** **Journaling**: o SO registra num **diário (journal)** o que vai fazer
**antes** de fazer; após falha, conclui ou desfaz a operação sem inconsistência.
**ACID**: **A**tomicidade (tudo ou nada), **C**onsistência (não viola
invariantes), **I**solamento (transações concorrentes não interferem),
**D**urabilidade (efeitos concluídos são permanentes). **Sobrecarga**: cada
operação é escrita **2×** (primeiro no journal, depois no local definitivo).

---

## Parte II — Objetivas

| Questão | Resposta |
|---------|----------|
| O1 | **b** (Next Fit é pior que First Fit) |
| O2 | **c** (drivers rodam em modo kernel) |
| O3 | **b** (10 diretos + 3 indiretos) |
| O4 | **b** (hard miss: nem TLB nem RAM) |
| O5 | **c** (hash usa a página virtual) |

---

## Parte III — Práticas

**P1.**
- (a) 512K = 2⁹ × 2¹⁰ = **2¹⁹** → **19 bits**.
- (b) 512K ÷ 2K = 2¹⁹ ÷ 2¹¹ = 2⁸ = **256 blocos**.

**P2.** (página/frame = 4096 B)
- (a) VA 13000: página = ⌊13000/4096⌋ = **3**; offset = 13000 − 12288 = **712**.
  Página 3 → frame 0 → físico = 0×4096 + 712 = **712**.
- (b) VA 9000: página = ⌊9000/4096⌋ = **2** → frame **X** → **page fault (-1)**.

**P3.** Lista inicial `[8, 12, 6, 20, 4, 16]`, pedido 5 KB:
- (a) First Fit → primeiro ≥5 é o **8** → vira 3 → `[3, 12, 6, 20, 4, 16]`.
- (b) Best Fit → menor ≥5 é o **6** → vira 1 → `[8, 12, 1, 20, 4, 16]`.
- (c) Worst Fit → maior é o **20** → vira 15 → `[8, 12, 6, 15, 4, 16]`.

**P4.** Após 1 tick (shift right + R no MSB):
- (a)
  - P0: 0011 → 0001, R=1 → **1001**
  - P1: 1000 → 0100, R=0 → **0100**
  - P2: 0100 → 0010, R=1 → **1010**
  - P3: 1100 → 0110, R=0 → **0110**
- (b) Menor contador: P1 = 0100 (4) < P3 0110 (6) < P0 1001 (9) < P2 1010 (10).
  **Candidata = P1.**

---

### Pontuação sugerida
- Discursivas: 0–1,0 cada (4,0)
- Objetivas: 0,4 cada (2,0)
- Práticas: 1,0 cada (4,0)
- **Total: 10,0**
