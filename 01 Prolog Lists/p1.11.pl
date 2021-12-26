/*

Modified run-length encoding.
Modify the result of problem 1.10 in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as [N,E] terms.

Example:
?- encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
X = [[4,a],b,[2,c],[2,a],d,[4,e]]

*/

:- use_module(library(clpfd)).

encode_modified(Ls, PLs) :-
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
	( Length #= 1 ->
	    append(Acc0, [Head], Acc1)
	;
	    append(Acc0, [[Length, Head]], Acc1)
	),
    encode_(RemainingTail, PLs, Acc1).