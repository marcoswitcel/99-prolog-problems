/*

Run-length encoding of a list.
Use the result of problem 1.09 to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as terms [N,E] where N is the number of duplicates of the element E.

Example:
?- encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
X = [[4,a],[1,b],[2,c],[2,a],[1,d],[4,e]]

*/

encode(Ls, PLs) :-
    encode_(Ls, PLs, []).

encode_(_, [], NSubList, NTail, Acc0) :-
    NSubList = Acc0,
    NTail = [].

encode_(Head, [THead|Tail], NSubList, NTail, Acc0) :-
    ( dif(Head, THead) ->
        NSubList = Acc0,
        NTail = [THead|Tail]
    ;
        append(Acc0, [Head], Acc1),
        encode_(Head, Tail, NSubList, NTail, Acc1)
    ).

encode_([], Acc, Acc).
encode_([Head|Tail], PLs, Acc0) :-
    encode_(Head, Tail, NSubList, RemainingTail, [Head]),
    length(NSubList, Length),
    append(Acc0, [[Length, Head]], Acc1),
    encode_(RemainingTail, PLs, Acc1).
