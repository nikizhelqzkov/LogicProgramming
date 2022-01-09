% Да се дефинира на пролог предикат p(L, M ),
% който по даден списък от числа L при преудовлетворяване
% генерира в M всички списъци, такива че:
%     1)множеството от елементите на M е подмножество на
% множеството от елементите на L;
%     2)за всеки елемент X на M съществува такъв елемент
% Y на M , че множеството { X − Y, X ∗ Y, X + Y } е
% подмножество на множеството от елементите на L.

len([],0).
len([_|T],N):- len(T,M), N is M+1.

between(A, B,A):- A =< B.
between(A,B,C):- A< B, A1 is A + 1 , between(A1, B, C).

append([],B,B).
append([H|T],B,[H|R]):- append(T,B,R).

insert(X,L,NewL):- append(A,B,L), append(A,[X|B],NewL).

permutation([],[]).
permutation([H|T],R):- permutation(T,L),insert(H,L,R).

pushed([_|_],0,M,M).
pushed([H|T],K,M,Temp):- K>0, K1 is K-1, append(Temp,[H],NewTemp), pushed(T,K1,M,NewTemp).

genList(L,M):- permutation(L,R), len(R,N), between(1,N,K), pushed(R,K,M,[]).

member(X,[X|_]).
member(X,[_|T]):- member(X,T).

% for all X in M exists Y in M and [X-Y,X*Y,X+Y] <= L
% not exist X in M , not (exists Y in M and  [X-Y,X*Y,X+Y] <= L)
condition(L,M):- not(( member(X,M), 
                 not(( member(Y,M),
                 XmY is X-Y, XumY is X*Y, XpY is X+Y,
                 genList(L,[XmY,XumY,XpY]) ))  )).
p(L,M):- genList(L,M), condition(L,M).
