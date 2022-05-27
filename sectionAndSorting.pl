append([],B,B).
append([H|T],B,[H|R]):- append(T,B,R).

insert(X,L,NewL):- append(A,B,L),append(A,[X|B],NewL).

permute([],[]).
permute([H|T],R):- permute(T,R1), insert(H,R1,R).

isSorting([_]).
isSorting([H1,H2|T]):- H1=<H2, isSorting([H2|T]).

sortList(L,SL):- permute(L,SL), isSorting(SL).

between(A,B,A):- A =< B.
between(A,B,C):- A<B, A1 is A+1 , between(A1,B,C).

len([],0).
len([_|T],N):- len(T,M), N is M+1.

getKElements(_,0,R,R).
getKElements([H|T],K,R,Temp):- K>0, K1 is K-1, append(Temp,[H],NewTemp),
                               getKElements(T,K1,R,NewTemp).

getKElements(L,K,R):- getKElements(L,K,R,[]).
getElements(L,R):-len(L,N), permute(L,PL), between(1,N,K), getKElements(PL,K,PKL), sortList(PKL,R). 