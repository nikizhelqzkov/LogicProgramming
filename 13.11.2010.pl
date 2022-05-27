% Задача 1 Да се дефинира на пролог предикат p(X, Y ),
% който по даден списък X от списъци от числа намира та-
% къв елемент Y на X, че Y не съдържа по-голям елемент от
% най-големите елементи на елементите на X, и никой еле-
% мент на X, притежаващ същото свойство, не е с повече
% елементи от Y .

%exist Y and for each X maxOfY <= maxOfX
member(X,[X|_]).
member(X,[_|T]):-member(X,T).

append([],B,B).
append([H|T],B,[H|R]):- append(T,B,R).

insert(X,L,NewL):- append(A,B,L), append(A,[X|B],NewL).

perm([],[]).
perm([H|T],R):-perm(T,R1), insert(H,R1,R).

isSorted([_]).
isSorted([H1,H2|T]):-H1>=H2, isSorted([H2|T]).

sortList([_],[_]).
sortList(L,SL):- perm(L,SL), isSorted(SL).

maxElementOnSortedList([H],H).
maxElementOnSortedList([H|_],H).
getMaxElement(L,X):- sortList(L,SL), maxElementOnSortedList(SL,X).

conditionFirst(X,Y):- member(Y,X), getMaxElement(Y,YMax), 
                    not((member(Z,X), getMaxElement(Z,ZMax), ZMax<YMax)).

len([],0).
len([_|T],N):-len(T,N1), N is N1+1.

conditionSecond(X,Y):- member(Z,X), conditionFirst(X,Z),
                       len(Y,NY),len(Z,NZ), NZ =< NY.

p(X,Y):- conditionFirst(X,Y), conditionSecond(X,Y).


% Задача 2. Да се дефинира на пролог предикат
% p(A, M/N, K/L), който по дадено естествено число A ге-
% нерира всички възможни рационални дроби M/N и K/L,
% такива че N > M > 0, K > L > 0, (M/N ).(K/L) = 2 и
% M + K < A.

nat(1).
nat(N):- nat(M), N is M+1.
betweenRat(A,B,A):-A<B.
betweenRat(A,B,C):-A<B, A1 is A+1 , between(A1,B,C).
% genKS(K,S,Elem)
genKS(0,0,[]).
genKS(K,S,[H|T]):-K>0,between(1,S,H), K1 is K-1,  SRest is S-H, genKS(K1,SRest,T).

% gen(A,B,C,D):-nat(B), B>A,between(C,B,D), D>C.

p(A,M,N,K,L):- nat(N), genKS(3,A,[K,M,_]), N>M,  betweenRat(1,K,L), N mod M =\=0, K mod L =\=0, (M*K)/(N*L) =:=2.

