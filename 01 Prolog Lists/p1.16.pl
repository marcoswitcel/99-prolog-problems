/*

Drop every N'th element from a list.
Example:
?- drop([a,b,c,d,e,f,g,h,i,k],3,X).
X = [a,b,d,e,g,h,k]

*/
:- use_module(library(clpfd)).

list_integer_dropped(Ls, IndexToDrop, DLs) :-
    list_integer_dropped(Ls, IndexToDrop, 1, DLs, []).

list_integer_dropped([], _, _, Acc, Acc).
list_integer_dropped([Head|Tail], IndexToDrop, CurIndex0, DLs, Acc0) :- 
    ( IndexToDrop #= CurIndex0 ->
        CurIndex1 #= CurIndex0 + 1,
        list_integer_dropped(Tail, IndexToDrop, CurIndex1, DLs, Acc0)
    ;
        CurIndex1 #= CurIndex0 + 1,
        append(Acc0, [Head], Acc1),
        list_integer_dropped(Tail, IndexToDrop, CurIndex1, DLs, Acc1)
    ).
