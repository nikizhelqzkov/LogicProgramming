member(X,[X|T]).
member(X,[_|T]):-member(X,T).

append([],B,B).
append([A1|A],B,[A1|List]):-append(A,B,List).
memberApp(X, List):- append(Z, [X|T], List).
