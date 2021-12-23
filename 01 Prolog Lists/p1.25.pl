/*

Generate a random permutation of the elements of a list.
Example:
?- rnd_permu([a,b,c,d,e,f],L).
L = [b,a,d,c,e,f]

Hint: Use the solution of problem 1.23.

*/

:- use_module(library(clpfd)).

remove_at(Who, Ls, At, NLs) :-
    remove_at(Who, Ls, At, 1, NLs, []).

remove_at(_, [], _, _, Acc, Acc).
remove_at(Who, [Head|Tail], At, Count0, NLs, Acc0) :-
    Count1 #= Count0 + 1,
    ( Count0 #= At ->
	    Who = Head,
		remove_at(Who, Tail, At, Count1, NLs, Acc0)
	;
	    append(Acc0, [Head], Acc1),
		remove_at(Who, Tail, At, Count1, NLs, Acc1)
	).

list_element_k(Ls, Element, K) :-
    list_element_k_(Ls, Element, K, 1).
	
list_element_k_([Head|_], Head, K, K).
list_element_k_([_|Tail], Element, K, Acc) :-
    AccNext is Acc + 1,
    list_element_k_(Tail, Element, K, AccNext).

rnd_permu(Ls, NLs) :-
    rnd_permu(Ls, NLs, []).
	
rnd_permu([], NLs, NLs).
rnd_permu(Ls, NLs, Acc0) :- 
    length(Ls, Length),
	UpperLimit #= Length + 1,
	random(1, UpperLimit, Random),
	list_element_k(Ls, Element, Random),
	remove_at(_, Ls, Random, ListWithout),
	append(Acc0, [Element], Acc),
	rnd_permu(ListWithout, NLs, Acc).
	
	