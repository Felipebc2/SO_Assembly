- Uso complexo de registradores

Nesta atividade, você deverá calcular o seguinte:

f(x) = mx + b,      onde:

    m = r9
    x = rdx
    b = r11 

E o resultado deverá ser armazenado no registrador rax.
    
Observação importante: existe uma diferença importante entre mul (multiplicação
sem sinal) e imul (multiplicação com sinal) em termos de quais registradores são
utilizados. Qualquer dúvida, consulte a documentação sobre essas instruções para
ver as diferenças. Além disso, lembre-se de não modificar os valores iniciais dos
registradores (qualquer outro registrador pode ser utilizado para cálculos
intermediários).


Valores inicializados:
    -   r9:       0x70be
    -  rdx:       0x7318
    -  r11:       0xef5e

Envie apenas o payload (código do segmento .text) em raw bytes:
 