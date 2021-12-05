% [], [LT, Root, RT]
% empty, tree(LT, Root, RT)

% treeSort(L, SortedL).
% makeTree(List, Tree).
% add(X, Tree, NTree).
% leftRootRight(Tree, SortedList).
lessOrEqual(X,Y):- X=<Y.

makeTree([],empty).
makeTree([H|T],Tree):- makeTree(T,Tree1), add(H,Tree1,Tree).

add(X,empty,tree(empty,X,empty)).
add(X,tree(LT,Root,RT), tree(LT1,Root,RT)):- lessOrEqual(X,Root), 
    add(X,LT,LT1).
add(X,tree(LT,Root,RT), tree(LT,Root,RT1)):- not(lessOrEqual(X,Root)),
    add(X,RT,RT1).

leftRootRight(empty,[]).
leftRootRight(tree(LT,Root,RT),L):- leftRootRight(LT,LL),leftRootRight(RT,RL),append(LL,[Root|RL],L).

treeSort(L,SortedL):-makeTree(L,T),leftRootRight(T,SortedL).

