:-[mina].

/*Predicado para a incrementação de um valor N*/
incremento(N, I) :- I is N+1.

/*Predicado para verificar se posição está dentro do tabuleiro.*/
posicaoValida(X,Y):- tabuleiro(A), tabuleiro(B), X =< A, Y =< B.

/*Predicado para somar quantidade de minas nos vizinhos. Para cada vizinho verifica se o mesmo possui
 mina, se possuir incrementa o total e passa o mesmo para o próximo vizinho.
 Caso a posição possuir mina ou ultrapassar limites do tabuleiro irá retornar false.*/
totalMinasVizinhas(X,Y,Z):- not(mina(X,Y)), posicaoValida(X,Y), adj1(X,Y,Z1), adj2(X,Y,Z1,Z2), adj3(X,Y,Z2,Z3),
                            adj4(X,Y,Z3,Z4), adj5(X,Y,Z4,Z5), adj6(X,Y,Z5,Z6), adj7(X,Y,Z6,Z7), adj8(X,Y,Z7,Z).

/*Predicados para verificação de mina em todos os vizinhos da posição (X,Y).
Para cada um dos 8 vizinhos possíveis verifica se há mina na posição. Se houver soma 1
ao total de minas (W). Se não houver apenas retorna o total de minas.
O primeiro vizinho a ser visitado possui um total de minhas igual a zero. Por isso não passamos W
como parâmetro.*/
adj1(X,Y,Z):- A is X+1,B is Y, mina(A,B), Z is 1.
adj1(_,_,Z):- Z is 0.
adj2(X,Y,W,Z):-A is X+1,B is Y+1, mina(A,B), Z is W+1.
adj2(_,_,W,Z):- Z is W.
adj3(X,Y,W,Z):-A is X,B is Y+1, mina(A,B), Z is W+1.
adj3(_,_,W,Z):- Z is W.
adj4(X,Y,W,Z):-A is X-1,B is Y+1, mina(A,B), Z is W+1.
adj4(_,_,W,Z):- Z is W.
adj5(X,Y,W,Z):-A is X-1,B is Y, mina(A,B), Z is W+1.
adj5(_,_,W,Z):- Z is W.
adj6(X,Y,W,Z):-A is X-1,B is Y-1, mina(A,B), Z is W+1.
adj6(_,_,W,Z):- Z is W.
adj7(X,Y,W,Z):-A is X,B is Y-1, mina(A,B), Z is W+1.
adj7(_,_,W,Z):- Z is W.
adj8(X,Y,W,Z):-A is X+1,B is Y-1, mina(A,B), Z is W+1.
adj8(_,_,W,Z):- Z is W.

/*Predicado que cria o arquivo ambiente.pl para a escrita*/
criarAmbiente :- open('ambiente.pl',write, Stream), close(Stream).

/*Predicados que escrevem no arquivo ambiente.pl os valores de cada posição sem mina.
Começando na posição 1,1 iteramos o tabuleiro pelas linhas, caso a posição não tenha mina
escrevemos no arquivo, senão passamos para a próxima posição (peça da direita) e testamos
novamente. Ao chegar no fim de uma linha - quando o valor da coluna é tamanho do tabuleiro
passado no arquivo mina.pl + 1 - pulamos para a próxima linha. Quando chegarmos no fim
do tabuleiro - posicao tamanho + 1, tamanho + 1, que está fora do tabuleiro - terminamos a recursão*/
popularAmbiente :- L is 1, C is 1, popularAmbiente(L, C).
popularAmbiente(L, C) :- T is C - 1, not(tabuleiro(T)), totalMinasVizinhas(L, C, Z), open('ambiente.pl',append, Stream), nl(Stream),
                         write(Stream, 'valor('), write(Stream, L), write(Stream, ','), write(Stream, C),
                         write(Stream, ','), write(Stream, Z), write(Stream, '). '), close(Stream),
                         incremento(C, NC), popularAmbiente(L, NC).
popularAmbiente(L, C) :- T is C - 1, tabuleiro(T), NC is 1, incremento(L, NL),
                         open('ambiente.pl',append, Stream), nl(Stream), close(Stream),
                         popularAmbiente(NL, NC).
popularAmbiente(L, C) :- mina(L, C), incremento(C, NC), popularAmbiente(L, NC).
popularAmbiente(_, _).

/*Predicado a ser chamado no inicio do programa. Chama o predicado que cria o ambiente
e o predicado que o popula.*/
inicio :- criarAmbiente, popularAmbiente.
