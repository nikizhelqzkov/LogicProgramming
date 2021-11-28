reverseWithStack(H,R):-reverseHelper(H,[],R).
reverseHelper([],S,S).
reverseHelper([H|T],Stack,R):-reverseHelper(T,[H|Stack],R).


ispalindromWithStack[P]:-reverseWithStack[P,P].

isPalindrome([]).
isPalindrome([_]).
isPalindrome[L]:- append([H|Rest],[H],L), isPalindrome(Rest).