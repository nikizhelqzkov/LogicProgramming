% Да се дефинира на пролог предикат p(X, Y ),
% който по даден списък от списъци от числа X и списък
% от числа Y проверява дали са изпълнени следните три
% условия: 1) Y може да се представи като конкатенация
% на два елемента на X; 2) Y има четен брой елементи и
% 3) произведението от елементите на Y е последен еле-
% мент на елемент на X.

% isEqual(A,B).
isEqual([H],[H]).
isEqual([H|R],[S|T]):- H =:= S,  isEqual(R,T).

append([],B,B).
append([H|T],S,[H|R]):-append(T,S,R).
combineTwoLists(A,B,List):- append(A,B,List).

isCombi([H,S|_],Y):- combineTwoLists(H,S,List), isEqual(List,Y).
isCombi([H,S|T],Y):- combineTwoLists(H,S,List), not(isEqual(List,Y)) , isCombi([S|T],Y).
len([],0).
len([_|T],N):- len(T,M), N is M+1.
isEvenLen(L):- len(L,N), N mod 2 =:= 0.
lastElementOfList([H],H).
lastElementOfList([_|T],S):- lastElementOfList(T,S).
multiplyOfList([],1).
multiplyOfList([H|T],S):- multiplyOfList(T,M), S is H*M. 
isEqualLast([H|_],Elem):- lastElementOfList(H,Last), Elem=:=Last. 
isEqualLast([H|T],Elem):- lastElementOfList(H,Last), Elem=\=Last, isEqualLast(T,Elem). 
p(X,Y):- isCombi(X,Y) , isEvenLen(Y), multiplyOfList(Y,S), isEqualLast(X,S).



% Да се дефинира на пролог предикат
% p(X, Y, K), който по даден списък от двуелементни спи-
% съци от естествени числа K генерира в X и Y всички
% двойки от естествени числа, за които е изпълнено поне
% едно от следните три условия: 1) [X +1, Y −100] е елемент
% на K; 2) съществуват такива елементи [X1, Y1] и [X2, Y2]
% на K, че X = X1.X2 и Y = Y1 − Y2 или 3) [2.X + Y, X2.Y ]
% е елемент на K.

between(A,B,A):- A =< B.
between(A, B, C):- A<B, A1 is A + 1 , between(A1, B, C).

nat(0).
nat(N):- nat(M), N is M+1.

genKS(0,0,[]).
genKS(K,S,[H|T]):- K>0 ,between(0,S,H), S1 is S-H , K1 is K-1 , genKS(K1,S1,T).

genNatPairs([A,B]):- nat(N), genKS(2,N,[A,B]).

elementOfPos([H|_],0,H).
elementOfPos([_|T],K,Elem):-K>0, K1 is K-1 , elementOfPos(T,K1,Elem).

isItPartOfTheLOfL([H|_],Y):- isEqual(H,Y).
isItPartOfTheLOfL([H|T],Y):- not(isEqual(H,Y)), isItPartOfTheLOfL(T,Y).

first(X,Y,K):- X1 is X+1, Ym100 is Y -100 , isItPartOfTheLOfL(K,[X1,Ym100]).

second([[X1,Y1],[X2,Y2]|_],X,Y):- X=:= X1*X2 , Y=:= Y1-Y2.
second([[X1,Y1],[X2,Y2]|T],X,Y):- (X=\= X1*X2 ; Y=\= Y1-Y2), second([[X2,Y2]|T],X,Y).

third(X,Y,K):- X1 is 2*X + Y, elementOfPos(K,2,[X2,_]),  Y1 is X2*Y , isItPartOfTheLOfL(K,[X1,Y1]).

p(X,Y,K):-  genNatPairs([X,Y]), (first(X,Y,K) ; second(K,X,Y) ; third(X,Y,K) ).