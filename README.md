# CampoMinado
Trabalho final da disciplina Inteligência Artificial do período 2016-1.

# Integrantes
  Carlos Eduardo da Silva Martins - 112207863
  
  Patricia Santos Ghiraldelli - 112190951
  
  Paloma Guenes Costa - 112221354 

# Como jogar
O tabuleiro possui 5 linhas e 5 colunas, as posições com minas do arquivo mina.pl
não devem ultrapassar esses valores.

1. Abra o terminal do swi-prolog no mesmo diretório onde estão os arquivos.

  - No linux: $ swipl
  
2. Carregue o arquivo de geração do tabuleiro.

  - ?- [gerar].
  
3. Chame o predicado "inicio" para criar o tabuleiro. O arquivo mina.pl com as posições das minas 
deve estar no mesmo diretório. Isso criará um arquivo chamado ambiente.pl com as posições sem mina
e seus respectivos valores de minas adjacentes.

  - ?- inicio.
  
4. Carregue o arquivo de jogo.

  - ?- [jogar].
  
5. Faça suas jogadas onde x e y são as coordenadas da posição que deseja abrir. Enquanto o jogo não
termina o arquivo saida.pl será usado. Ao término do jogo será criado um novo arquivo com o mesmo conteúdo
de saida.pl, porém com nome contendo o dia e a hora da execução.

  - ?- posicao(x, y).
  
  - ...

