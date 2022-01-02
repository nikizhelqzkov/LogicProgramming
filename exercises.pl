% X is Lis of lists
% p1(X) -> [] is member of X


member(X,[X|_]).
member(X,[_|T]):-member(X,T).
p1(X):-member([],X).

% p2(X) -> In X exists Y and Z such not exists element in Y that is member of Z
p2(X):- member(Y,X) , member(Z,X) , not((member(A,Y) , not(member(A,Z)))). 
%  p3(X)-> exist element Y of X ,which 
% not ( exist  element Z in X and exist element A in Y  not(A is member of Z))
p3(X):- member(Y,X) , not((member(Z,X), member(A,Y) , not(member(A,Z)) )).
% p4(X)-> for each Y in X and exists member Z in X and for each elements in Y and not exists element in Y that is member of Z
%       not (exist Y in X and not(exists member Z in X and not(not exists elements in Y and  exists element in Y not(that is member of Z))))
p4(X):- not((member(Y,X), not(member(Z, X)), not(not((member(A,Y) , not(member(A,Z) ) ))  ))).



%---------------------special list

% [x1, x2, x3, . . . , xn] is special if for each k between 1 and n/2 :
%1)x2k = x2+k for  1 <= k + 2 <= n and 1 <= xk+2 <= n
%2)x2k = 2Xk + 2 else

between(A,B,A):- A=<B.
between(A,B,C):- A=<B, A1 is A+1 , between(A1,B,C).

indexOfList([H|_],0,H).
indexOfList([_|T],K,Elem):- K>0 ,  Km1 is K-1,indexOfList(T,Km1,Elem) .  
len([],0).
len([_|T],N):- len(T,M) , N is M+1.

condition(X,K):- len(X,N), Nm2 is N-2 ,between(1,Nm2,K), Kp2 is K+2 ,
                 indexOfList(X,Kp2,Xkp2), between(1,N,Xkp2),
                 K2 is K*2 , indexOfList(X,K2,X2K), indexOfList(X,Xkp2,XSpec), X2K =:= XSpec.
condition(X,K):- K2 is K*2 ,
                 indexOfList(X,K2,X2K) , indexOfList(X,K,Xk), Xk2 is Xk * 2,
                 Xk2p2 is Xk2 + 2 , X2K =:= Xk2p2. 
isSpecial(X,1, _):-  condition(X,1).
isSpecial(X,K,M):- K>1 , K=<M , condition(X,K) , K1 is K-1 , isSpecial(X,K1,M).
isSpecial(X):- length(X,N),M is N div 2, isSpecial(X,M,M).
%not  exist K between 1 and n/2 and not condition


% sumOfElementOfX(X,K,S)
% sumOfList(X,S)
sumOfList([],0).
sumOfList([H|T],S):-sumOfList(T,S1) , S is S1+H.
sumOfElementOfX(X,S):- len(X,N), between(0,N,K), indexOfList(X,K,El), sumOfList(El,S). 
genPitFromArr(X,K,S,M):- len(X,N),between(0,N,K1), indexOfList(X,K1,K), between(0,N,S1), indexOfList(X,S1,S), between(0,N,M1), indexOfList(X,M1,M),
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

p(X,N,M,K):- genPitFromListOfLists(X,N,M,K), Sum is N+M+K, isLowerThanLastElem(Sum,X),
             isNotSecondInAllListOfLists(N,X), isNotSecondInAllListOfLists(M,X), sumOfElementOfX(X,SM), K =:= SM.