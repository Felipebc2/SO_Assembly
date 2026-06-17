D1. O endereço físico é a quantidade de RAM que você possui fisicamente, comumente chamado por Frame, já o Endereço Virtual é chamado de Pagina e aponta para o endereço físico (Os Frames). O MMU é uma parte física do hardware que basicamente é o orquestrador dos endereços, apontando as páginas aos frames conforme a necessidade. Os problemas que isso resolvem são: 1. Segurança, impedindo que os endereços se sobrescrevam durante os processos e/ou acessem a mesma parte da memória e 2. Realocação, caso seja necessário o MMU vai realocar a Pagina em um Frame diferente.

D2. Ambas solucionam um problema de RAM, de poder rodar processos maiores que sua RAM. O Swapping troca processos inteiros com o Swap-in e Swap-out, ele puxa um processo, roda por um tempo e depois tira ele e puxa outro. Já a Memória virtual é uma forma sofisticada do Swapping, onde ela pega partes dos processos (Paginas) e roda elas, conforme for acabando partes dos processos ela requer mais. Uma analogia é o Swapping sendo uma troca de quadros de um museu e a Memória Virtual montar um quebra-cabeça peça por peça. O Swap-in, como dito é quando o Swapping puxa um processo, e o Swap-out é quando ela larga o processo atual.

D3. O Bit R é constantemente limpo e verifica se o arquivo foi acessado e/ou lido recentemente, já o Bit M nunca é limpo e verifica se o arquivo foi modificado. Eles servem basicamente para o SO descobrir quais processos são melhores de substituir da memória, baseado no uso. O Bit M nunca é limpo pois ele não pode ser substituido até ser salvo, ou então, o processo perderá alterações.

D4. Journaling é um diário de eventos, onde, toda vez que o SO for realizar alguma ação ele anota no Diário a mesma. ACID é uma sigla para Atomicidade, Constância, Isolamento e Durabilidade, que é onde o Journaling se baseia. O Journaling ocasiona sobrecarga de escrita pois antes para realizar um processo bastava inicia-lo, agora ele deve escrever depois iniciar, dobrando o tempo de espera para iniciar o processo. O Journaling resolve problemas onde por exemplo o Wifi ou Luz caem e um processo seria corrompido, ao voltar para ele, o SO verifica o diário e dá um rollback ou continuidade.

---

01. B
02. A (Acho que é, não me lembro a nomeclatura exata dos E/S mas me lembro que estudamos 3)
03. B
04. B
05. B

---

P1. 512 KB = 2^10 (K) + 2^9 (512) = 2^19 = 19 Bytes
P2. Ainda não aprendi a fazer essa
P3. 
A) [3, 12, 6, 20, 4, 16]
B) [8, 12, 1, 20, 4, 16]
C) [8, 12, 6, 15, 4, 16]

P4. Não aprendi a fazer essa ainda