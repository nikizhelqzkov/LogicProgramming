% Нека L е списък от списъци, L = [ℓ1, ℓ2, . . . , ℓn].
% Казваме, че двойката от списъци F, G е разбиване на L,
% ако F = [ℓi1 , ℓi2 , . . . , ℓik ] и G = [ℓj1 , ℓj2 , . . . , ℓjn−k ], където
% {i1, i2, . . . , ik , j1, j2, . . . , jn−k } = {1, 2, . . . , n}.
% Обединение на списък от списъци е множеството на всич-
% ки обекти, които са елементи на някой елемент на списъка.
% Да се дефинира на Пролог едноместен предикат p, който по
% даден списък от списъци L разпознава дали L може да се
% разбие на два списъка, които имат едно и също обединение.

len([],0).
len([_|T],N):- len(T,M), N is M+1.
between(A, B,A):- A =< B.
between(A,B,C):- A<B, A1 is A+1 , between(A1,B,C).
append([],B,B).
append([H|T],B,[H|R]):- append(T,B,R).
% pushParts(L,A,B,K,N,TempA,TempB). 
pushParts([],A,B,0,0,A,B).
pushParts([H|T],A,B,0,N,A,TempB):-  N1 is N-1 , append(TempB,[H],NewTempB), 
                                    pushParts(T,A,B,0,N1,A,NewTempB).
pushParts([H|T],A,B,K,N,TempA,TempB):- K1 is K-1 , N1 is N-1, append(TempA,[H],NewTempA),
                                       pushParts(T,A,B,K1,N1,NewTempA,TempB).
                            
genParts(L,A,B):- len(L,N), Nm1 is N-1, between(1,Nm1,K), pushParts(L,A,B,K,N,[],[]).
flatten([],[]).
flatten([H|T],L):-flatten(T,TL), append(H,TL,L).
insert(X,L,RL):-append(A,B,L),append(A,[X|B],RL).
permutation([],[]).
permutation([H|T],R):- permutation(T,Temp),insert(H,Temp,R).
isSorted([_]). 
isSorted([H1,H2|T]):-H1=<H2, isSorted([H2|T]).
removeDublicatesFromSList([A],[A]).
removeDublicatesFromSList([H1,H2|T],R):- removeDublicatesFromSList([H2|T],R), H1=:=H2.
removeDublicatesFromSList([H1,H2|T],[H1|R]):-removeDublicatesFromSList([H2|T],R),H1=\=H2.

p(L):- genParts(L,A,B), flatten(A,FA), flatten(B,FB), 
       permutation(FA,FPA), isSorted(FPA),
       permutation(FB,FPB), isSorted(FPB),
       removeDublicatesFromSList(FPA,FPAS), removeDublicatesFromSList(FPB,FPBS),FPAS=FPBS.
