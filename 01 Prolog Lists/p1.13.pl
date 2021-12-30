/*

Run-length encoding of a list (direct solution).
Implement the so-called run-length encoding data compression method directly. I.e. don't explicitly create the sublists containing the duplicates, as in problem 1.09, but only count them. As in problem 1.11, simplify the result list by replacing the singleton terms [1,X] by X.

Example:
?- encode_direct([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
X = [[4,a],b,[2,c],[2,a],d,[4,e]]

*/

:- use_module(library(clpfd)).

encode_direct(Ls, ELs) :-
    encode_direct_(Ls, ELs, 1, []).

encode_sublist(Ls, 1, Head, NLs):-
    append(Ls, [Head], NLs).

encode_sublist(Ls, N, Head, NLs):-
    N #\= 1,
    append(Ls, [[N, Head]], NLs).
    
	
encode_direct_([], Acc, _, Acc).
encode_direct_([Head|Tail], ELs, N0, Acc0) :-
    ([NextHead|_] = Tail ->
	   (dif(Head, NextHead) ->
			encode_sublist(Acc0, N0, Head, Acc),
			encode_direct_(Tail, ELs, 1, Acc)
		;
			N #= N0 + 1,
			encode_direct_(Tail, ELs, N, Acc0)
		)
	;
	    
		encode_sublist(Acc0, N0, Head, Acc),
		encode_direct_(Tail, ELs, 1, Acc)
	).