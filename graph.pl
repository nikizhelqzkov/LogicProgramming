graph([a,b,c],[[a,b],[b,c],[a,d]]).

edge([_,E],X,Y):-member([X,Y],E), member([Y,X],E).


path(_,B,B,VISITED,PATH):-reverse([B|VISITED],PATH).
path([V,E],X,Y,VISITED,PATH):-edge([V,E],X,Z,VISITED,PATH), not(member(Z,VISITED)) , path([V,E],Z,Y,[X|VISITED]).
path([V,E],X,Y,PATH):-path([V,E],X,Y,[],PATH).

hasCycle([V,E],[X|Path]):-edge([V,E],X,Y),path([V,E],Y,X,Path), length(Path,N),N>2.

isConnected([[X|V],E]):-not((member(Y,V), not(path([V,E],X,Y,_)))).

remove(X, List, ResultList):- append(A, [X|B], List), append(A, B, ResultList).

spanningTreeHelper(_,_,[],[]).
spanningTreeHelper([V,E],Visited,NotVisited,[[X,Y]|ST]):-member(X,Visited), edge([V,E],X,Y), 
                remove(Y,NotVisited,NewNotVisited), spanningTreeHelper([V,E],[Y|Visited],NewNotVisited,ST).

spanningTree([V,E],ST):-V=[X|Rest], spanningTreeHelper([V,E],[X],Rest,ST).

isConnected2(G):-spanningTree(G,_).
isTree(T):-spanningTree([_,E],T), length(E,M) , length(T,M).

removeEdges([],_,[]).
removeEdges([H|T],X,[H|R]):- not(member(X,H)) , removeEdges(T,X,R).
removeEdges([H|T],X,R):- member(X,H) , removeEdges(T,X,R).

criticalVertex([V,E],X):-remove(X,V,NewV) , removeEdges(E,X,NewE), not(isConnected([NewV,NewE]).