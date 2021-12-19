
/*
Зад. 1. Диаметър на списък наричаме разликата между броя срещания на най-често срещан
елемент на списъка и броя срещания на най-рядко срещан елемент на списъка. Да се дефинира
на Пролог едноместен предикат p, който по даден списък от списъци L разпознава дали:
всички елементи на L имат един и същ диаметър.
*/


repCount(_,[],0).
repCount(X,[X|T],N):- repCount(X,T,M), N is M+1.
repCount(X,[H|T],N):- H \= X, repCount(X,T,M).

maxCount(X,L,N):-not(( member(Y,L), repCount(Y,L,M) , M>N)).
minCount(X,L,N):-not(( member(Y,L), repCount(Y,L,M) , M<N)).

diameter(L,D):- member(X,L) , maxCount(X,D,Max) , member(Y,L), minCount(X,D,Min) , D is Max - Min.
remove(X, List, ResultList):- append(A, [X|B], List), append(A, B, ResultList).
p([]).
p([_]).
p(L):-remove(X,L,L1), diameter(X,DX), not((member(Y,L1), diameter(Y,DY), DX =\= DY)).