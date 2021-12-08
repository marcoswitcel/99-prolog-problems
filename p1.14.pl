/*

Duplicate the elements of a list.
Example:
?- dupli([a,b,c,c,d],X).
X = [a,a,b,b,c,c,c,c,d,d]

*/

list_duplicated(Ls, DLs) :-
    list_duplicated_(Ls, DLs, []).

list_duplicated_([], Acc, Acc).
list_duplicated_([Head|Tail], DLs, Acc0) :-
    append(Acc0, [Head, Head], Acc1),
    list_duplicated_(Tail, DLs, Acc1).