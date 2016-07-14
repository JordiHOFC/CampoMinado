mine(3,3).
mine(1,1).
mine(1,3).

/*Predicados que definem dimensões do tabuleiro.*/
totalLinhas(Z):- Z is 5.
totalColunas(Z):- Z is 5.

/*Predicado para verificar se posição está dentro do tabuleiro.*/
posicaoValida(X,Y):- totalLinhas(A), totalColunas(B), X < A, Y < B. 

/*Predicado para somar quantidade de minas nos vizinhos. Para cada vizinho verifica se o mesmo possui 
 * mina, se possuir incrementa o total e passa o mesmo para o próximo vizinho.
 Caso a posição possuir mina ou ultrapassar limites do tabuleiro irá retornar false.*/
totalMinasVizinhas(X,Y,Z):- not(mine(X,Y)), posicaoValida(X,Y), adj1(X,Y,Z1), adj2(X,Y,Z1,Z2), adj3(X,Y,Z2,Z3), adj4(X,Y,Z3,Z4), adj5(X,Y,Z4,Z5), adj6(X,Y,Z5,Z6), adj7(X,Y,Z6,Z7), adj8(X,Y,Z7,Z).

/*Predicados para verificação de mina em todos os vizinhos da posição (X,Y).
Para cada um dos 8 vizinhos possíveis verifica se há mina na posição. Se houver soma 1
ao total de minas (W). Se não houver apenas retorna o total de minas.
O primeiro vizinho a ser visitado possui um total de minhas igual a zero. Por isso não passamos W
como parâmetro.*/
adj1(X,Y,Z):- A is X+1,B is Y, mine(A,B), Z is 1.
adj1(_,_,Z):- Z is 0.
adj2(X,Y,W,Z):-A is X+1,B is Y+1, mine(A,B), Z is W+1.
adj2(_,_,W,Z):- Z is W.
adj3(X,Y,W,Z):-A is X,B is Y+1, mine(A,B), Z is W+1.
adj3(_,_,W,Z):- Z is W.
adj4(X,Y,W,Z):-A is X-1,B is Y+1, mine(A,B), Z is W+1.
adj4(_,_,W,Z):- Z is W.
adj5(X,Y,W,Z):-A is X-1,B is Y, mine(A,B), Z is W+1.
adj5(_,_,W,Z):- Z is W.
adj6(X,Y,W,Z):-A is X-1,B is Y-1, mine(A,B), Z is W+1.
adj6(_,_,W,Z):- Z is W.
adj7(X,Y,W,Z):-A is X,B is Y-1, mine(A,B), Z is W+1.
adj7(_,_,W,Z):- Z is W.
adj8(X,Y,W,Z):-A is X+1,B is Y-1, mine(A,B), Z is W+1.
adj8(_,_,W,Z):- Z is W.

