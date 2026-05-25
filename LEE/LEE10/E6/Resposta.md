python3 -c "
import sys
sys.stdout.buffer.write(
    b'5\n0\n'           # carregar → índice 0
    b'2\n0\n'           # liberar  → índice 0
    b'1\n1\n48\n'       # alocar   → índice 1, tamanho 48
    b'3\n1\n32\n'       # ler      → índice 1, 32 bytes
    b'A resposta para a atividade eh: '  # 32 bytes exatos de prefixo
    b'4\n1\n'           # escrever → índice 1
    b'0\n'              # sair
)
" | ./exercicio
