/*

Extract a given number of randomly selected elements from a list.
The selected items shall be put into a result list.
Example:
?- rnd_select([a,b,c,d,e,f,g,h],3,L).
L = [e,d,a]

*/

:- use_module(library(clpfd)).

list_element_k(Ls, Element, K) :-
    list_element_k_(Ls, Element, K, 1).

list_element_k_([Head|_], Head, K, K).
list_element_k_([_|Tail], Element, K, Acc) :-
    AccNext is Acc + 1,
    list_element_k_(Tail, Element, K, AccNext).

list_size_random_element(Ls, UpperLimit, Element) :-
    random(1, UpperLimit, K),
    list_element_k(Ls, Element, K).

rnd_select(Ls, NLsLength, NLs) :-
    length(Ls, LsLength),
    UpperLimit #= LsLength + 1,
    length(NLs, NLsLength),
    maplist(list_size_random_element(Ls, UpperLimit), NLs).