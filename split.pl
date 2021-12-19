% 7. split генератор
/*
?- split([1,2,3],L).
L = [[1], [2], [3]] ;
L = [[1], [2, 3]] ;
L = [[1, 2], [3]] ;
L = [[1, 2, 3]] ;
false.
*/

split([],[]).
split([H|T],[A|Rest]):- append(A,B,[H|T]) ,A\=[] ,split(B,Rest).