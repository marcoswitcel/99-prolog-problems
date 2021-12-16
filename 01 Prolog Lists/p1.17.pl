/*

Split a list into two parts; the length of the first part is given.
Do not use any predefined predicates.

Example:
?- split([a,b,c,d,e,f,g,h,i,k],3,L1,L2).
L1 = [a,b,c]
L2 = [d,e,f,g,h,i,k]

*/

:- use_module(library(clpfd)).

list_length_splitted_sists(Ls, L, FLs, RLs) :-
    list_length_splitted_sists_(Ls, L, FLs, [], RLs).

list_length_splitted_sists_([], _, FLs, FLs, []).
list_length_splitted_sists_(Tail, 0, FLs, FLs, Tail).
list_length_splitted_sists_([Head|Tail], L0, FLs, FLsAcc0, RLs) :-
    L0 #> 0,
	append(FLsAcc0, [Head], FLsAcc1),
	L1 #= L0 - 1,
    list_length_splitted_sists_(Tail, L1, FLs, FLsAcc1, RLs).