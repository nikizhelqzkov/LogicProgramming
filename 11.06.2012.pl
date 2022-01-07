% Да се дефинира на Пролог двуместен предикат p,
% който по даден списък от списъци L генерира в M 
% най-дългата обща подредица на елементите на L

len([],0).
len([_|T],K):- len(T,K1), K is K1 + 1.

getMaxSubL([],MaxSub,_,MaxSub).
getMaxSubL([H|T],MaxSub,N,M):- len(H,HN), HN=<N, getMaxSubL(T,MaxSub,N,M).
getMaxSubL([H|T],_,N,M):- len(H,HN), HN>N, getMaxSubL(T,H,HN,M).
getMaxL([H|T],M):- len(H,N),getMaxSubL(T,H,N,M).



% Нека L е списък, който има следния вид:
% [[x1, y1], [x2, y2], . . . , [xn, yn]].
% Ще казваме, че L представя бинарната релация R, ако
% R = {(x1, y1), (x2, y2), . . . , (xn, yn)}.
% Да се дефинира на Пролог:
% а) едноместен предикат s, който по даден списък L, пред-
% ставящ бинарната релация R, разпознава дали R е симет-
% рична релация.

% for each A -> [A1,A2]  [A1,A2] is in L and [A2,A1] is In L
% not( exist A -> [A1,A2]  [A1,A2] is in L and not [A2,A1] is In L)

s(L):- not(( member([A1,A2],L), not(member([A2,A1],L))   )).

% б) едноместен предикат t, който по даден списък L, предс-
% тавящ бинарната релация R, разпознава дали R е транзи-
% тивна релация.

%for each [A1,A2]  , [A1,A2] is in L and forEach [A2,A3], [A2,A3] is In L and  [A1,A3] is In L
%for each [A1,A2]  , [A1,A2] is in L and forEach [A2,A3], [A2,A3] is In L and  [A1,A3] is In L
% for each [A1,A2] memberIn L and forEach [A2,A3] member inL , exists [A2,A3]member inL.
% not (exist [A1,A2] memberIn L and not(  not exists [A2,A3] member inL ,not exists [A2,A3]member inL.))

t(L):- not(( member([A1,A2],L), member([A2,A3],L), not(member([A1,A3],L)) )).


% в) триместен предикат c, който по дадени два списъка L1
% и L2, представящи съответно бинарните релации R1 и R2,
% генерира в L3 списък, представящ композицията R3 на
% R1 и R2.
% Напомняне: (x, z) ∈ R3 тогава и само тогава, когато има
% двойки (x, y) и (y, z), такива че (x, y) ∈ R1 и (y, z) ∈ R2.

%exist (x,y) in L1 and exist (y,z) in L2 and exist (x,z) in L3
c(L1,L2,[H|T]):- member([X,Y],L1), member([Y,Z],L2), member([X,Z],L3).%not good enough