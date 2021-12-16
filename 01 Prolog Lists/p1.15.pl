/*

Duplicate the elements of a list a given number of times.
Example:
?- dupli([a,b,c],3,X).
X = [a,a,a,b,b,b,c,c,c]

*/
:- use_module(library(clpfd)).

list_times_repliaced(Ls, Times, RLs) :-
    list_times_repliaced(Ls, Times, RLs, []).

appendN(NLs, _, 0, NLs).
appendN(Acc0, Ls, Times, NLs) :-
    Times #> 0,
	NewTimes #= Times - 1,
	append(Acc0, Ls, Acc1),
    appendN(Acc1, Ls, NewTimes, NLs).
    
	
list_times_repliaced([], _, Acc, Acc).
list_times_repliaced([Head|Tail], Times, RLs, Acc0) :-
    appendN(Acc0, [Head], Times, Acc1),
    list_times_repliaced(Tail, Times, RLs, Acc1).