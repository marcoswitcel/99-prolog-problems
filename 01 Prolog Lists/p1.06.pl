/*

Find out whether a list is a palindrome.
A palindrome can be read forward or backward; e.g. [x,a,m,a,x].

*/

list_reversed([], []).
list_reversed(Ls, Rs):-
    list_reversed(Ls, Rs, []).

list_reversed([], Acc, Acc).
list_reversed([Head|Tail], RLs, Acc) :-
    RLs0 = [Head|Acc],
	list_reversed(Tail, RLs, RLs0).
	
list_palindrome(Ls) :-
    list_reversed(Ls, RLs),
	maplist(=, Ls, RLs).