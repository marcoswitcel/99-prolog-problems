/*

Flatten a nested list structure.
Transform a list, possibly holding lists as elements into a 'flat' list by replacing each list with its elements (recursively).
*/

list_flattened(Ls, FLs) :-
    list_flattened(Ls, FLs, []).
	
list_flattened([], Acc, Acc).
list_flattened([Head|Tail], RLs, Acc) :-
	(
	    is_list(Head) ->
		list_flattened(Head, Acc0, Acc),
		list_flattened(Tail, RLs, Acc0)
		;
		append(Acc, [Head], Acc0),
	    list_flattened(Tail, RLs, Acc0)	
	).
	
% list_flattened([[1,2],2,[1,[2,3],4],5], Ls).