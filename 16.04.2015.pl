% Зад. 1. За произволен списък [a1, a2, . . . , ak ] ще казваме, че
% списъците от вида [am, am+1, . . . , am+i], където 1 5 m 5 k и
% 0 5 m 5 k − m, са негови подспицъци. Да се дефинира пре-
% дикат p(X, Y, Z), който по дадени списъци X и Y генерира
% всички подсписъци Z на Y , такива че дължината на Z е
% колкото дължината на X, всеки елемент на Z е по-голям от
% елемента, намиращ се на същата позиция в X и последните
% елементи на Z и Y са равни.


between(A,B,A):- A =< B.
between(A,B,C):- A< B, A1 is A + 1 , between(A1, B, C).
len([],0).
len([_|T],N):- len(T,M), N is M + 1.
indexOfList([H|_],0,H).
indexOfList([_|T],K,H):-indexOfList(T,K1,H),K is K1+1.
append([],B,B).
append([H|T],B,[H|R]):- append(T,B,R).
subList([_|_],0,0,List,List).
subList([_|T],S,K,List,Rest):-S>0,S1 is S-1, subList(T,S1,K,List,Rest).
subList([H|T],0,K,List,Rest):- K>0, K1 is K-1, append(Rest,[H],NewRest), subList(T,0,K1,List,NewRest).
genSubL1(X,L):- len(X,N),between(1,N,K),between(0,K,S),  subList(X,S,K,L,[]). 
condition(X,Z):-not(( indexOfList(X,K,XK), indexOfList(Z,K,ZK), ZK=<XK  )).
condition2(Y,Z,NZ):- len(Y,NY),NZ1 is NZ-1, NY1 is NY-1,
        indexOfList(Z,NZ1,NZEl), indexOfList(Y,NY1,NYEl), NZEl=:=NYEl.
p(X,Y,Z):-genSubL1(Y,Z), len(X,NX), len(Z,NZ), NZ=:=NX, condition(X,Z),condition2(Y,Z,NZ).


% Зад. 2. Да се дефинира предикат p(X, Y ), който по даден
% списък X генерира в Y всички списъци, чиито елементи са
% елементи на X и броят на срещанията на най-често среща-
% ния елемент в Y е число, което не е елемент на X

maxElement([],N,N).
maxElement([H|T],Elem,Temp):-H>Temp, maxElement(T,Elem,H).
maxElement([H|T],Elem,Temp):-H=<Temp, maxElement(T,Elem,Temp).
insert(X,L,RL):-append(A,B,L),append(A,[X|B],RL).
permutation([],[]).
permutation([H|T],RL):-permutation(T,L), insert(H,L,RL).
isSorted([_]).
isSorted([H1,H2|T]):-H1<H2, isSorted([H2|T]).

filter(LOld):-permutation(LOld,LP), isSorted(LP), maxRepeated(LP,(_,KCount)), not(member(KCount,LOld)).

modify([],X,[(X,1)]).
modify([(X,Y)|Xs],X,[(X,K)|Xs]):- K is Y+1.
modify([(Z,Y)|Xs],X,[(Z,Y)|K]):- Z =\= X, modify(Xs,X,K).

highest((X1,Y1),(_,Y2),(X1,Y1)):- Y1 >= Y2.
highest((_,Y1),(X2,Y2),(X2,Y2)):- Y2 > Y1.

maxR([X],X).
maxR([X|Xs],K):- maxR(Xs,Z),highest(X,Z,K).

rep([],R,R).
rep([X|Xs],R,R1):-modify(R,X,R2),rep(Xs,R2,R1).

maxRepeated(X,R):- rep(X,[],K),maxR(K,R).

                                                
p(X, Y):-len(X,N),between(1,N,K),between(0,K,S),  subList(X,S,K,Y,[]), filter(Y). 

%  maxRepElemCount(LP,C,K) Броя на повторенията на Елемента С
%  maxRepElemCount(LP,C,K)
