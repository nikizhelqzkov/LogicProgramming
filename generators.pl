natural(0).
natural(X):- natural(Y), X is Y+1.

% 1. Генератор на числата кратни на дадено ест число M
kratenGen(K,M):- natural(K), M>0, K mod M =:= 0.

% 2. Краен генератор на цели числа в интервала [A,B], чрез преудовлетворяване, както и като списък с резултатите
% between(A, B, X).
between(A, B, A):- A =< B.
between(A, B, C):- A < B, A1 is A + 1, between(A1, B, C).

% range(A, B, L).
range(A,B,[]):- A>B.
range(A,B,[A|Rest]):- A=<B , A1 is A+1 , range(A1,B,Rest).

% 3. Генератор на двойки числа
pairs(X,Y):- natural(K), between(0,K,X), Y is K-X.

% 4. Генератор на K числа със сума S: x_1 + x_2 + ... + x_k = S, x_i >=0
generateKNumbersWithSumS(0,0,[]).
generateKNumbersWithSumS(K,S,[XI|Rest]):- K>0 , K1 is K-1, between(0,S,XI), S1 is S-XI , generateKNumbersWithSumS(K1,S1,Rest).

% 5. Генератор на всички крайни редици от естествени числа (изброимо много).
generateAllFiniteSequencesOfNaturalNumbers(L):- pairs(X,S), generateKNumbersWithSumS(K,S,L).