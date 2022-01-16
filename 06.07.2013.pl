% Задача 1. Да се дефинира на пролог предикат p(N, M ),
% който по дадено естествено число N генерира в M при
% преудовлетворяване всички точни делители на N , които
% са числа от вида 2^n + m^3 за някои естествени n и m.

between(A,B,A):- A =< B.
between(A,B,C):- A<B, A1 is A + 1 , between(A1, B, C).
isDelitel(A,B):-A>=B , A mod B =:=0.
genDelitels(N,M):- between(1,N,M), isDelitel(N,M).
p(N,M):- genDelitels(N,M), between(1,N,N1),between(1,N,M1), 2^N1 + M1^3 =:= M.