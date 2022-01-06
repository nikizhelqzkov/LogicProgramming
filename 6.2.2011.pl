% Казваме, че крайна редица от
% числа [a1, . . . , an] е сегментна, ако съществу-
% ва такава подредица [an1 , an2 , . . . , ank ], където
% 1 <= n1 < n2 < · · · < nk <= n, че an1 < an2 < · · · < ank
% и ∃c∀i(ai > ai+1 ⇒ ai+1 = c & ∃j(i = nj )). Да се дефи-
% нира на пролог предикат p(L), който по даден списък от
% числа L проверява дали той задава сегментна редица

% raisingSubList(L,LastElement,SubbedList).
append([],B,B).
append([A1|A],B,[A1|L]):- append(A,B,L).
len([],0).
len([_|A],K):-len(A,K1) , K is K1 + 1.
indexOfList([H|_],0,H).
indexOfList([_|T],K,Elem):-indexOfList(T,K1,Elem), K is K1+1.

% raisingSubList([H],SubbedList,List):- len(SubbedList,N), N1 is N-1 indexOfList(SubbedList,N1,Last), H>Last, append(SubbedList,H,List).
% raisingSubList([H|T],[],[H]):- raisingSubList(T,[H],[])
subsequence([],[]).
subsequence([_|T], R):- subsequence(T,R). 
subsequence([H|T], [H|R]):- subsequence(T,R). 

member(X,[X|_]).
member(X,[_|T]):-member(X,T).
isRaising(List,SubbedList):- subsequence(List,SubbedList), condition(List,SubbedList).
 isSegment(List,SubbedList):- isRaising(List,SubbedList), member(C,List), 
                              indexOfList(List,I,Ai), I1 is I+1, indexOfList(List,I1,Ai1),
                             Ai>Ai1, Ai1=:=C, indexOfList(List,J,_), indexOfList(SubbedList,J,Anj), indexOfList(SubbedList,NJ,Anj), I=:=NJ .
condition(_,[_]).
condition(List,[H1,H2]):- indexOfList(List,K1,H1), indexOfList(List,K2,H2), H1<H2 ,K1<K2.
condition(List,[H1,H2|T]):- indexOfList(List,K1,H1), indexOfList(List,K2,H2), H1<H2,  K1<K2, condition(List,[H2|T]).  
p(L):- isSegment(L,_).

% ∃c∀i(ai > ai+1 ⇒ ai+1 = c & ∃j(i = nj ))
% exists c and for each(  (not (ai>ai+1)or ai+1 = c) and exists j and i = nj.
% exists c and not ( (ai>ai+1)or not(ai+1 = c)) and not (exists j and i = nj).

% ∃c ∃i(ai > ai+1 and ai+1 = c & ∃j(i = nj ))




% Ако E е списък от списъци с дължина 2, да оз-
% начим с G(E) ориентирания граф, в който няма изолирани
% върхове и между два върха u и v има ребро точно тогава,
% когато [u, v] е елемент на списъка E. Да се дефинира на
% пролог предикат p(E, v), който по даден списък от двуеле-
% ментни списъци E и връх v на графа G(E) проверява дали
% в G(E) има цикъл, преминаващ през v.

edge([U,V],E):- member([U,V],E).
isInGraph(V,[Ver,E]):- member(V,Ver), edge([V,_],E).
reverse([],[]).
reverse([H|T],RevList):- reverse(T,List), append(List,[H],RevList).
path(_, B,B,Visited,Path):-reverse([B|Visited],Path).
path([V,E],A,B,Visited,Path):- edge([A,C],E), not(member(C,Visited)), path([V,E],C,B,[A|Visited],Path).
path([V,E],A,B,Path):-path([V,E],A,B,[],Path).

hasCycle([V,E],[X|Path]):-edge([X,Y],[V,E]), path([V,E],Y,X,Path), len(Path,N), N>2.
p(E,V):-hasCycle([_,E],Path),member(V,Path).
% [[1,3,2,4,5],[[1,3],[3,4],[1,5],[1,2]]]).