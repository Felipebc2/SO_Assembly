# Revisão — Sistemas Operacionais (Memória, Páginas, E/S e Arquivos)

Resumo das questões da lista, com respostas e raciocínio condensado.

---

## 1. Algoritmos de Gerenciamento de Memória Livre (lista encadeada)

| Algoritmo | Princípio |
|-----------|-----------|
| **First Fit** | Percorre a lista até o primeiro espaço grande o suficiente (menor busca) |
| **Next Fit** | Igual ao First Fit, mas continua a busca a partir da última posição gravada |
| **Best Fit** | Varre toda a lista e devolve o **menor** espaço possível |
| **Worst Fit** | Varre toda a lista e devolve o **maior** espaço possível |
| **Quick Fit** | Usa listas separadas de espaços livres por tamanho, para reaproveitamento |

> Pegadinha: Best e Worst varrem a lista **inteira**; First e Next **param** na primeira ocorrência.

---

## 2. Funções do Gerenciador de Memória

**Verdadeiras:**
- Traduzir endereços virtuais em endereços de alocação
- Liberar memória de processos que terminaram
- Alocar memória solicitada por processos
- Controlar partes da memória em uso

**Falsas:**
- Alocar registradores de dispositivos de E/S → função do gerenciador de E/S
- Agilizar acesso a dados frequentes → função da cache (hardware)

---

## 3. Gerenciamento de Memória (Verdadeiro/Falso)

**Verdadeiras:**
- Espaço de endereçamento = conjunto de endereços que o processo pode usar
- Na lista encadeada de memória livre, os nós são mantidos ordenados
- Swapping = copiar conteúdo de um processo da memória para o disco
- A MMU normalmente fica dentro da CPU
- A MMU mapeia endereços virtuais em físicos
- Memória virtual permite executar processos parcialmente na memória principal

**Falsas:**
- Partição fixa otimiza o uso → ERRADO, causa fragmentação interna
- "Cada referência é somada ao endereço inicial em tempo de execução" → isso é realocação **dinâmica**, não estática
- First Fit acha espaço **igual** ao tamanho → ERRADO, é o primeiro **grande o suficiente**

---

## 4. Simulação First Fit / Worst Fit

**Regras:**
- **First Fit** → primeiro nó ≥ pedido, subtrai o valor
- **Worst Fit** → maior nó da lista, subtrai o valor
- Nó que chega a **0** é removido da lista

Exemplo (lista `10 → 4 → 20 → 18 → 7 → 9 → 12 → 13`, pedido 15):
- First Fit → ataca o 20 (primeiro ≥ 15) → vira 5
- Worst Fit → ataca o 20 (é o maior) → vira 5

> Coincidem em pedidos grandes, mas divergem em pedidos pequenos (ex: pedido 4 → First Fit pega o 10; Worst Fit pega o 18).

---

## 5. Memória Virtual (relacionar termos)

| Termo | Definição |
|-------|-----------|
| **TLB** (Translate Lookaside Buffer) | Hardware que mapeia endereços sem passar pela tabela de páginas |
| **Paginação** | Quebra a memória em blocos de tamanho **fixo** |
| **Frame** | Unidade correspondente à página na memória **principal** |
| **Tabela de Páginas** | Estrutura para mapear páginas e frames |
| **Página** | Unidade de tamanho fixo do armazenamento **secundário** |
| **Memória Virtual** | Usa a memória secundária como "cache" dos espaços dos processos |
| **Segmentação** | Quebra a memória em blocos com o **mesmo tipo de informação** |
| **MMU** | Faz a tradução entre endereços virtuais e reais |
| **Page Fault** | Referência a uma página ausente na memória principal |

> Distinção crítica: **Página** = unidade lógica/virtual e do disco; **Frame** = unidade física na RAM. **Paginação** = tamanho fixo; **Segmentação** = por conteúdo.

---

## 6. Cálculo de Bits e Blocos ⭐ (caiu 3+ vezes)

**Relações fundamentais:**
- endereços = 2^bits
- bits = log₂(endereços)
- Memória endereçada por palavra: nº de blocos = espaço de endereçamento

**Tabela de potências (decorar):**

| Sufixo | Potência | | Valor | Potência |
|--------|----------|--|-------|----------|
| K | 2¹⁰ | | 2 | 2¹ |
| M | 2²⁰ | | 4 | 2² |
| G | 2³⁰ | | 8 | 2³ |
| | | | 16 | 2⁴ |
| | | | 32 | 2⁵ |
| | | | 64 | 2⁶ |
| | | | 128 | 2⁷ |
| | | | 256 | 2⁸ |
| | | | 512 | 2⁹ |

