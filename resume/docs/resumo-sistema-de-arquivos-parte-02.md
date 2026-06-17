# Resumo — Sistema de Arquivos (Parte 02)

> Implementação de sistemas de arquivos, diretórios, compartilhamento, desempenho e consistência.

---

## 1. Esquema de Sistema de Arquivos no Disco

- Sistemas de arquivos ficam armazenados em **discos**, que podem ter uma ou mais **partições** (cada uma com seu próprio sistema de arquivos).
- **Setor 0 = MBR (Master Boot Record):** usado na inicialização; o fim da MBR contém a **tabela de partição** (endereços de início/fim de cada partição). Uma partição pode ser marcada como **ativa** (de onde o SO é carregado).
- Estrutura típica de uma partição (em ordem):
  `Bloco de inicialização → Superbloco → Gerenciamento de espaço livre → I-nodes → Diretório-raiz → Arquivos e diretórios`
- **Bloco de inicialização:** toda partição tem, mesmo sem SO.
- **Superbloco:** parâmetros-chave do sistema de arquivos.

---

## 2. Métodos de Implementação de Arquivos

### Alocação Contígua
- Cada arquivo ocupa uma sequência contígua de blocos (ex.: bloco de 1K, arquivo de 50K = 50 blocos).
- ✅ Simples e performático.
- ❌ Sofre com **fragmentação**.
- Uso prático: **CDs** (ok), **DVDs** com UDF (30 bits → limite de **1GB** por arquivo); **Blu-ray** usa 64 bits (UDF 2.6, sem esse limite).

### Alocação por Lista Encadeada
- Primeira **palavra** de cada bloco guarda um **ponteiro** para o próximo; resto é dado.
- ✅ Sem fragmentação; leitura sequencial direta.
- ❌ **Acesso aleatório lento**; ponteiro consome bytes (quebra potências de 2).

### Lista Encadeada com Tabela na Memória (FAT)
- Os ponteiros vão para uma tabela na **RAM** chamada **FAT (File Allocation Table)**.
- ✅ Bloco inteiro fica disponível para dados.
- ❌ Tabela precisa estar **sempre em memória**. Ex.: disco 1TB, bloco 1K, entradas de 4 bytes → ~**3GB só de tabela** (impraticável para discos grandes).

### I-nodes
- Estrutura de dados associada a cada arquivo, com **atributos + endereços de blocos**.
- I-node só vai para a memória se o arquivo estiver **aberto** → escala melhor que FAT.
- **Estrutura de ponteiros (clássica Unix):**
  - 10 ponteiros **diretos** (acesso rápido)
  - 1 indireto **simples**
  - 1 indireto **duplo**
  - 1 indireto **triplo** (arquivos muito grandes)
- **Campos típicos do i-node:** número (inum), dono (uid), grupo (gid), tipo (`-` ou `d`), permissões (rwx/ugo), data de modificação, data de criação, tamanho, nº de (hard) links, lista de ponteiros.
- Usado pelo **ext4** (Linux); **NTFS** (Windows) usa algo próximo, ajustado para arquivos grandes.

---

## 3. Implementação de Diretórios

- Para abrir um arquivo, o SO usa **nome + caminho** para localizá-lo.
- O nome pode mapear para: endereço físico (contígua), nº do primeiro bloco (encadeada) ou nº do **i-node**.
- **Onde guardar atributos?**
  - (a) Diretamente na entrada do diretório (lista de entradas fixas).
  - (b) Nos próprios **i-nodes** (sistemas que os usam).
- **Tamanho dos nomes:**
  - Fixo: MSDOS = 8+3 caracteres; outros = 255 (desperdiça espaço).
  - Variável: (a) entrada com tamanho informado e nome ao final; (b) atributos fixos + **ponteiro para uma heap** onde fica o nome.
- **Problema da busca:** busca **linear** é lenta em diretórios grandes.
  - Melhorias: **tabela de hash** (aumenta complexidade) ou **cache de resultados**.

---

## 4. Arquivos Compartilhados

- Um mesmo arquivo pode aparecer em vários diretórios → estrutura deixa de ser **árvore** e vira **grafo acíclico orientado (DAG)**.
- **Problema da cópia:** se compartilhar por cópia, alterações não são vistas pelos outros.
  - Solução 1: compartilhar só os atributos (**i-node**), usando **contador de links**.
  - Solução 2: usar arquivos do tipo **link**.

---

## 5. Questões: Desempenho e Confiabilidade

- **Desempenho:** garantir busca rápida em dispositivo lento.
- **Confiabilidade:** evitar perdas e inconsistências.
- **Soluções:**
  - Software: **Logs** e **Journaling**.
  - Hardware: **RAID** (Redundant Array of Independent Disks).
  - Software + Hardware: **Backup**.

### Solução de desempenho: cache em memória
- ✅ Acelera o acesso.
- ❌ Aumenta risco de **perda de dados** e **inconsistência** (metadado modificado, mas dado ainda não gravado no disco). Escrita **síncrona** resolve, mas fica muito lenta.

