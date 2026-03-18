====================- Entendendo o Ambiente de Submissão -=====================

Nesta atividade (e em outras envolvendo o uso de assembly), você deverá submeter
apenas o código do segmento .text. Após escrever a sua solução, compilar e gerar
o binário, para extrair apenas um segmento, você pode utilizar o utilitário
objcopy. Observe o exemplo abaixo:

$ objcopy --dump-section .text=solucao.bin binario.elf

Isso irá gerar um arquivo solucao.bin com o conteúdo do segmento .text. Como o
arquivo contém valores não legíveis (raw data), que você pode visualizar com o
comando (xxd solucao.bin), você pode redirecionar o conteúdo do arquivo
diretamente para a entrada deste programa, da seguinte forma:

$ cat solucao.bin | ./exercicio

No código que você deverá escrever, você deverá utilizar apenas o NOP, que é uma
instrução que faz nada. O objetivo é apenas executar algo o mais simples
possível para entender o ambiente de submissão. Um exemplo de solução é o
seguinte:

.intel_syntax noprefix
.global _start
.section .text
_start:
    NOP

Apesar da instrução estar em maiúsculo, hoje em dia não é mais um pré-requisito
para a maioria dos montadores. Ao resolver o exercício, você pode testar as
duas variações (NOP e nop) para ver se o montador rejeita alguma delas.

Obs 01: a máquina possui instalado nasm, gcc, objdump, objcopy, sasm, etc. Porém é
sugerido que você primeiro escreva o código em sua máquina, teste e valide, para
somente depois conectar e submeter. Por último, caso precise verificar as
instruções de compilação e submissão, há um arquivo guia-asm.md na pasta /home.

Obs 02: Se precisar relembrar algum comando de como montar e executar binários
em assembly, há um guia chamado guia-rapido-assembly.md na pasta home. Para ler
o guia, você pode utilizar o seguinte comando:

$ cd /home/idp/
$ cat guia-rapido-assembly.md

Envie apenas o payload (código do segmento .text) em raw bytes: