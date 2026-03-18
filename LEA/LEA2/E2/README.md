- Movimentação de valor para registrador -

Nesta tarefa, você deverá escrever um código para inserir os seguintes valores, nos
seguintes registradores:

RAX = 42
RDI = 0x7777
R11 = 0xFEEDF00DC0CACAFE

Para isso, você pode utilizar a instrução MOV. O GAS (GNU Assembler) possui uma
sintaxe simplificada para a instrução MOV, e este inclusive irá substituir um
MOV escrito por MOVABS, no caso o valor do imediato (imm) esteja no intervalo
31 bits < imm < 64 bits.

Obs: a máquina possui instalado nasm, gcc, objdump, objcopy, sasm, etc. Porém é
sugerido que você primeiro escreva o código em sua máquina, teste e valide, para
somente depois conectar e submeter. Por último, caso precise verificar as
instruções de compilação e submissão, há um arquivo guia-asm.md na pasta /home.

Envie apenas o payload (código do segmento .text) em raw bytes:
