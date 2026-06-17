# Sistemas Operacionais — Entrada e Saída (Parte 02)

Resumo para prova — Técnicas de E/S, Camadas de Software e Relógios.

---

## 1. Princípios de Software para E/S

Objetivos que o software de E/S deve atender:

- **Independência de dispositivos**: uma mesma instrução (ex.: `read`) serve para discos rígidos, pendrives etc. O SO cuida das particularidades.
- **Nomenclatura uniforme** (independente de software).
- **Tratamento de erro**: feito o mais próximo possível do hardware; o usuário não deve tomar conhecimento.

---

## 2. Modos de Operação de E/S

Diferem pela participação da **CPU** e das **interrupções**.

### 2.1 E/S Programada
- Forma **mais simples**; tudo é feito pela CPU.
- A CPU: verifica o estado do módulo (ocupado?) → envia comando → aguarda resultado → transfere para registrador.
- **Desvantagens**: CPU ocupada o tempo todo e **espera ocupada (polling)** — fica em loop checando se a operação terminou.

### 2.2 E/S por Interrupções
- A CPU requisita o evento e fica **liberada para outras tarefas**.
- A controladora lê os dados e, ao terminar, **envia uma interrupção** à CPU, que então lê os dados da controladora.
- **Resolve a espera ocupada**; a CPU ainda participa, mas muito pouco.
- Interrupções são **identificadas por números** → **menor número = maior prioridade**.
- O **controlador de interrupções** decide: envia à CPU ou ignora momentaneamente.

### 2.3 E/S por DMA (Direct Memory Access)
- Surge porque nas técnicas anteriores há **limite de transferência** e a CPU fica presa ao gerenciamento (desempenho cai com muitos dados).
- **Objetivo**: tirar da CPU a função de gerenciamento de E/S.
- Uma **controladora DMA** faz a E/S programada no lugar da CPU.
- Fluxo: (1) CPU programa o controlador DMA → (2) DMA solicita transferência → (3) dados transferidos para a memória → (4) DMA interrompe a CPU ao concluir.
- **Vantagem**: DMA faz todo o trabalho, liberando a CPU.
- **Desvantagem**: a CPU é mais rápida que a DMA; mesmo livre, ainda precisa pedir à DMA.

| Técnica | CPU ocupada? | Espera ocupada? | Quem gerencia |
|---|---|---|---|
| Programada | Sim, o tempo todo | Sim (polling) | CPU |
| Interrupções | Pouco | Não | CPU (avisada por interrupção) |
| DMA | Quase nada | Não | Controladora DMA |

---

## 3. Princípio de Camadas

- Facilita a **independência de dispositivos** e permite **modularidade e coesão**.
- **Camadas mais baixas**: detalhes do hardware, drivers e tratadores de interrupção.
- **Camadas mais altas**: interface e aplicações de usuário, chamadas de sistema (parte independente de E/S).

### Quatro camadas do software de E/S (de cima para baixo)
1. **Software de E/S no nível do usuário** — chama/formata E/S, spooling.
2. **Software independente de dispositivo** — nomeação, proteção, bloqueio, buffer, alocação.
3. **Drivers de dispositivo** — ajusta registradores; verifica estado.
4. **Tratadores de interrupção** — acordam o driver quando a E/S termina.
5. *(Base)* **Hardware** — executa a operação de E/S.

---

## 4. Software Independente de Dispositivo

Fornece **interface uniforme** para que o SO não precise ser modificado a cada novo dispositivo. Funções:

- Realiza **escalonamento de E/S**.
- Provê **buffering** (ajuste de velocidade e contagem de dados).
- **Cache de dados** (armazena dados frequentes).
- **Reporta erros** e protege contra acessos indevidos (erros de programação, E/S e memória).
- **Define tamanhos de blocos** independentes de dispositivo.

---

## 5. Tratadores de Interrupção

- **Essenciais** para a E/S, mas difíceis de programar ("pesadelo").
- O ideal é que **nunca sejam tratados no nível de usuário**.
- Usam **semáforos** para bloquear operações de E/S.

---

## 6. Drivers de Dispositivo

- Contêm o **código específico** do dispositivo/controlador (registradores etc.).
- **Um driver por dispositivo** — cada versão tem o seu, e cada SO tem sua própria versão.
- Escritos pelo **fabricante** (ou por engenharia reversa).
- Fazem parte do **Kernel** e têm **acesso privilegiado** (afeta a confiabilidade do sistema).
- Interfaces padronizadas: drivers de **bloco** e de **caracteres**; suportam **carregamento dinâmico** (objetos compartilhados no Linux, DLL no Windows).
- **No Linux**: compila o código → insere na lista de módulos (`insmod`, `lsmod`, `rmmod`, `modinfo`) → dispositivo pronto.
- **Exemplos de funções**: aceitar leitura/escrita, verificar operabilidade, inicializar dispositivo, gerenciar energia, registrar logs.

---

## 7. Relógios (Temporizadores)

Essenciais em qualquer sistema multiprogramado: mantêm a hora e **evitam o monopólio da CPU**.

### Hardware
- **Relógios simples**: usavam a rede elétrica (50–60 Hz) — praticamente extintos.
- **Oscilador de cristal** (atual): gera sinal periódico de alta precisão; é um **contador regressivo** que dispara interrupção. Componentes: **oscilador de cristal, contador e registrador de apoio**.

### Software
- Como o hardware é só um contador regressivo, o resto é feito por software.
- **Funções**: manter horário, evitar que processos usem a CPU além do esperado, tratar chamadas de sistema e fornecer temporizadores.

---

## Pontos mais prováveis na prova
- Diferenciar **E/S Programada × Interrupções × DMA** (quem controla, polling, vantagens/desvantagens).
- Ordem das **4 camadas do software de E/S** e o que cada uma faz.
- Por que prioridade de interrupção segue **menor número = maior prioridade**.
- Papel e características dos **drivers** (parte do kernel, acesso privilegiado, um por dispositivo).
- **Relógio de oscilador de cristal**: 3 componentes e funções do software de relógio.
