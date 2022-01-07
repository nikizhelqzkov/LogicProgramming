% Да се дефинира на Пролог двуместен предикат
% с аргументи X и Y , който по даден списък X от списъци ге-
% нерира при преудовлетворяване в Y елементите на декар-
% товото произведение на елементите на X. Например, ако X
% е [A1, A2, A3, A4], елементите на декартовото произведение
% на елементите на X са списъците от вида [a1, a2, a3, a4],
% където за всяко i, 1 ≦ i ≦ 4, ai е елемент на Li


indexOfList([H|_],0,H).
indexOfList([_|T],K,Elem):- indexOfList(T,K1,Elem), K is K1+1.
append([],B,B).
append([H|T],B,[H|R]):-append(T,B,R).
len([],0).
len([_|T],K):-len(T,K1), K is K1+1. 

pushingDecart(L, K, Elem):- indexOfList(L,K,Elem).
p([],0,Y,_,Temp):- Y = Temp.
p([H|T],K,Y,N,Temp):- L is N-K, pushingDecart(H,L,Elem) , append(Temp,[Elem],NewTemp), K1 is K-1 , p(T,K1,Y,N,NewTemp).

p(X,Y):- len(X,N), p(X,N,Y,N,[]).



%  Да се дефинира на Пролог двуместен предикат,
% който по дадени две цели числа разпознава дали те имат
% едни и същи прости делители

 % for each nums K< N, N%K !=0
 % not  exist num K< N, N%K ==0
between(A, B,A):- A =< B.
between(A, B,C):- A < B , A1 is A + 1 , between(A1, B, C).
isPrimeNum(2).
isPrimeNum(N):-N>2, Nm1 is N-1, not(( between(2,Nm1,K), N mod K =:=0  )).

% genPrimeNums(List,N,Start):- Start>2,Start<N,between(Start,N,K), isPrimeNum(K),Start1 is Start+1,genPrimeNums([K|List],N,Start1).  
% genPrimeNums(List,N,Start):- Start>2,Start<N,between(Start,N,K), isPrimeNum(K),Start1 is Start+1,genPrimeNums([K|List],N,Start1).  
% genElems(X,Temp):- 

genPrimes(K,N,Start):-between(Start,N,K), isPrimeNum(K).
% simpleDel(X,[]):-  genPrimes(K,X,2), X mod K =:=0, XNew is X div K, simpleDel(XNew,[K]).
simpleDel(X,L,Temp):-  genPrimes(K,X,2), X mod K =:=0, XNew is X div K, simpleDel(XNew,L,[K|Temp]).
simpleDel(1,L,Temp):- L=Temp.
% not exist a1 and a2 and  a1>a2
membeR(H,[H|_]).
membeR(X,[_|T]):- membeR(X,T).
isSort([_]).
isSort([A1,A2|T]):- A1=<A2 , isSort([A2|T]).
sortedSimpleDel(X,L):- simpleDel(X,L,[]), isSort(L).
filter([_],_).
filter([H1,H2|T],[H2|T]):- filter([H2|T],[H2|T]), H1=:=H2 .
filter([H1,H2|T],[H1,H2|T]):- filter([H2|T],[H2|T]), H1=\=H2 .

genSimDelOfX(X,NewL):-  simpleDel(X,L, []) , isSort(L), filter(L,NewL). 
p2(X,Y):- genSimDelOfX(X,LX), genSimDelOfX(Y,LY), LX=LY.