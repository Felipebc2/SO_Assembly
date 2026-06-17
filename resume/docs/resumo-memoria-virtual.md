# Resumo de Prova — Memória Virtual

> Sistemas Operacionais / Programação Concorrente — IDP

---

## 1. O que é Memória Virtual

Técnica que usa a **memória secundária (disco)** como uma "cache" de partes do espaço de endereçamento dos processos.

**Por que existe:**
- Software cada vez maior
- Maior grau de multiprogramação
- Permitir executar programas **maiores que a RAM**

Todo processo usa **endereços virtuais (lógicos)**, nunca físicos. A **MMU** faz a conversão virtual → físico.

---

## 2. Técnicas

| Técnica | Blocos | Característica |
|---|---|---|
| **Paginação** | Tamanho **fixo** (usual: 4KB) | Espaço virtual dividido em páginas |
| **Segmentação** | Tamanho **arbitrário** | Cada segmento contém um mesmo tipo de info (dados, pilha, etc.) |

Na prática usa-se uma **mistura**: pagina-se a memória, e cada página é delimitada a um tipo de informação + permissão. A MMU mapeia em ambos os casos.

---

## 3. Conceitos-chave da Paginação

- **Página** → unidade de tamanho fixo no disco (secundário)
- **Frame (quadro)** → unidade correspondente na memória física
- **Page fault** → evento quando uma página que **não está na RAM** é referenciada
- **Tabela de Páginas** → estrutura que mapeia página → frame (**cada processo tem a sua**)

---

## 4. Como a MMU traduz o endereço

A página tem tamanho potência de 2. O endereço virtual é dividido em:

```
[ p (número da página) | d (offset/deslocamento) ]
```

- **p** → índice na tabela de páginas → retorna o frame (se bit presente = 1)
- **d** → copiado direto para a saída (últimos 12 bits para página de 4KB)

**Exemplo (endereço 8196, página 4KB):**
- Binário: `0010 000000000100`
- 4 primeiros bits = página **2**
- 12 últimos bits = offset **4** (8 no slide)
- Se bit presente = **0** → ocorre o **page fault** (interrupção para o SO)

**Resumo do fluxo:** MMU detecta página → busca frame na tabela → soma/substitui base → coloca endereço físico no barramento.

---

## 5. Estrutura da Entrada da Tabela de Páginas

| Campo | Função |
|---|---|
| **Page frame number** | Identifica o frame real |
| **Bit de residência (presente/ausente)** | =1 se página está na RAM (válida) |
| **Bits de proteção** | 1 bit (R/W) ou 3 bits (R/W/X) |
| **Bit de modificação (dirty)** | Conteúdo foi alterado |
| **Bit de referenciamento** | Foi acessada recentemente |
| **Bit de cache** | Desabilita caching da página |

---

## 6. Tamanho de Página — Tradeoff (cai em prova!)

| | Páginas **grandes** | Páginas **menores** |
|---|---|---|
| Leitura | Mais eficiente | Menos eficiente |
| Tabela | Menor | Maior |
| Fragmentação interna | Maior | Menor |

---

## 7. Armazenamento da Tabela de Páginas

Dois problemas a resolver: **mapeamento rápido** + **tabela pode ser enorme**.
- 32 bits + página 4K → ~1 milhão de entradas
- 64 bits + página 4K → ~4,5 quatrilhões de entradas

**Onde guardar:**
1. **Array de registradores** → memória pequena, tudo em hardware
2. **Memória principal** (mais usado) → MMU gerencia via registradores
   - **PTBR** (Page Table Base Register): aponta para o início da tabela
   - **PTLR** (Page Table Length Register): tamanho da tabela (nº de entradas)
3. **Memória associativa/cache na MMU (TLB)** → acelera

**Problema da tabela na RAM:** precisa de **2 acessos à memória** (1 para a tabela + 1 para o dado). **Solução: TLB.**

---

## 8. TLB (Translation Lookaside Buffer)

Módulo de hardware (geralmente dentro da MMU) que mapeia endereços **sem passar pela tabela de páginas**.

- Baseia-se na **localidade**: poucas páginas concentram a maioria dos acessos.
- **TLB hit** → tradução direta.
- **TLB miss** → busca na tabela de páginas; a MMU substitui ("destitui") uma entrada da TLB pela página recém-buscada.
- Ao sair uma entrada da TLB, o **bit modificado é copiado de volta** para a tabela na memória.

**Hardware vs Software:**
- Hardware → mais rápido, mas ocupa espaço de outras funções (cache)
- Software → TLB carregada pelo SO; em falta, o problema volta ao SO; precisa ser grande para reduzir ausências

---

## 9. Tipos de Falha de Página (cai em prova!)

| Tipo | Situação | Custo |
|---|---|---|
| **Soft miss** | Não está na TLB, **mas está na RAM** → só atualiza a TLB | Rápido |
| **Hard miss** | Não está na TLB **nem na RAM** → buscar no disco | Extremamente lento |

---

## Checklist rápido para a prova

- [ ] Definição de memória virtual e seus 3 motivos
- [ ] Paginação vs Segmentação
- [ ] Diferença página × frame × page fault
- [ ] Divisão do endereço em **p + d** e o cálculo
- [ ] Papel do bit presente/ausente no page fault
- [ ] Campos da entrada da tabela de páginas
- [ ] Tradeoff de tamanho de página
- [ ] PTBR e PTLR
- [ ] Por que existe a TLB (2 acessos → 1) e o que é hit/miss
- [ ] Soft miss × Hard miss
