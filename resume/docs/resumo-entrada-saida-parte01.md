# Sistemas Operacionais — Entrada e Saída (Parte 01)

Resumo para prova · Prof. Jeremias Moreira Gomes (IDP)

---

## 1. Introdução

- O **SO controla todos os dispositivos de E/S (I/O)**, emitindo comandos para:
  - Manipulação (leitura/escrita)
  - Interceptar interrupções
  - Tratamento de erros
- O SO fornece uma **interface única** para todos os dispositivos via **API (drivers)**.
- Os **drivers constituem a maior parte do SO** — e é onde ocorre **a maior parte do overhead**.

---

## 2. Tipos de E/S (3 classificações)

### 2.1 Tipo de Conexão
Natureza da conexão entre o módulo de E/S e o periférico.

| | **Serial** | **Paralela** |
|---|---|---|
| Linhas | Única linha | Múltiplas linhas |
| Custo/complexidade | Mais barata | Mais complexa |
| Confiabilidade | Relativamente confiável | Altamente confiável |
| Uso | Dispositivos baratos e lentos | Dispositivos mais velozes |

### 2.2 Tipo de Transferência

| | **Bloco** | **Caractere** |
|---|---|---|
| Unidade | Blocos de tamanho fixo, cada um com endereço | Fluxo de caracteres |
| Endereçável? | Sim | Não |
| Acesso aleatório? | Sim (referência de localidade) | Não |
| Otimização | Mais otimizado | — |
| Exemplos | Discos, USB | Impressoras, interfaces de rede, mouses |

> **Atenção (pega de prova):** a classificação não é perfeita. Há dispositivos que **não se encaixam em nenhuma** das duas — ex.: **clocks** (provocam interrupção em intervalo definido; não são bloco nem caractere).

### 2.3 Compartilhamento de Conexões

| | **Ponto-a-ponto** | **Multiponto** |
|---|---|---|
| Linhas | Linha dedicada (módulo ↔ periférico) | Compartilha conjuntos de linhas |
| Simplicidade | Mais simples | — |
| Confiabilidade | Maior | — |
| Paralelismo | **Fornece** paralelismo | **Não permite** paralelismo |
| Escalabilidade | — | Maior escalabilidade |
| Uso | — | Armazenamento |

---

## 3. Princípios de Hardware para E/S

Toda unidade de E/S possui **dois componentes**:
- **Mecânico** → o próprio dispositivo.
- **Eletrônico** → o **controlador (controladora)** do dispositivo, parte programável.

Níveis de interface:
- **Alto nível:** CPU ↔ controladora (via barramentos comuns). É com a controladora que o SO lida.
- **Baixo nível:** controladora ↔ dispositivo.

### Controladora — registradores
- Cada controladora possui **registradores** para controle (pela CPU) e dados (ler/escrever no dispositivo).
- Fluxo: SO escreve comando + parâmetros → CPU faz outra tarefa (ou não) → ao terminar, ocorre **interrupção**.
- Registradores passam parâmetros e informam o **estado do dispositivo** (antes, durante e depois do comando).

### Exemplo: controladora de disco
- Recebe um fluxo de bits: **preâmbulo + bits de setor + checksum (ECC – error-correcting code)**.
- Do dispositivo para a memória: monta bytes em bloco → coloca em **buffer interno** → verifica checksum → copia bloco para a memória.

---

## 4. Formas de Comunicação (CPU ↔ controladoras)

| Forma | Como funciona |
|---|---|
| **Memória mapeada** | Registradores tratados como posições de memória, dentro do espaço de endereços (geralmente no topo). Usa endereços reservados. |
| **Mapeamento em E/S** | Controladoras recebem **portas de E/S**, acessadas por **instruções especiais** (exclusivas do SO). Espaços de endereços **diferentes**. |
| **Híbrido** | Combina as duas: **buffers de dados na memória** + **portas de E/S para controle**. |

---

## Pontos que costumam cair na prova
- Diferença Serial × Paralela (linhas, custo, confiabilidade).
- Bloco × Caractere (endereçável vs. não; exemplos).
- O caso do **clock** que não se encaixa na classificação.
- Ponto-a-ponto × Multiponto (paralelismo vs. escalabilidade).
- Os dois componentes da unidade de E/S e os dois níveis de interface.
- As **3 formas de comunicação** e o que distingue memória mapeada de mapeamento em E/S.
- Função do **ECC/checksum** e do **buffer interno** na controladora de disco.
