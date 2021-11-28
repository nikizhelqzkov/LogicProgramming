remove(X, List, ResultList):- append(A, [X|B], List), append(A, B, ResultList).
insert(X,L,RL):-append(A,B,L),append(A,[X|B],RL).

permutation([],[]).
permutation(L,[X|P]):-remove(X,L,M),permutation(M,P).

perm([],[]).
perm([H|T],R):-perm(T,Q),insert(H,Q,R).