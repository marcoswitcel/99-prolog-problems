/*

Lotto: Draw N different random numbers from the set 1..M.
The selected numbers shall be put into a result list.
Example:
?- lotto(6,49,L).
L = [23,1,17,33,21,37]

Hint: Combine the solutions of problems 1.22 and 1.23.

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

lotto(N, M, Ls) :-
   range(1, M, RLs),
   rnd_select(RLs, N, Ls).
    