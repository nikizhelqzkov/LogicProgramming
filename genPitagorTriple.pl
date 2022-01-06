between(A,B,A):- A=<B.
between(A,B,C):- A=<B, A1 is A+1 , between(A1,B,C).

indexOfList([H|_],0,H).
indexOfList([_|T],K,Elem):- K>0 ,  Km1 is K-1,indexOfList(T,Km1,Elem).



len([],0).
len([_|T],N):- len(T,M) , N is M+1.

sumOfList([],0).
sumOfList([H|T],S):-sumOfList(T,S1) , S is S1+H.

sumOfElementOfX(X,S):- len(X,N), between(0,N,K), indexOfList(X,K,El), sumOfList(El,S). 

genPitFromArr(X,K,S,M):- len(X,N),between(0,N,K1), indexOfList(X,K1,K), between(0,N,S1),
                         indexOfList(X,S1,S), between(0,N,M1), indexOfList(X,M1,M),
                         Sum is ((K^2) + (S^2)) , Sum =:= M^2.

append([],B,B).
append([H|T],L,[H|R]):-append(T,L,R).

flatArr([],[]).
flatArr([H|T],NewList):-flatArr(T,TempList), append(H,TempList,NewList).

lastElementOfList([H],H).
lastElementOfList([_|T],S):-lastElementOfList(T,S).

genLastElements(X,K,S):- len(X,N), between(0,N,K), indexOfList(X,K,List) ,lastElementOfList(List,S).

genPitFromListOfLists(X,K,S,M):- flatArr(X,FlatX),  genPitFromArr(FlatX,K,S,M).

isNotSecondInAllListOfLists(X,[H]):- indexOfList(H,1,A), A=\=X.  
isNotSecondInAllListOfLists(X,[H|T]):-  indexOfList(H,1,A), A=\=X , isNotSecondInAllListOfLists(X,T).

isLowerThanLastElem(Sum,X):- genLastElements(X,_,S), Sum =< S.

p(X,N,M,K):- genPitFromListOfLists(X,N,M,K), Sum is N+M+K, 
             isLowerThanLastElem(Sum,X), isNotSecondInAllListOfLists(N,X),
             isNotSecondInAllListOfLists(M,X), sumOfElementOfX(X,SM), K =:= SM.