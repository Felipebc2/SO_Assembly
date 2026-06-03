# Descrição

Em sistemas de computação modernos, a memória virtual é uma abstração que
permite que cada processo pense que possui toda a memória para si, mesmo que,
fisicamente, essa memória seja limitada e compartilhada com outros processos.

Para organizar esse gerenciamento, tanto a memória virtual quanto a memória
física são divididas em blocos de tamanho fixo:

Página: é um bloco de memória virtual.

Frame (ou quadro): é um bloco de memória física.

Quando um processo acessa um endereço na sua memória virtual, o sistema
operacional faz a conversão para um endereço físico, localizando em qual frame a
página correspondente está armazenada.

Caso a página ainda não esteja carregada na memória física, ocorre um page
fault, e o sistema deve buscá-la no armazenamento secundário (como o disco).

Nesta atividade, você receberá um layout de páginas-frames, e deverá responder o
frame correspondente à página escolhida. Em caso de page fault, responda com -1.

aluno@36dd75ec993a:/desafio$ ./exercicio
[+] Tamanho da página/frame: 4KB
[+] Número de Páginas: 12 | Número de Frames: 8

TABELA DE PÁGINAS
+--------------------+---------+
|  Endereço Virtual  |  Frame  |
+====================+=========+
|      44K-47K       |    X    |
+--------------------+---------+
|      40K-43K       |    0    |
+--------------------+---------+
|      36K-39K       |    4    |
+--------------------+---------+
|      32K-35K       |    5    |
+--------------------+---------+
|      28K-31K       |    1    |
+--------------------+---------+
|      24K-27K       |    2    |
+--------------------+---------+
|      20K-23K       |    7    |
+--------------------+---------+
|      16K-19K       |    3    |
+--------------------+---------+
|      12K-15K       |    6    |
+--------------------+---------+
|       8K-11K       |    X    |
+--------------------+---------+
|       4K-7K        |    X    |
+--------------------+---------+
|       0K-3K        |    X    |
+--------------------+---------+

==================================================

TABELA DE FRAMES
+---------+-------------------+
|   Frame |  Endereço Físico  |
+=========+===================+
|       7 |      28K-31K      |
+---------+-------------------+
|       6 |      24K-27K      |
+---------+-------------------+
|       5 |      20K-23K      |
+---------+-------------------+
|       4 |      16K-19K      |
+---------+-------------------+
|       3 |      12K-15K      |
+---------+-------------------+
|       2 |      8K-11K       |
+---------+-------------------+
|       1 |       4K-7K       |
+---------+-------------------+
|       0 |       0K-3K       |
+---------+-------------------+

==================================================

[?] Dada a página 11, qual o frame físico correspondente?
