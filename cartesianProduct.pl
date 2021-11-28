cartesianProduct([],[]).
cartesianProduct([LI|L],[AI|R]):- member(AI,LI),cartesianProduct(L,R).
