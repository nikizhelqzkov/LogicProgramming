len([],0).
len([_|T],Count):- len(T,Cnt), Count is Cnt+1.

sum([],0).
sum([H|T],Sum):- sum(T,SumT), Sum is H + SumT.

nThElement([],_,[]).
nThElement(X,0,[X|_]).
nThElement(X,Counter,[_|T]):- nThElement(X,Cnt,T), Counter is Cnt+1.