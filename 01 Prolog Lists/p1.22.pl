/*

Create a list containing all integers within a given range.
Example:
?- range(4,9,L).
L = [4,5,6,7,8,9]

*/

:- use_module(library(clpfd)).

range(Start, End, Ls) :-
    ( Start #> End ->
	    Dir = -1
	;
	    Dir = 1
	),
    range_(Start, End, Ls, Dir, []).

range_(Current0, End, Ls, Dir, Acc0) :-
    ( Current0 #\= End ->
	    append(Acc0, [Current0], Acc1),
		Current #= Current0 + Dir,
	    range_(Current, End, Ls, Dir, Acc1)
	;
		append(Acc0, [Current0], Acc1),
	    Ls = Acc1
	).