min([],Min,Min).
min([H|T],Min,Temp):- H<Temp, min(T,Min,H).
min([H|T],Min,Temp):- H>=Temp, min(T,Min,Temp).
min([H|T],Min):-min([H|T],Min,H).

hasSameDel([],_).
hasSameDel([H|T],N):-H mod N =:=0 , hasSameDel(T,N).
hasBiggestDel(L,N,N):- N>1, hasSameDel(L,N).
hasBiggestDel(L,N,M):- M>1, not(hasSameDel(L,M)), M1 is M-1, hasBiggestDel(L,N,M1).
hasBiggestDel(_,1,1).
nod(L,N):- min(L,M), hasBiggestDel(L,N,M).
append([],B,B).
append([H|T],B,[H|R]):- append(T,B,R).
subsequence([],[]).
subsequence([_|T], R):- subsequence(T,R).
subsequence([H|T], [H|R]):- subsequence(T,R).
len([],0).
len([_|T],N):- len(T,M), N is M+1.
nSub(L,N,NL):- subsequence(L,NL), len(NL,N).
hasDifNODS(A,B):- nod(A,AN), nod(B,BN), AN=\=BN.
p(L,N):- len(L,NL), N<NL, nSub(L,N,AN),N1 is N-1,  not(( nSub(L,N1,BN), not(hasDifNODS(AN,BN))  )).


%-----------------------ex2

member(X,[X|_]).
member(X,[_|T]):- member(X,T).
remove(X, List, ResultList):- append(A, [X|B], List), append(A, B, ResultList).
p2(A,B):- not((remove(X,A,A1), remove(Y,A1,_), S is X+Y , not(member(S,B)) )).
q(L,S):- genL(L,S), len(S,SN), not((genL(L,C),len(C,CN), CN>SN)).
isSortedforP2([_]).
isSortedforP2([H1,H2|T]):- p2(H1,H2), isSortedforP2([H2|T]).
genL(L,LS):-subsequence(L,LS), isSortedforP2(LS).
