lessOrEqual(X,Y):- X=<Y.

% min(X,Y)
min([M],M).
min([H|T],N):- min(T,N),lessOrEqual(N,H).
min([H|T],H):- min(T,N),not(lessOrEqual(N,H)).

min2([M],M).
min2([H|T],M):- min2(T,N),minHelper(H,N,M).
minHelper(A,B,A):- lessOrEqual(A,B).
minHelper(A,B,B):- not(lessOrEqual(A,B)).

remove(X,L,M):- append(A,[X|B],L), append(A,B,M).

selectionSort([],[]).
selectionSort([H|T],[M|R]):- min([H|T],M), remove(M,[H|T],Q), selectionSort(Q,R).

splitByPivot(_,[],[],[]).
splitByPivot(Pivot,[H|T],[H|A],B):- splitByPivot(Pivot,T,A,B), lessOrEqual(H,Pivot).
splitByPivot(Pivot,[H|T],A,[H|B]):- splitByPivot(Pivot,T,A,B), not(lessOrEqual(H,Pivot)).

quickSort([],[]).
quickSort([Pivot|T],R):- splitByPivot(Pivot,T,A,B), quickSort(A,RA),quickSort(B,RB),append(RA,[Pivot|RB],R).

