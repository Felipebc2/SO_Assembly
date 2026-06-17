# Resumo de Prova — Paginação (Sistemas Operacionais)

> Professor: Jeremias Moreira Gomes — IDP

---

## 1. Contexto / Problema

- **TLBs** aceleram a tradução de endereços virtuais para físicos (cache de traduções).
- Problema central da aula: **como lidar com espaços de endereçamento muito grandes** sem que a tabela de páginas consuma memória demais.

---

## 2. O Problema da Tabela de Páginas

A tabela de páginas pode ficar gigantesca. **Exemplo:**

- Página de 4 KB → offset de 2^12
- 48 bits para endereços
- 8 bytes por entrada (2^3)
- Resultado: 2^48 / 2^12 × 2^3 ≈ **2^39 = 512 GB** só para a tabela.

Computadores atuais têm muita memória → bom para o usuário, **ruim para o gerenciamento** do SO.

### Três formas de estruturar a tabela
1. Paginação Hierárquica (multinível)
2. Tabelas de Hash
3. Tabelas Invertidas

---

## 3. Paginação Hierárquica (Multinível)

**Ideia:** quebrar o espaço de endereços lógicos em **múltiplas tabelas**, mantendo em memória só a parte necessária.

- 1º nível fica na **memória principal**; o restante pode ir para **disco (memória secundária)**.
- Tabelas de níveis seguintes **só são criadas se forem usadas**.
- **Vantagem:** ocupa menos espaço para o SO.

### Endereçamento de 2 níveis (exemplo de 32 bits)
Endereço lógico dividido em:

| Campo | Bits | Função |
|-------|------|--------|
| PT1   | 10   | índice da tabela mais externa |
| PT2   | 10   | deslocamento dentro da tabela interna |
| Offset (deslocamento) | 12 | byte dentro da página |

- Nº de página = 20 bits (PT1 + PT2); deslocamento = 12 bits.
- Cada tabela tem 2^10 = 1024 entradas (índices 0–1023).

### Exemplos reais
- **x86:** CR3 → Page Directory → Page Tables → páginas de 4K.
- **Linux:** vários níveis (PGD → tabelas níveis 1, 2, 3 → página física via PFN).

### Desafio com 64 bits ⚠️ (provável questão de cálculo)
Com página de 4 KB (2^12):

- **Tabela única:** 2^(64−12) = **2^52 entradas** (inviável).
- **2 níveis** (42 bits primária + 10 secundária): 2^42 × 8 = 2^45 B = **32 TB só na primária**.
- **3 níveis** (32 bits primária + 10 nas outras): 2^32 × 8 = **32 GB só na primária**.

> Conclusão: com 32 bits até 3 níveis funciona bem; com 64 bits a hierarquia simples não basta.

---

## 4. Tabelas de Páginas em Hash

- O **número da página virtual** entra numa **função de hash**.
- Cada entrada aponta para uma **lista ligada** com:
  - número da página virtual
  - número do frame
  - ponteiro para o próximo (tratamento de **colisão**)
- Funciona bem com **32 bits**, mas a tabela **cresce rápido**.
- Por isso surgiu a alternativa das **tabelas invertidas**.

---

## 5. Tabelas de Página Invertida

- **Uma entrada por frame físico** (não por página virtual).
- Cada entrada guarda: **processo (pid) + página virtual**.
- O **índice do frame** é a posição/deslocamento na leitura.
- **Vantagem:** economiza espaço quando o **espaço virtual > espaço físico**.
- **Desvantagem:** é preciso **varrer toda a tabela** a cada acesso → mais lento.
- **Solução:** usar a **TLB** para as páginas mais acessadas; só varre a tabela inteira em caso de *miss*.

---

## 6. Mecanismos de Alocação de Páginas

### Alocação Fixa
- Nº máximo de páginas reais definido na **criação** do processo.
- Limite pode ser igual para todos.
- ✅ Simplicidade.
- ❌ Poucas páginas → muita paginação; muitas páginas → desperdício.

### Alocação Dinâmica
- Nº máximo de páginas **varia durante a execução**.
- ✅ Processo com alta taxa de paginação ganha mais páginas; baixa taxa perde páginas.
- ❌ Exige **monitoramento constante**.

---

## 7. Tipos de Busca de Páginas

- **Paginação Simples:** todas as páginas virtuais do processo são carregadas de uma vez para a memória principal.
- **Paginação por Demanda:**
  - Processo começa **sem nenhuma página** na memória.
  - A primeira instrução gera sempre um **page fault**.
  - O SO traz a página correspondente quando o fault ocorre.

---

## 8. Políticas de Substituição de Páginas

- **Local:** considera **apenas o processo** que causou a substituição (ex.: escolhe a página mais antiga só daquele processo).
- **Global:** considera **todos os processos** em execução no momento.

---

## ✅ Pontos-chave para a prova
1. Saber **por que** a tabela de páginas fica grande (fórmula 4KB / bits / bytes por entrada).
2. **3 estruturas** de tabela: hierárquica, hash, invertida — vantagem/desvantagem de cada.
3. Divisão do endereço lógico na paginação de 2 níveis (PT1 / PT2 / offset).
4. **Cálculos de 64 bits** (2^52 entradas; 32 TB; 32 GB).
5. Hash usa lista ligada por colisão; invertida tem 1 entrada por frame e depende da TLB.
6. Alocação Fixa × Dinâmica.
7. Paginação Simples × por Demanda (page fault).
8. Substituição Local × Global.
