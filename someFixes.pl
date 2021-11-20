append([],B,B).
append([A1|A],B,[A1|L]):- append(A,B,L).

prefix(A,List):- append(A,_,List).
suffix(A,List):- append(_,A,List).
infix(A,List):- prefix(Z,List),suffix(A,Z).