**Método:** separe em (potência pequena) × (K/M/G) e **some os expoentes**.

Exemplos resolvidos:
- 2K → 2¹ × 2¹⁰ = 2¹¹ → **11 bits**
- 256K → 2⁸ × 2¹⁰ = 2¹⁸ → **18 bits / 262.144 blocos**
- 4M → 2² × 2²⁰ = 2²² → **22 bits**

> Inverso: "quantos endereços com 12 bits?" → 2¹² = 4096 = 4K.

---

## 7. Algoritmos de Substituição de Páginas (relacionar)

| Algoritmo | Princípio / característica |
|-----------|----------------------------|
| **Relógio** | Implementa Segunda Chance com ponteiro circular |
| **Algoritmo Ótimo** | Não existe na prática; só simulação e comparação |
| **FIFO** (First-In, First-Out) | Substitui a página mais antiga (que chegou primeiro) |
| **Working Set** | Substitui páginas fora do conjunto ativo de trabalho |
| **WSClock** | Combina Working Set + algoritmo do Relógio |
| **Segunda Chance** | Verifica bit de uso e dá nova chance antes de substituir |
| **LRU** (Least Recently Used) | Remove a página não usada há mais tempo |
| **NRU** (Not Recently Used) | Usa bits de uso e modificação; prioriza menos usadas recentemente |

---

## 8. Tabela de Páginas e Paginação (Verdadeiro/Falso)

**Verdadeiras:**
- Tabela de Página Invertida possui entradas por **frames** (não por páginas)
- Paginação hierárquica utiliza múltiplas tabelas de páginas
- Alocação dinâmica → processos trocam páginas entre si para melhor distribuição
- Alocação fixa → cada processo tem nº máximo de páginas definido na criação

**Falsas:**
- Invertida busca em toda a **memória** → ERRADO, busca na tabela invertida (TLB/hash mitiga)
- Tabelas hash não funcionam acima de 32 bits → ERRADO, servem justamente para endereços grandes (64 bits)
- Hash usa o número da página **real** como entrada → ERRADO, é a página **virtual**
- Paginação por demanda começa com 1 página → ERRADO, começa com **zero** páginas

---

## 9. Entrada e Saída (Verdadeiro/Falso)

**Verdadeiras:**
- E/S mapeada em memória → registradores mapeados no espaço de memória
- Conexão serial é mais barata e relativamente confiável
- Software de E/S independente de dispositivo → interface uniforme ao usuário
- Unidades de E/S têm componente mecânico + componente eletrônico
- Dispositivo de caractere **não** é endereçável

**Falsas:**
- Interrupções tratadas de maneira igualitária → ERRADO, têm prioridades
- Objetivo do DMA é reduzir uso de E/S → ERRADO, reduz uso da **CPU**
- Operação por interrupções usa espera ocupada → ERRADO, isso é E/S **programada (polling)**
- Drivers executam em modo usuário → ERRADO, modo **kernel**

---

## 10. Classificação de E/S

A E/S é classificada por:
- **Tipo de Transferência de Dados** (bloco vs. caractere)
- **Tipo de Compartilhamento de Conexões** (dedicada vs. compartilhada)
- **Tipo de Conexão** (serial vs. paralela)

---

## 11. Sistemas de Arquivos (Verdadeiro/Falso)

**Verdadeiras:**
- No Linux, `mv` também renomeia arquivos
- Diretórios são arquivos com propósito de organização/estruturação
- Em arquivo binário, a estrutura é conhecida apenas por quem o criou
- Arquivo = abstração do SO que cria organização lógica para dados
- Arquivos podem ser acessados em modo sequencial e modo aleatório

**Falsas:**
- Links seguem a sintaxe da RFC 2616 → ERRADO, RFC 2616 é o HTTP
- Informações de i-nodes estão **sempre** na memória → ERRADO, só quando o arquivo está aberto
- Caminho absoluto parte do diretório atual → ERRADO, parte da **raiz** (`/`); o relativo parte do atual

---

## Resumo dos erros-armadilha mais recorrentes

- **Realocação dinâmica vs estática** (dinâmica = soma em tempo de execução)
- **Página vs Frame** (frame é físico na RAM)
- **DMA reduz uso da CPU** (não da E/S)
- **First Fit** pega o primeiro grande o suficiente (≠ tamanho exato)
- **Paginação por demanda** começa com zero páginas
- **Drivers** rodam em modo kernel
- **Caminho absoluto** parte da raiz
