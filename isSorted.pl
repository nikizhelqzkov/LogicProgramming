lessOrEqual(X,Y):- X =< Y.

isSorted([]).
isSorted([_]).
isSorted([X,Y|T]):-lessOrEqual(X,Y), isSorted([Y|T]).

isSrt(L):- not((append(_,[X,Y|_],L),not(lessOrEqual(X,Y)) )).