% Да се дефинира на Пролог предикат
% p(X1, Y1, A, X2, Y2, R, X, Y), който по даден квадрат
% (с долен ляв ъгъл с координати X1 и Y 1, дължина на
% страната A и страни успоредни на координатните оси) и
% окръжност (с център с координати X2 и Y 2 и радиус R),
% генерира точките с целочислени координати X и Y , които
% са едновременно и в квадрата и в окръжността

isItInSquare(XS,YS,A,X,Y):- X>=XS, X=<XS+A, Y>=YS, Y=<YS+A.
isItInCircle(XR,YR,R,X,Y):- (XR-X)^2 + (YR-Y)^2 =< R*R.
between(A, B,A):- A =< B.
between(A,B,C):- A< B, A1 is A + 1 , between(A1, B, C).
maxElement([],Elem,Elem).
maxElement([H|T],Elem,Temp):- H>Temp,maxElement(T,Elem,H).
maxElement([H|T],Elem,Temp):- H=<Temp,maxElement(T,Elem,Temp).
getMaxNs(X1, Y1, A, X2, Y2, R,MaxX,MaxY):- XpA is X1+A, XpR is X2+R, YpA is Y1+A, YpR is Y2+R, 
                                           maxElement([X1,X2,XpA,XpR],MaxX,X1),
                                           maxElement([Y1,Y2,YpA,YpR],MaxY,Y1).                               
p(X1, Y1, A, X2, Y2, R, X, Y):- getMaxNs(X1, Y1, A, X2, Y2, R,MaxX,MaxY),
                                NMaxX is MaxX * -1, NmaxY is MaxY * -1,  
                                between(NMaxX,MaxX,X),between(NmaxY,MaxY,Y),
                                isItInSquare(X1,Y1,A,X,Y), isItInCircle(X2,Y2,R,X,Y).
                                