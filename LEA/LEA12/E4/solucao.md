# Como resolver as questões de Memória Virtual

## Tipo 1: Encontrar o frame dado o número de página

1. Calcule o número da página: `endereço_virtual ÷ tamanho_da_página` (divisão inteira)
2. Consulte a tabela de páginas na linha correspondente
3. Se for **X** → page fault → responda **-1**
4. Caso contrário, responda o número do frame

**Exemplo:** página 8, tamanho 4KB → linha 8 na tabela → frame correspondente

---

## Tipo 2: Encontrar o endereço físico dado o endereço virtual

1. Calcule o número da página: `página = endereço_virtual ÷ tamanho_da_página`
2. Calcule o offset: `offset = endereço_virtual % tamanho_da_página`
3. Consulte a tabela de páginas → obtenha o frame
4. Calcule a base física do frame: `base = frame × tamanho_da_página`
5. Endereço físico = `base + offset`

**Exemplo:** endereço virtual 33464, página 4KB
- página = 33464 ÷ 4096 = 8
- offset = 33464 % 4096 = 696
- página 8 → frame 4
- base = 4 × 4096 = 16384
- físico = 16384 + 696 = **17080**
