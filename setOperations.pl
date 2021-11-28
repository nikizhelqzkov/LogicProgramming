isSubset(A, B):- not(( member(X, A), not(member(X,B)) )).

equal(A, B):- isSubset(A, B), isSubset(B, A).

union(A, B, X):- member(X, A); member(X, B).

intersection(A,B,X):- member(X, A), member(X, B).

difference(A, B, X):- member(X, A), not(member(X, B)). 

subsequence([],[]).
subsequence([_|T], R):- subsequence(T,R). 
subsequence([H|T], [H|R]):- subsequence(T,R). 

genSub(_,[]).
genSub(L,[H|T]):- genSub(L,T),member(H,L).