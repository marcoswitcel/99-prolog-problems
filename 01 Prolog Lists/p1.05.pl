/*

Reverse a list.

O.B.S: Olhe a solução da questão 5 para ver como ela é capaz de terminar

*/


list_reversed([], []).
list_reversed(Ls, Rs):-
    list_reversed(Ls, Rs, []).

list_reversed([], Acc, Acc).
list_reversed([Head|Tail], RLs, Acc) :-
    RLs0 = [Head|Acc],
	list_reversed(Tail, RLs, RLs0).