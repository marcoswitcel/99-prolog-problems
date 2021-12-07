/*

Eliminate consecutive duplicates of list elements.
If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.

*/

list_packed(Ls, PLs) :-
    list_packed_(Ls, PLs, []).

list_packed_(_, [], NSubList, NTail, Acc0) :-
    NSubList = Acc0,
	NTail = [].
	
list_packed_(Head, [THead|Tail], NSubList, NTail, Acc0) :-
    ( dif(Head, THead) ->
		NSubList = Acc0,
		NTail = [THead|Tail]
	;
		append(Acc0, [Head], Acc1),
		list_packed_(Head, Tail, NSubList, NTail, Acc1)
	).
	
list_packed_([], Acc, Acc).
list_packed_([Head|Tail], PLs, Acc0) :-
    list_packed_(Head, Tail, NSubList, RemainingTail, [Head]),
	append(Acc0, [NSubList], Acc1),
    list_packed_(RemainingTail, PLs, Acc1).
    
	