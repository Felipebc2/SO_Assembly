D1: Page Fault é quando a página do endereço virtual não é encontrado na RAM, o SO, nesse caso busca no Disco a informação necessária. Um Soft Miss é quando o Buffer procura a informação, não a encontra e então procura na RAM e a encontra lá, um Hard Miss é quando um Buffer não encontra a informação nele nem na RAM, dando Page Fault e buscando a informação no Disco.

D2: Essa parte não vimos antes, mas eu acredito que Fragmentação tenha haver com Algoritmos de Substituição, provavelmente Framentação Interna é quando os nós de uma lista encadeada só tem valores baixos (Próximos de 1) após substituições de Best fit.

D3: TLB é um Buffer que age acima da RAM, ele guarda informações mais recentes, pois processos costumam ter alguns poucos programas que constantemente são chamados, então o buffer age ai para que esses programas que são chamados mais constantemente sejam achados mais rapidamente, acelerando a tradução, não tendo que buscar na RAM e no Disco a informação. (Não lembro do problema dos 2 acessos)

D4: A forma de E/s Programada tem Polling pois constantemente o programa está verificando o processo, tendo um alto custo de CPU. De interrupções ele espera alguma interrupção, não fica verificando constantemente, gastando menos cpu. E por ultimo de DMA ele age isoladamente da CPU cuidando dos processos E/s esperando interrupções, após a interrupção apenas informa a CPU, sendo pouquissimo gasto de CPU.

---

1.  lembro vagamente de ver nada disso, mas chutaria a opção C
2.  C
3.  A
4.  A (Eu acho)
5.  D

---

P1: A) 1GB = 2^30 x 2^0 = 30 Bits ; B) 8 KB = 2^10 x 2^3 = 2^13 ; 2^20 / 2^13 = 2^7 = 128 Bits

P2: 
A)
Página: 4
Offset: 18000 - (4 x 4096) = 1616
Físico: (1 x 4096) + 1616 = 5712

B) 
Página: 1
Offset: 5000 - (1 x 4096) = 904
Físico: Page Fault

Calculo
Página: VA / KT
Offset: VA - (Pag x KB)
Físico: (Frame x Bites) + Offset

(Acho que errei em algo aqui.)

P3: [14, 6, 22, 9, 30, 5]
A) [6, 6, 22, 9, 30, 5]
B) [14, 6, 22, 1, 30, 5] 
C) [14, 6, 22, 9, 22, 5]

P4: 
A) P0 = 0010 ; P1 = 1110 ; P2 = 0001 ; P3 = 1100
B) P2