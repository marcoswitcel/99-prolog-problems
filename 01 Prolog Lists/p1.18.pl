/*

Extract a slice from a list.
Given two indices, I and K, the slice is the list containing the elements between the I'th and K'th element of the original list (both limits included). Start counting the elements with 1.

Example:
?- slice([a,b,c,d,e,f,g,h,i,k],3,7,L).
 L = [c,d,e,f,g]
 
*/

:- use_module(library(clpfd)).

slice(Ls, Start, End, SLs) :-
    (
	    End #> Start
	;
	    End #= Start
	),
    slice(Ls, Start, End, SLs, 1, []).

slice([Head|_], _, End, SLs, Counter0, Acc0) :-
    Counter0 #= End,
	append(Acc0, [Head], Acc1),
	SLs = Acc1.
slice([Head|Tail], Start, End, SLs, Counter0, Acc0) :-

    Counter1 #= Counter0 + 1,
	Counter0 #< End,
	( Counter1 #> Start ->
	    append(Acc0, [Head], Acc1),
	    slice(Tail, Start, End, SLs, Counter1, Acc1)
	;
	    slice(Tail, Start, End, SLs, Counter1, Acc0)
	).