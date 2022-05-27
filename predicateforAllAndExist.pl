member(X,[X|_]).
member(X,[_|T]):- member(X,T).

p1(L):- A=[], member(A,L).

p2(L):- member(Y,L), member(Z,L), Y\=Z , not(intersection(Y,Z,_)).

intersection(A,B,X):- member(X, A), member(X, B).

isListElsArePartOfTheLOfLS(L,[H]):- isElementPartOfTheEveryList(H,L).
isListElsArePartOfTheLOfLS(L,[H|T]):- isElementPartOfTheEveryList(H,L),
                                      isListElsArePartOfTheLOfLS(T,L).
isElementPartOfTheEveryList(X,[H]):- member(X,H).
isElementPartOfTheEveryList(X,[H|T]):- member(X,H), isElementPartOfTheEveryList(X,T).

p3(L):-member(Y,L), isListElsArePartOfTheLOfLS(L,Y).

p4(L):- not(( member(Y,L), member(Z,L), intersection(Y,Z,_) )).