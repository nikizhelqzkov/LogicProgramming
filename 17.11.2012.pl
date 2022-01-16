% Да се дефинира на Пролог едноместен предикат p,
% който при преудовлетворяване генерира всички тройки от
% естествени числа (a, b, c), чието произведение при деление
% на 3 дава остатък 1 и уравнението ax^2 + bx + c = 0 има два
% различни реални корена.

%b^2 - 4 a*c >0 for 2 dif real roots
% a*b*c mod 3 =:= 1
nat(0).
nat(N):- nat(M), N is M+1.
between(A, B,A):-A =< B.
between(A, B,C):-A < B,A1 is A + 1 , between(A1, B, C).

genNums(A,B,C):- nat(N), between(0,N,A),between(0,N,B), between(0,N,C).
cond(A,B,C):- Mult is A*B*C, Mult mod 3 =:= 1, Diskr is B^2 - 4*A*C , Diskr>0.
p(A,B,C):-genNums(A,B,C), cond(A,B,C).