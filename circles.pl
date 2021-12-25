/*Зад. 2. Списък от три числа [X,Y,R] ще интерпретираме 
a) Да се дефинира генератор circles2(X,Y,R,Z,T,S), който по
дадена окръжност [X,Y,R] при преудовлетворяване генерира в Z, T и S 
окръжностите, които се съдържат в окръжността [X,Y,R].
като окръжност с център hX,Y i и радиус R. 
b) Да се дефинира генератор circles1(X,Y,R,Z,T,S), който по
дадена окръжност [X,Y,R] при преудовлетворяване генерира в 
Z, T и S окръжностите, които съдържат окръжността [X,Y,R].

*/

% a)

inPoint(X,Y,R,X1,Y1):- (X-X1)*(X-X1) + (Y-Y1)*(Y-Y1) =< R*R.
inCircle(X,Y,R,X1,Y1,R1):-XmR is X1 - R1 , XpR is X1+R1 , YmR is Y1-R1, YpR is Y1+R1, 
                          not((between(XmR,XpR,Z), between(YmR,Ypr,T), inPoint(X1,Y1,R1,Z,T) , not(inPoint(X,Y,R,Z,T)))).
circles2(X,Y,R,Z,T,S):-between(1,R,S), XmR is X1 - R1 , XpR is X1+R1 , YmR is Y1-R1, YpR is Y1+R1 ,
                       between(XmR,XpR,Z), between(YmR,Ypr,T) , inCircle(X,Y,R,Z,T,S).

% b) 
%genKS - generate with k points and Sum S Elements in Arr
genKS(0,0,[]).
genKS(K,S,[XI|R]):- K>0 ,between(0,S,XI), S1 is S-XI, K1 is K-1 , genKS(K1,S1,R).
nat(0).
nat(A):- nat(A1), A1 is A+1.
circles1(X,Y,R,Z,T,S):-nat(N), genKS(3,N,[Z,T,S]) , inCircle(Z,T,S,X,Y,R).

