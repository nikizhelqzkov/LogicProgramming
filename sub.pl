between(A,B,A):- A=<B.
between(A,B,C):- A<B, A1 is A+1, between(A1,B,C).

len(0,[]).
len(N,[_|T]):- len(N1,T), N is N1+1.


append([],B,B).
append([H|T],B,[H|R]):- append(T,B,R).

insert(X,L,NewL):- append(A,B,L), append(A,[X|B],NewL).

perm([],[]).
perm([H|T],R):- perm(T,M), insert(H,M,R).

getElementsWithLenOfK([],0,L,L).
getElementsWithLenOfK([_],0,L,L).
getElementsWithLenOfK([_|_],0,L,L).
getElementsWithLenOfK([H|T],K,L,Temp):- K>0, K1 is K-1, 
                                        append(Temp,[H],NewTemp), 
                                        getElementsWithLenOfK(T,K1,L,NewTemp).

mem(X,[X|_]).
mem(X,[_|T]):- mem(X,T).
genAllVariants(L,M):- perm(L,L1), len(N,L), between(1,N,K), getElementsWithLenOfK(L1,K,M,[]).
p(L,M):- genAllVariants(L,M), not((mem(X,M), mem(Y,M), 
         not((  XmY is X-Y,XpY is X*Y, XPlY is X+Y,  L1 = [XmY,XpY,XPlY] , 
         genAllVariants(L,L1)   ))   )).


