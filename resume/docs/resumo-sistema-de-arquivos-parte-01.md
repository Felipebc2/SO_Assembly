# Sistema de Arquivos — Parte 01 (Resumo para Prova)

## 1. Motivação e Armazenamento Persistente
Problemas que o armazenamento secundário resolve:
- Armazenar mais dados do que cabe no espaço de endereçamento.
- Manter informações após o **término do processo** (memória volátil perderia tudo).
- Permitir que informações sejam **independentes de processos** e acessadas por vários.

**Requisitos:** armazenar/recuperar dados, **persistência** (sobrevive ao fim do processo) e acesso compartilhado por múltiplos processos.

**Disco** (fitas, HD, SSD) precisa de 2 operações básicas: **ler bloco K** e **escrever bloco K**. Isso resolve o armazenamento, mas levanta 3 perguntas: como **encontrar** informações, como **garantir acesso** e como saber o que está **disponível**.

## 2. Arquivo (a abstração)
- **Unidade lógica de informação** criada por um ou mais processos.
- Abstração do SO que organiza dados de forma lógica.
- Informações são **persistentes na mídia** (não afetadas pelo fim do processo).
- Estruturados, nomeados, acessados, protegidos e gerenciados via **chamadas de sistema**.
- Organizados em **Sistemas de Arquivos** = parte do SO que trata arquivos; uma das partes mais visíveis ao usuário.

**Dois pontos de vista:**
- **Usuário (alto nível):** como os arquivos aparecem, como são nomeados/protegidos, operações abstraídas.
- **SO (baixo nível):** como são armazenados fisicamente e referenciados (atalhos/links).

## 3. Nomes de Arquivos
- Até **255 caracteres** (sistemas antigos menos — DOS = 8).
- Caracteres proibidos: `? * / \ " | < > :`
- **Case sensitive:** Unix é sensível (`idp.txt` ≠ `IDP.txt`); Windows **não** é (origem de dores de cabeça no WSL).

## 4. Extensão dos Arquivos
- **Windows:** reconhece o arquivo pela **extensão**.
- **Unix:** indiferente à extensão; reconhece pelos **bytes iniciais** do conteúdo (magic number).
- Exemplos: `.c` (fonte C), `.o` (objeto não ligado), `.txt`, `.pdf`, `.zip`, `.mp3`, `.tex` etc.

## 5. Estrutura de Arquivos (3 formas)
| Estrutura | Descrição |
|---|---|
| **Sequência não estruturada de bytes** | Só bytes; SO não interpreta o conteúdo, significado vem da aplicação. **Vantagem: flexibilidade** (Unix/Windows usam). |
| **Sequência de registros de tamanho fixo** | Comum em **mainframes antigos**; leitura/escrita por registro. |
| **Árvore de registros** | Cada registro tem um **campo chave** em posição fixa; o **SO** organiza (não o usuário); mainframes atuais. |

## 6. Tipos de Arquivos
- **Regulares:** informações dos usuários.
- **Diretórios:** estruturam o sistema de arquivos.
- **Especiais/de sistema:** `/dev`, `/proc`.

**Arquivos regulares dividem-se em:**
- **ASCII:** texto em linhas terminadas com **CR+LF**; portáveis e interoperáveis.
- **Binário:** não-ASCII; estrutura interna só conhecida por quem o usa. Ex.: executável tem **cabeçalho** (número mágico, tamanhos de texto/dados/símbolos, ponto de entrada, flags), texto, dados, bits de realocação e tabela de símbolos.

## 7. Atributos de Arquivos
- Informações **além do conteúdo**: nome, proteção, dono, oculto etc.
- Variam por SO. Ex.: Windows usa **atributo** para arquivo oculto; Linux usa **nome iniciado com ponto** (`.arquivo`).

## 8. Acesso aos Arquivos
- **Sequencial** (sistemas antigos): leitura em ordem, byte a byte.
- **Aleatório** (modernos): posiciona o ponteiro em qualquer ponto.
- Operações de leitura: **Read** (lê na posição atual) e **Seek** (salta para uma posição); após o seek, a leitura segue sequencial.

## 9. Operações com Arquivos
`Create` (cria vazio) · `Delete` (remove do disco) · `Open` (busca atributos e carrega endereços na memória) · `Close` (libera o open e força escrita no disco) · `Read` (lê para buffer) · `Write` (escreve) · `Append` (escreve no fim) · `Seek` (acesso aleatório) · `Get/Set attributes` · `Rename`.

## 10. Arquivos Mapeados na Memória
- Mapeados no **espaço de endereçamento** de um processo para acesso mais rápido.
- Útil quando vários processos precisam da mesma informação (ex.: **bibliotecas compartilhadas**). Funciona melhor com **segmentação**.
- **Vantagem:** compartilhamento/trabalho colaborativo.
- **Desvantagens:** uso do espaço virtual, **sincronização** (na edição), **particionamento** (arquivo maior que o espaço).

## 11. Diretórios
- **São arquivos** que mantêm a estrutura do sistema de arquivos.
- Organizações: **nível único**, **dois níveis** (dono + arquivos) e **hierárquico** (árvore com diretório-raiz, diretórios de usuário, subdiretórios e arquivos).
- **Operações:** `Create (mkdir)`, `Delete (rmdir)`, `Opendir`, `Closedir`, `Readdir` (navegação), `Rename`.

### Caminhos (paths)
- **Absoluto:** a partir da raiz → `/usr/bin/python`.
- **Relativo:** a partir do diretório atual → `./programa`.
- Separadores: **Unix** `/` · **Windows** `\` · **Multics** `>`.

## 12. Links (atalhos)
Permitem que um arquivo seja visto em mais de um diretório.

| | Hard Link | Soft Link |
|---|---|---|
| **Como funciona** | Incrementa o **contador de links** | **Ponteiro** para o arquivo (sem controle) |
| **Remoção** | Arquivo só é apagado quando o contador chega a **zero** | Pode "quebrar" se o arquivo original for removido antes |

- **Vantagens do soft link:** não precisa copiar o arquivo; coesão.
- **Desvantagem do soft link:** o link pode ser perdido (remover o arquivo antes do link).
- **Unlink:** remove a entrada do diretório e **decrementa** o contador; se chegar a zero, o arquivo é removido do sistema de arquivos.

---
### Pontos que costumam cair
- Diferença persistência vs. volatilidade (por que precisamos de arquivos).
- As **3 estruturas** de arquivo e quem organiza cada uma.
- **Case sensitive** e extensão: Unix vs. Windows.
- O que **Open** e **Close** realmente fazem.
- **Hard link vs. soft link** e o papel do **contador de links** / unlink.
- Caminho absoluto vs. relativo e separadores por SO.
