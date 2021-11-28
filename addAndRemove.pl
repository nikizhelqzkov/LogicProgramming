append([],B,B).
append([A1|A],B,[A1|L]):- append(A,B,L).


% remove(A, [A|List],List).
% remove(A, [_|T],[_|List]):-remove(A,T,List).


% removeApp(A,OldList,List):-append(X,[A|C],OldList), append(X,C,List).
member(X,[X|T]).
member(X,[_|T]):-member(X,T).
% insert(A,List,NewList):-append(X,Y,List),append(X,[A|Y],NewList).
% insertWithRemove(A,List,NewList):-remove(A,NewList,List).

removeAll(_,[],[]).
removeAll(X,[X|T],R):- removeAll(X,T,R).
removeAll(X,[H|T],[H|R]):- X\=H, removeAll(X,T,R).




