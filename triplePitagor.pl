isPitagorTriple(N,M,K):- N^2 + M^2 =:= K^2.
between(A,B,A):- A =< B.
between(A,B,C):- A < B, A1 is A+1, between(A1,B,C).

append([],B,B).
append([H|T],B,[H|R]):- append(T,B,R).

insert(X,L,NewL):- append(A,B,L),append(A,[X|B],NewL).

permute([],[]).
permute([H|T],R):- permute(T,R1), insert(H,R1,R).

genKS(0,0,[]).
genKS(K,S,[H|T]):- K>0 , between(1,S,H), K1 is K-1, S1 is S-H, genKS(K1,S1,T).
genPitTriple([A1,A2,A3],N):- between(2,N,K), genKS(3,K,[A1,A2,A3]), 
                             isPitagorTriple(A1,A2,A3).

getLastElementOfList([H],H).
getLastElementOfList([_|T],N):-  getLastElementOfList(T,N).
isLowerThanAnyElement(X,[H]):- getLastElementOfList(H,XR), X<XR.
isLowerThanAnyElement(X,[H|_]):- getLastElementOfList(H,XR), X<XR.
isLowerThanAnyElement(X,[H|T]):- getLastElementOfList(H,XR), X>=XR, 
                                 isLowerThanAnyElement(X,T).

isOkSum(A1,A2,A3,X):- Sum is A1 + A2 + A3 ,  isLowerThanAnyElement(Sum,X).

getSecondElement([_,H|_],H).


isElementMemberOfTheEverySecond([H],X):- getSecondElement(H,X).
isElementMemberOfTheEverySecond([H|T],X):- getSecondElement(H,X), isElementMemberOfTheEverySecond(T,X).

flatArray([],[]).
flatArray([H|T],X):- flatArray(T,X1), append(H,X1,X).
getFirstElement([H],H).
getFirstElement([H|_],H).
isSorting([_]).
isSorting([H1,H2|T]):- H1>=H2, isSorting([H2|T]).

sortList(L,SL):- permute(L,SL), isSorting(SL).

getMaxElement(L,X):- sortList(L,SL), getFirstElement(SL,X).

sumOfList([],R,R).
sumOfList([H|T],R,Temp):- NewTemp is Temp + H , sumOfList(T,R,NewTemp).
sumOfList(L,S):- sumOfList(L,S,0).

hasElementSumOfAnyList([H],X):- sumOfList(H,S), X=:=S.
hasElementSumOfAnyList([H|_],X):- sumOfList(H,S), X=:=S.
hasElementSumOfAnyList([H|T],X):- sumOfList(H,S), X=\=S, hasElementSumOfAnyList(T,X).

p(X, N, M, K):- flatArray(X,XF), getMaxElement(XF,MaxEl),
                genPitTriple([N,M,K],MaxEl), 
                isOkSum(N,M,K,X),
                not(isElementMemberOfTheEverySecond(X,N)), 
                not(isElementMemberOfTheEverySecond(X,M)),
                hasElementSumOfAnyList(X,K).

