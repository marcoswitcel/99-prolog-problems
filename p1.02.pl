/*
Find the last but one element of a list.
(de: zweitletztes Element, fr: avant-dernier élément)

*/

list_last_but_one([Lbo, _], Lbo).
list_last_but_one([_|Tail], X) :-
    list_last_but_one(Tail, X).