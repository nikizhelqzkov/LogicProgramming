% Зад. 1. Да се дефинира предикат p(N, K), който по дадено
% естествено число N намира в K най-малкия прост делител
% на N .
% Да се дефинира и предикат q(N, X), който по дадено естест-
% вено число N намира в X списък от всички прости делители
% на N , подредени във възходящ ред.

between(A,B,A):- A =< B.
between(A,B,C):- A< B, A1 is A + 1 , between(A1, B, C).

isDelitel(A,B):- A mod B =:= 0.
isPrime(2).
isPrime(N):-N=\=2, N1 is N-1, not((between(2,N1,K), isDelitel(N,K))). 
p(N,K):- between(2,N,K), isPrime(K),!.
append([],B,B).
append([H|T],B,[H|R]):- append(T,B,R).
% qHelper(N,X,Temp)
% qHelper(N,X,X,N1):-N1 is N-1.
% qHelper(N,X,Rest,K):-K<N, between(K,N,XI), isPrime(XI),
%                       append(Rest,[XI],NewRest), K1 is K+1, qHelper(N,X,NewRest,K1).
qHelper(N,X,X,N).
qHelper(N,X,Rest,K):-not(isPrime(K)),K1 is K+1, qHelper(N,X,Rest,K1).
qHelper(N,X,Rest,K):- isPrime(K),not(isDelitel(N,K)),
                      K1 is K+1, qHelper(N,X,Rest,K1).
qHelper(N,X,Rest,K):- isPrime(K), isDelitel(N,K),
                      append(Rest,[K],NewRest), K1 is K+1, qHelper(N,X,NewRest,K1).
q(N,X):-qHelper(N,X,[],2).                      




% Зад. 2. Да се дефинират предикати p(X), q(X) и r(X), та-
% кива че ако X е списък от списъци, то
% p(X) ⇐⇒ два от елементите на някой елемент на X са
% равни на 5.
% q(X) ⇐⇒ всеки два елемента на X имат поне три различ-
% ни общи елемента.
% r(X) ⇐⇒ съществува такова ненулево естествено число n,
% че X съдържа n различни по между си елемен-
% ти, всеки от които има не повече от 2n елемента

member(X,[X|_]).
member(X,[_|T]):- member(X,T).
p([H|_]):-member(X,H),member(Y,H), indexOfList(H,K1,X), indexOfList(H,K2,Y),K1=\=K2, X=:=5, X=:=Y,!. 
p([_|T]):-p(T).
len([],0).
len([_|A],K):-len(A,K1) , K is K1 + 1.
indexOfList([H|_],0,H).
indexOfList([_|T],K,Elem):-indexOfList(T,K1,Elem), K is K1+1.
intersection([],_,Z,Z).
intersection([H|T],Y,Z,Rest):- member(H,Y), append(Rest,[H],NewRest), intersection(T,Y,Z,NewRest).
intersection([H|T],Y,Z,Rest):- not(member(H,Y)),intersection(T,Y,Z,Rest).
intersection(X,Y,Z):-intersection(X,Y,Z,[]).
%for all 2 elements in X and have intersection = 3
%not exist 2 elements in X and not have intersection = 3
insert(X,L,RL):-append(A,B,L),append(A,[X|B],RL).
permutation([],[]).
permutation([H|T],R):-permutation(T,L), insert(H,L,R).
isSorted([_]).
isSorted([H1,H2|T]):- H1=<H2 ,isSorted([H2|T]).

filter([H],Filtered,Rest):-append(Rest,[H],Filtered).
filter([H1,H2|T],Filtered,Rest):- H1=\=H2 , append(Rest,[H1],NewRest), filter([H2|T],Filtered,NewRest).
filter([H1,H2|T],Filtered,Rest):- H1=:=H2 , filter([H2|T],Filtered,Rest).
 
q(X):- not((member(X1,X), member(X2,X), not((intersection(X1,X2,XI),permutation(XI,PXI),
                                        isSorted(PXI),filter(PXI,IntXI,[]), len(IntXI,K), K>=3   ))    )).

r(X):- len(X,N), N>0, rCond(X,N).
rCond([],_).
rCond([H|T],N):- len(H,N2), 2*N>=N2, rCond(T,N).
