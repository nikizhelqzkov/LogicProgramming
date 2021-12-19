/*   1. Да се напише предикат binary(L), генериращ в L всички двоични дървета, като:
   - [] е двойчно дърво;
   - ако А и В са двойчни дървета, то и [A, B] е двойчно дърво.
[]
[[], []]
[[[], []], []]
...
*/
% binary(T, N).
between(A, B, A):- A =< B.
between(A, B, C):- A < B, A1 is A + 1, between(A1, B, C).
natural(0).
natural(X):- natural(Y), X is Y+1.

binary([],0).
binary([LT,RT],K):- K>0 ,K1 is K-1 , between(0,K1,N) , M is K1-N , binary(LT,N) , binary(RT,M).
binary(T):- natural(N), binary(T,N).