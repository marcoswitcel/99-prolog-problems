/*

Determine whether a given integer number is prime.
Example:
?- is_prime(7).
Yes

*/

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
    2 * F0 < N,
    F is F0 + 2,
    has_factors(N, F).

has_factors(N, F0, Found) :-
    is_factor(N, F0),
    Found = F0;
    2 * F0 < N,
    F is F0 + 2,
    has_factors(N, F, Found).
