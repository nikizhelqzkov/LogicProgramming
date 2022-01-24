%member , intersection, hasPartOf

subsequence([],[]).
subsequence([_|T], R):- subsequence(T,R).
subsequence([H|T], [H|R]):- subsequence(T,R).
permutation([],[]).
permutation([H|T], R):- permutation(T,L), insert(H,L,R).
append([],B,B).
append([H|T],B,[H|R]):- append(T,B,R).
insert(X,L,R):- append(A,B,L),append(A,[X|B],R). 
subPerm(L,LP):-subsequence(L,LS),permutation(LS,LP).
member(X,[X|_]).
member(X,[_|T]):-member(X,T).
intersection([],_,Z,Z).
intersection([H|T],Y,Z,Rest):- member(H,Y), append(Rest,[H],NewRest), intersection(T,Y,Z,NewRest).
intersection([H|T],Y,Z,Rest):- not(member(H,Y)),intersection(T,Y,Z,Rest).
intersection(X,Y,Z):-intersection(X,Y,Z,[]).

p(L):-not(( member(X,L),member(Y,L), not(member(Z,L)), not(( intersection(X,Y,T), subPerm(Z,T)))     )).

rangeOFDels(A,A,D,DL):-append(DL,[A],D).
rangeOFDels(A,Elem,D,Rest):-Elem<A, A mod Elem =:=0, append(Rest,[Elem],NewRest), Elem1 is Elem+1, rangeOFDels(A,Elem1,D,NewRest).
rangeOFDels(A,Elem,D,Rest):-Elem<A, A mod Elem =\=0, Elem1 is Elem+1, rangeOFDels(A,Elem1,D,Rest).
rangeOFDels(A,D):-rangeOFDels(A,2,D,[]).
hasSimpleDels(A,B):-rangeOFDels(A,DA),rangeOFDels(B,DB), intersection(DA,DB,[]).
remove(X, List, ResultList):- append(A, [X|B], List), append(A, B, ResultList).

len([],0).
len([_|T],N):-len(T,M), N is M+1.
base(L):- not((  remove(X,L,L1), remove(Y,L1,_), not( hasSimpleDels(X,Y)  )   )).
gen(M,L):- subsequence(M,L),len(L,N), N>1, base(L).
%exist L and not exist other L2 with bigger size L and is  part of the L2
max(M,L):- gen(M,L), len(L,LL),not((gen(M,L1), len(L1,LL1), LL1>LL, not(intersection(L,L1,[]) )  )).