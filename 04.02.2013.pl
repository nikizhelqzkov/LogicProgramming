% Зад. 2. Списък X от списъци се нарича кохерентен, ако
% всеки елемент на X (освен последния) има общ елемент
% със следващия елемент на X. Да се дефинира на Пролог
% предикат p(X), който по даден списък X от списъци про-
% верява дали X e кохерентен. 

member(X,[X|_]).
member(X,[_|T]):- member(X,T).
append([],B,B).
append([H|T],B,[H|R]):- append(T,B,R).
hasCommonElement(L,R):- member(X,L), member(X,R).
p(X):- not((append(_,[X1,Y1],X), not(hasCommonElement(X1,Y1)) )).