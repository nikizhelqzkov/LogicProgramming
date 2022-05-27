decomposeNumber(0,L,L).
decomposeNumber(N,L,Temp):-N>0, N<10,append([N],Temp,NewTemp), decomposeNumber(0,L,NewTemp).
decomposeNumber(N,L,Temp):- 
    N>9,
    N1 is N mod 10,
    N2 is N // 10,
    append([N1],Temp,NewTemp),
    decomposeNumber(N2,L,NewTemp).

decomposeNumber(N,L):- decomposeNumber(N,L,[]).

len([],0).
len([_|T],N):-len(T,N1), N is N1+1.

composeNumber([H],_,NTemp,N):- N is NTemp + H.
composeNumber([H|T],K,NTemp,N):- K1 is K-1,
                                 NewTemp is NTemp + H*(10^K1), composeNumber(T,K1,NewTemp,N).

composeNumber(L,N):- len(L,LN),composeNumber(L,LN,0,N).

fromNToNegN([],[]).
fromNToNegN([H|T],[HN|TN]):- fromNToNegN(T,TN), HN is 9 - H.

fromElToNEl(N,NegN):- decomposeNumber(N,LN), fromNToNegN(LN,NegL),composeNumber(NegL,NegN).

nat(0).
nat(N):- nat(M), N is M+1.

isPrime(2).
isPrime(N):- isPrime(N,N-1).
isPrime(N,M):- M>1, N mod M =\= 0, M1 is M-1, isPrime(N,M1).
isPrime(_,1).

genAllNegNumbers(N):- nat(N),fromElToNEl(N,NegN),  isPrime(NegN).