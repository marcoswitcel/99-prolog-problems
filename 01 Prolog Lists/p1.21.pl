/*

Insert an element at a given position into a list.
Example:
?- insert_at(alfa,[a,b,c,d],2,L).
L = [a,alfa,b,c,d]

*/

:- use_module(library(clpfd)).

insert_at(V, Ls, At, NLs) :-
    insert_at(V, Ls, At, NLs, []).

insert_at(_, [], _, Acc, Acc).
insert_at(V, [Head|Tail], At0, NLs, Acc0) :-
    At1 #= At0 - 1,
    ( At0 #= 1 ->
        append(Acc0, [V, Head], Acc1),
        insert_at(V, Tail, At1, NLs, Acc1)
    ;
        append(Acc0, [Head], Acc1),
        insert_at(V, Tail, At1, NLs, Acc1)
    ).
