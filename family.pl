parent(maria,niki).
parent(maria,marti).
parent(zhivko,marti).
parent(zhivko,niki).
successor(A,B):-parent(B,A).
successor(A,B):-parent(B,Z),successor(A,Z).

