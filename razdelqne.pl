member(X,[X|_]).
member(X,[_|T]):-member(X,T).

between(A,B,A):- A=<B.
between(A,B,C):- A<B, A1 is A+1, between(A1,B,C).

genKS(0,0,[]).
genKS(K,S,[H|T]):- K>0, between(0,S,H) , K1 is K-1, S1 is S-H, genKS(K1,S1,T).

cp([],[]).
cp([H|T],[Ai|R]):- member(Ai,H), cp(T,R).

nat(0).
nat(N):- nat(M), N is M+1.

len([],0).
len([_|T],N):- len(T,M), N is M+1.

append([],B,B).
append([H|T],B,[H|R]):- append(T,B,R).

insert(X,L,NewL):- append(A,B,L), append(A,[X|B],NewL).

perm([],[]).
perm([H|T],R):- perm(T,L), insert(H,L,R).


isPrime(2).
isPrime(N):- isPrime(N,N-1).
isPrime(N,M):- M>1, N mod M =\= 0, M1 is M-1, isPrime(N,M1).
isPrime(_,1).

genSimpleDevisors(N,N,T,T).
genSimpleDevisors(N,M,T,Temp):- M<N , N mod M =:= 0, isPrime(M), 
                            M1 is M+1 ,append(Temp,[M],NewTemp), 
                            genSimpleDevisors(N,M1,T,NewTemp).

genSimpleDevisors(N,M,T,Temp):-M<N, not(isPrime(M)), M1 is M+1, 
                               genSimpleDevisors(N,M1,T,Temp).
genSimpleDevisors(N,M,T,Temp):-M<N, isPrime(M), N mod M =\= 0, M1 is M+1, 
                               genSimpleDevisors(N,M1,T,Temp).

genSimpleDevisors(N,L):- genSimpleDevisors(N,2,L,[]).

inters(A,B,X):- member(A,X), member(B,X). 


hasEqualSDev(A,B):- genSimpleDevisors(A,LA), genSimpleDevisors(B,LB),
                    len(LA,NA), len(LB,NB), NA=:=NB,
                    not(inters(LA,LB,[])). 












