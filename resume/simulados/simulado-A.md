# 📝 Simulado A — Sistemas Operacionais

> Estrutura da prova: **4 discursivas + 5 objetivas + 4 práticas (cálculo)**.
> Tempo sugerido: 50 min. Faça sem consultar material.
> Gabarito em `simulado-A-gabarito.md` (não abra antes de terminar!).

---

## Parte I — Discursivas (4 questões)

**D1.** Explique a diferença entre **endereço virtual** e **endereço físico** e
qual o papel da **MMU**. Cite os **2 problemas** que a abstração de espaço de
endereçamento resolve.

**D2.** Diferencie **Swapping** de **Memória Virtual**. O que é swap-in e swap-out?

**D3.** Nos algoritmos de substituição de páginas existem os bits **R**
(referência) e **M** (modificação). Explique a função de cada um e **por que o
bit M nunca é limpo** automaticamente.

**D4.** O que é **journaling** em sistemas de arquivos? Cite e explique as
propriedades **ACID**. Por que o journaling gera **sobrecarga de escrita**?

---

## Parte II — Objetivas (5 questões) — marque a ÚNICA correta

**O1.** Sobre algoritmos de alocação de memória (lista encadeada):
- a) Best Fit sempre deixa menos fragmentação que First Fit.
- b) Next Fit, na prática, tende a ter desempenho **pior** que First Fit.
- c) First Fit procura um buraco de tamanho **exatamente igual** ao pedido.
- d) Worst Fit percorre apenas até o primeiro buraco que cabe.

**O2.** Sobre Entrada/Saída:
- a) Na E/S por interrupções a CPU faz espera ocupada (polling).
- b) O objetivo do DMA é reduzir o uso da própria E/S.
- c) Drivers de dispositivo executam em **modo kernel**.
- d) Todas as interrupções são tratadas com a mesma prioridade.

**O3.** Sobre sistemas de arquivos:
- a) A FAT escala bem para discos grandes porque fica armazenada no disco.
- b) O i-node clássico do Unix tem **10 ponteiros diretos + 3 indiretos** (simples, duplo, triplo).
- c) Um soft link impede que o arquivo original seja removido.
- d) Caminho absoluto parte do diretório atual.

**O4.** Sobre TLB e falhas:
- a) Um soft miss exige buscar a página no disco.
- b) Um **hard miss** ocorre quando a página não está na TLB **nem** na RAM.
- c) A TLB elimina a necessidade da tabela de páginas.
- d) Mesmo com TLB, todo acesso exige 2 acessos à memória.

**O5.** Sobre paginação:
- a) A paginação por demanda começa com todas as páginas na memória.
- b) A tabela de páginas invertida tem uma entrada por página virtual.
- c) A tabela de hash usa o número da **página virtual** como entrada.
- d) A paginação hierárquica usa uma única tabela.

---

## Parte III — Práticas / Cálculo (4 questões)

**P1. (Bits e blocos)** Uma memória principal tem **512 KB** e é endereçada por
palavra de **1 byte**.
- (a) Quantos **bits** são necessários para representar um endereço?
- (b) Se a unidade de alocação (bloco) é de **2 KB**, quantos **blocos** existem?

**P2. (Tradução virtual → físico)** Página/frame de **4 KB**. Tabela de páginas:

| Página | Frame |
|--------|-------|
| 0 | X |
| 1 | 3 |
| 2 | X |
| 3 | 0 |
| 4 | 5 |
| 5 | 2 |

(X = não residente). Responda:
- (a) Endereço virtual **13000** → endereço físico?
- (b) Endereço virtual **9000** → endereço físico?

**P3. (First / Best / Worst Fit)** Lista de buracos livres (em KB), nesta ordem:
`[8, 12, 6, 20, 4, 16]`. Chega uma solicitação de **5 KB**. Informe **como fica a
lista de buracos** após a alocação para cada algoritmo:
- (a) First Fit
- (b) Best Fit
- (c) Worst Fit

**P4. (Aging / Envelhecimento)** Contadores de **4 bits**. Estado atual:

| Página | Contador | R |
|--------|----------|---|
| P0 | 0011 | 1 |
| P1 | 1000 | 0 |
| P2 | 0100 | 1 |
| P3 | 1100 | 0 |

Após **1 tick** de relógio (shift à direita + inserir R no bit mais
significativo + zerar R):
- (a) Qual o novo contador de cada página?
- (b) Qual página é a **candidata à substituição**?
