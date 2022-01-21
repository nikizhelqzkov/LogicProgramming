% Зад. 1. Да се дефинира предикат p(L, N ), който по
% даден списък от положителни цели числа L и поло-
% жително цяло число N разпознава дали N може да се
% представи като произведение на няколко (не непремен-
% но различни) елемента на L.

between(A,B,A):- A =< B.
between(A,B,C):-A< B, A1 is A + 1 , between(A1, B, C).
genKP(0,1,[]).
genKP(K,P,[H|T]):- K>0, K1 is K-1,between(1,P,H),P mod H =:=0, P1 is P div H,  genKP(K1,P1,T).
subsequence([],[]).
subsequence([_|T], R):- subsequence(T,R).
subsequence([H|T], [H|R]):- subsequence(T,R).
len([],0).
len([_|T],N):- len(T,M), N is M+1.
p(L,N):- subsequence(L,LSub), len(LSub,LenLSub), genKP(LenLSub,N,LSub).


% Зад. 2. Списък от три числа [X, Y, R] ще интерпрети-
% раме като окръжност с център 〈X, Y 〉 и радиус R. Да
% се дефинира генератор circles(X, Y, R, Z, T, S), който по
% дадена окръжност [X, Y, R] при преудовлетворяване ге-
% нерира в Z, T и S окръжностите, които съдържат ок-
% ръжността [X, Y, R].

% yN+RN >Y+R
% yN-RN <Y-R
% xN-RN <X-R
% xN+RN >X+R
% (XN-X)^2 + (YN-Y)^2 <=RN^2
nat(1).
nat(N):- nat(M) , N is M+1.
genKS(0,1,[]).
genKS(K,S,[H|T]):- K>0, K1 is K-1,MS is -S,between(MS,S,H), S1 is S - H,  genKS(K1,S1,T).
condition(X,Y,R,XN,YN,RN):- XN-RN < X-R, XN+RN > X+R, YN-RN < Y-R, YN+RN > Y+R,  (XN-X)^2 + (YN-Y)^2 =< RN^2.
circles(X,Y,R,Z,T,S):-nat(S),genKS(3,S,[Z,T,_]),condition(X,Y,R,Z,T,S).