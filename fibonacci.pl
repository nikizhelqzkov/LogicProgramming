fib(0,0).
fib(1,1).
fib(N,X):- N>1, N1 is N-1, N2 is N-2 , fib(N1,Y), fib(N2,Z) , X is Y+Z.
fib(X):- natural(N), fib(N,X).

% X Y X+Y
% 0 1 1
fibLin(0,1).
fibLin(Y,Z):- fibLin(X,Y), Z is X+Y.
fibLin(X):- fibLin(X,_).