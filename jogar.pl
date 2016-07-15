:- dynamic valor/3.
:- [ambiente], [mina].

perder :- write('Jogo Encerrado'), open('saida.pl', append,Stream),
          nl(Stream), write(Stream, 'Jogo Encerrado'), nl(Stream), close(Stream).

salvarJogada(X, Y) :- open('saida.pl', append,Stream), nl(Stream), write(Stream, '/*JOGADA*/'), nl(Stream),
                      write(Stream, 'posicao('), write(Stream, X), write(Stream, ','),
                      write(Stream, Y), write(Stream,').'), nl(Stream),
                      write(Stream, '/*AMBIENTE*/'), close(Stream).

salvarPosicao(X, Y, Z) :- concat('valor(', X, VALORX), concat(VALORX, ', ', VALOR),
                                     concat(VALOR, Y, VALORY), concat(VALORY, ', ', VALORVIRGULA),
                                     concat(VALORVIRGULA, Z, VALORZ), concat(VALORZ, ').', VALORFINAL),
                                     write(VALORFINAL), open('saida.pl', append,Stream),
                                     nl(Stream), write(Stream, VALORFINAL), nl(Stream), close(Stream).

salvarArquivo :- get_time(TIME), stamp_date_time(TIME, DATE, 'local'),
                 format_time(atom(ATOM), '%d-%b-%T',DATE, posix), concat('saida.pl-', ATOM, NAME),
                 rename_file('saida.pl', NAME), open('saida.pl', write ,Stream), close(Stream).

checarAjacentes(X, Y) :- valor(X, Y, Z), salvarPosicao(X, Y, Z), retract(valor(X,Y,Z)).

posicao(X, Y) :- valor(X, Y, _), salvarJogada(X, Y), checarAjacentes(X, Y).
posicao(X, Y) :- mina(X, Y), salvarJogada(X, Y), perder, salvarArquivo.