### Exemplo de inconsistência (remoção de arquivo)
Ordem: 1) remover entrada do diretório → 2) liberar i-node → 3) liberar blocos.
- Crash após o 1º: perde i-node e blocos.
- Crash após o 2º: perde blocos de dados.
- Mudar a ordem **não resolve**, só gera outros problemas.

---

## 6. Princípios de Consistência

- **Preservação:** dados estáveis no disco não podem ser afetados por uma pane.
- **Predição:** recuperação após pane deve ser previsível.
- **Atomicidade:** operação é totalmente realizada ou considerada nunca iniciada.

Paradigmas que seguem esses princípios: **Sistemas Estruturados em Logs** e **Journaling**.

---

## 7. Sistemas de Arquivos Estruturados em Logs

- Agrupa escritas pequenas/aleatórias e grava de uma vez de forma **sequencial** em **segmentos** (podem conter i-nodes, blocos ou bitmaps).
- Início de cada segmento tem um **log** descrevendo seu conteúdo.
- I-nodes ficam dispersos → mantém-se um **mapa de i-nodes** (disco + cache).
- ✅ Alto desempenho de **escrita**.
- ❌ Precisa de **garbage collector** para reorganizar segmentos; disco cheio derruba o desempenho.
- Pouco usado na prática (mas inspirou o journaling).

---

## 8. Journaling (Jornalamento) — ⭐ tópico central

- Mantém um **diário (journal)** registrando o que será feito **antes de fazer**. Em caso de falha, conclui ou cancela a operação sem inconsistência.
- Usa mecanismos de **banco de dados** (transações rastreáveis).
- **Registros precisam ser idempotentes** (podem ser repetidos sem prejuízo).
- Transações precisam ser **atômicas**.

### Propriedades ACID
- **A**tomicidade: indivisível da ótica externa.
- **C**onsistência: não viola invariantes do sistema.
- **I**solamento: transações concorrentes não interferem entre si.
- **D**urabilidade: efeitos concluídos são permanentes.

### Primitivas
`begin_transaction`, `end_transaction`, `commit`, `abort` + **rollback**. Transação não concluída mantém o estado inalterado.

### Modos de Journaling
| Modo | Jornaliza | Característica |
|------|-----------|---------------|
| **Full data** | Dados + metadados | Consistência total; mais lento |
| **Write behind** | Só metadados | Sistema consistente, mas arquivo pode ter "lixo" (NTFS, ext3, ext4) |
| **Ordered data** | Só metadados | Grava dados no local definitivo **antes** do commit dos metadados; ainda pode haver perda de dados (ext3, ext4) |

- ✅ Recuperação rápida; bom equilíbrio desempenho × segurança.
- ❌ **Sobrecarga de escrita** (escreve 2×: no jornal e no disco). Dados recentes podem ser perdidos, mas a **consistência é garantida**.
- Usado por: **NTFS, ext3, ext4, ReiserFS, APFS**.

---

## 9. Comparativo de Sistemas de Arquivos

| FS | SO | Estrutura | Vantagem | Desvantagem |
|----|----|-----------|----------|-------------|
| **NTFS** | Windows | MFT | Journaling, arquivos grandes | Complexo |
| **ReFS** | Win Server | Evolução do NTFS | Integridade, tolerância a falhas | Compatibilidade limitada |
| **ext4** | Linux | I-nodes | Estável, rápido, maduro | Sem snapshot |
| **XFS** | Linux | I-nodes + B+Trees | Ótimo p/ arquivos grandes | Difícil reduzir partição |
| **ZFS** | Linux/BSD | Copy-on-Write | Integridade, snapshots, RAID nativo | Consome muita RAM |
| **APFS** | macOS/iOS | Copy-on-Write | SSDs, snapshots, criptografia | Proprietário |
| **HFS+** | macOS antigo | B-Tree | Padrão por anos | Substituído pelo APFS |
| **FAT32** | Universal | FAT | Compatibilidade enorme | Arquivos até 4GB |
| **exFAT** | Universal | Evolução da FAT | Arquivos grandes | Sem journaling |
| **ISO9660** | CDs | Somente leitura | Simples | Não grava |
| **UDF** | DVD/Blu-ray | Evolução do ISO9660 | Suporta gravação | Pouco usado hoje |

---

## ✅ Checklist de revisão (provável de cair)

- [ ] Ordem de elementos da partição (MBR, superbloco, i-nodes...)
- [ ] Comparar os 4 métodos de implementação (vantagens/desvantagens)
- [ ] Por que a FAT não escala (cálculo do tamanho da tabela)
- [ ] Estrutura de ponteiros do i-node (10 diretos + 3 indiretos)
- [ ] DAG e contador de links em arquivos compartilhados
- [ ] Significado de ACID
- [ ] Diferença entre os 3 modos de journaling
- [ ] Trade-off do journaling (dupla escrita; consistência vs. dados recentes)
