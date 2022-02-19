/*

Eliminate consecutive duplicates of list elements.
If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.

*/

list_compressed(Ls, CLs) :-
    list_compressed(Ls, CLs, []).

list_compressed([], CLs, CLs).
list_compressed([Head|Tail], CLs, Acc) :-
    ( [NextHead|_] = Tail, dif(Head, NextHead) ->
            append(Acc, [Head], Acc1),
            list_compressed(Tail,CLs, Acc1)
        ;
            list_compressed(Tail,CLs, Acc)
    ).
