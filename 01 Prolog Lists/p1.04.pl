/*
Find the number of elements of a list.
*/

list_length([], 0).
list_length([_|Tail], Length) :-
    list_length(Tail, L0),
    Length is L0 + 1.