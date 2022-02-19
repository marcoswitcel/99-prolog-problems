/*

Determine the prime factors of a given positive integer.
Construct a flat list containing the prime factors in ascending order.
Example:
?- prime_factors(315, L).
L = [3,3,5,7]

*/

:- use_module(library(clpfd)).

is_prime(2).
is_prime(3).
is_prime(N) :-
    integer(N),
    N > 3,
    N mod 2 =\= 0,
    \+ has_factors(N, 3).


is_factor(N, F) :- N mod F =:= 0.
has_factors(N, F0) :-
    is_factor(N, F0);
    F0 * F0 < N,
    F is F0 + 2,
    has_factors(N, F).

has_prime_factors(N, Found) :-
    N #> 3,
    has_prime_factors(N, 2, Found).

has_prime_factors(N, F0, Found) :-
    is_factor(N, F0),
    is_prime(F0),
    Found = F0;
    F0 * F0 #< N + 1,
    F is F0 + 1,
    has_prime_factors(N, F, Found).

prime_factors_list(N, List) :-
    bagof(Factor, has_prime_factors(N, Factor), List).

prime_factors(N, List) :-
    prime_factors_list(N, Factors),
    prime_factors(N, List, [], Factors).

prime_factors(_, Acc, Acc, []).
prime_factors(N0, List, Acc0, [Head|Tail]) :-
    (N0 mod Head =:= 0 ->
        N #= N0 // Head,
        append(Acc0, [Head], Acc),
        prime_factors(N, List, Acc, [Head|Tail])
    ;
        prime_factors(N0, List, Acc0, Tail)
    ).
