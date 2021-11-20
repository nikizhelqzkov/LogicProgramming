first(A,[A|_]).
last(A,[A|[]]).
last(A,[_|T]):-last(A,T).
second(A,[_|T]):-first(A,T).
preLast(A,[_|T]):-preLast(A,T).
preLast(A,[A,_]).

append([],B,B).
append([A1|A],B,[A1|L]):-append(A,B,L).
lastAppend(A,List):-append(_,[A],List).