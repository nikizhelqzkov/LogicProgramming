% X списък от числа, Y списък от списъци от числа
% p1(X, Y) <-> Има ел. на Х, който е в ел. на Y.
p1(X,Y):- member(Z,X),member(T,Y),member(Z,T).

% p2(X, Y) <-> Има ел на Х, който е във всеки ел на Y.
p2(X, Y):- member(Z, X), not(( member(T, Y), not(member(Z, T)) )).

% p3(X, Y) <-> Всеки ел на Х е в ел на Y. AzEtf |=| !Ez!Etf
p3(X, Y):- not(( member(Z, X), not(( member(T, Y), member(Z, T) )) )).

% p4(X, Y) <-> Всеки ел на Х е във всеки ел на Y. AzAtf |=| !EzEt!f 
p4(X, Y):- not(( member(Z,X), member(T, Y), not(member(Z, T)) )).