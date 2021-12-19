% flatten(L,R)[[[[],a]],b],b,[c]]-> [a,b,c]
isList([]).
isList([_|_]).
flatten1([],[]).
flatten1([H|T],R):-flatten1(H,RH), flatten1(T,RT), append(RH,RT,R).
flatten1(X,[X]):-not(isList(X)).
myFlatten(L,R):- isList(L), flatten1(L,R).
