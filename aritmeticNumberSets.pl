natural(0).
natural(X):- natural(Y), X is Y+1.

even(X):- natural(X), X mod 2 =:= 0.
even2(X):- natural(Y), X is Y*2.
even3(0).
even3(X):- even3(Y), X is Y*2.

odd(X):- natural(X), X mod 2 =\= 0.


