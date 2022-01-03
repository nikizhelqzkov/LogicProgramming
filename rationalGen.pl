nat(1).
nat(N):- nat(M), N is M+1.
betweenRat(A,B,A):-A<B.
betweenRat(A,B,C):-A<B, A1 is A+1 , between(A1,B,C).
% genKS(K,S,Elem)
genKS(0,0,[]).
genKS(K,S,[H|T]):-K>0,between(1,S,H), K1 is K-1,  SRest is S-H, genKS(K1,SRest,T).

gen(A,B,C,D):-nat(B), B>A,between(C,B,D), D>C.

p(A,M,N,K,L):- nat(N), genKS(3,A,[K,M,_]), N>M,  betweenRat(1,K,L), N mod M =\=0, K mod L =\=0, (M*K)/(N*L) =:=2.

