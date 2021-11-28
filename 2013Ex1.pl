/*6.IV.2013 г.
Задача 1. Да се дефинира на пролог предикат q2(L), който
по даден списък от различни списъци L проверява дали
всеки два различни елемента на L имат общ елемент, който
не принадлежи на някой елемент на L.
*/
remove(X, List, ResultList):- append(A, [X|B], List), append(A, B, ResultList).


q2(L):- not((remove(X,L,L1), remove(Y,L1,L2),
        not(( member(T,X),member(T,Y), remove(Z,L2,_), not(member(T,Z)) )) )).



/*
6.IV.2013 г.
Задача 1. Да се дефинира на пролог предикат q(L), който
по даден списък от различни списъци L проверява дали
в L съществуват два различни елемента, които имат общ
елемент, който не принадлежи на никой друг елемент на L.*/



q(L):- remove(X,L,L1), remove(Y,L1,L2), 
       member(T,X),member(T,Y), not((remove(Z,L2,_), member(T,Z) )).