/*
6.IV.2013 г.
Задача 2. Казваме, че списък X мажорира списък Y , ако
всички елементи на X са елементи на Y . Да се дефинира
на пролог предикат q3(L,M), който по даден списък от спи-
съци L намира списък M, който съдържа всички елементи
на L и в който никой елемент не се мажорира от елемент,
намиращ се след него в списъка.
*/
insert(X,L,RL):-append(A,B,L),append(A,[X|B],RL).
permutation([],[]).
permutation([H|T],R):-permutation(T,Q),insert(H,Q,R).
isSubset(A, B):- not(( member(X, A), not(member(X,B)) )).

% Solution:

maj(X,Y):- isSubset(X,Y).

toSet([],[]).
toSet([H|T],[H|R]):- toSet(T,R), not(member(H,R)).
toSet([H|T],R):- toSet(T,R), member(H,R).

q3(L,M):- toSet(L,L1), permutation(L1,M),
          not((append(_,[X|T],M), member(Y,T), maj(Y,X) )).