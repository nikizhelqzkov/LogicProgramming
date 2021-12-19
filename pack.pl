% 5. Да се напише предикат, които "пакетира" елементите в списък L. прим: [1,2,2,1,4,5,5,5] -> [[1], [2,2], [1], [4], [5,5,5]].

pack([],[]).
pack([A],[[A]]).
pack([A,B|T],[[A]|C]):- A\=B, pack([B|T],C).
pack([A,A|T],[[A|C1]|C]):- pack([A|T],[C1|C]).


