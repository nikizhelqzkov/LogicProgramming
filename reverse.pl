reverse([],[]).
reverse([H|T],L):-reverse(T,RT),append(RT,[H],L).

reverseWithStack(H,R):-reverseHelper(H,[],R).
reverseHelper([],S,S).
reverseHelper([H|T],Stack,R):-reverseHelper(T,[H|Stack],R).

