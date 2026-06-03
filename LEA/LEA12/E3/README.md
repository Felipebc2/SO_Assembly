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

Nesta atividade, você receberá um layout de páginas-frames, e deverá calcular
o endereço real, a partir de um endereço virtual.

aluno@795391bb713b:~$

[+] Tamanho da página/frame: 4KB
[+] Número de Páginas: 12 | Número de Frames: 8

TABELA DE PÁGINAS
+--------------------+---------+
|  Endereço Virtual  |  Frame  |
+====================+=========+
|      44K-47K       |    7    |
+--------------------+---------+
|      40K-43K       |    2    |
+--------------------+---------+
|      36K-39K       |    X    |
+--------------------+---------+
|      32K-35K       |    X    |
+--------------------+---------+
|      28K-31K       |    0    |
+--------------------+---------+
|      24K-27K       |    5    |
+--------------------+---------+
|      20K-23K       |    X    |
+--------------------+---------+
|      16K-19K       |    X    |
+--------------------+---------+
|      12K-15K       |    X    |
+--------------------+---------+
|       8K-11K       |    3    |
+--------------------+---------+
|       4K-7K        |    6    |
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

[?] Dado o endereço virtual 5597, qual o endereço físico correspondente?
