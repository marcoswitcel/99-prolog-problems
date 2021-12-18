/*

Remove the K'th element from a list.
Example:
?- remove_at(X,[a,b,c,d],2,R).
X = b
R = [a,c,d]

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