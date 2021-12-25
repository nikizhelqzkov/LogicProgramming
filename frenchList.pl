/*
24 януари 2018 изпита
Фенски списък е краен списък, всеки елемент на който е някоя от буквите 1, 2 или е
фенски списък, като никои два съседни елемента не са еднакви букви.
Да се дефинира на Пролог едноместен предикат p(X), който при преудовлетворяване
генерира в X всички фенски списъци, които се записват на Пролог с краен брой “[”
*/
isList([]).
isList([_|_]).
condition([]).
condition(X):- not(isList(X)),member(X,[1,2]).
condition(L):- isList(X), not((append(_,[X,X|_],L), member(X,[1,2]))), 
               not((member(T,L], not(condition(T)) )).

generateBranches(1,X):-member(X,[1,2,[]]).               
generateBranches(N,T):-N>1, N1 is N-1 , tree(N1,T).               
tree(0,[]).
tree(N,[CurrentBranch|L]):-N>0 , between(1,N,VerticesCurrentBranch), leftBranch is N - VerticesCurrentBranch , 
                            generateBranches(VerticesCurrentBranch,CurrentBranch), tree(leftBranch,L).
nat(0).
nat(A):-nat(B), B is A+1.
p(X):-nat(N), tree(N,X) , condition(X).

                    