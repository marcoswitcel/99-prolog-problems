/*
Find the last element of a list.

Example:
?- my_last(X,[a,b,c,d]).
X = d

*/

list_last([X], X).
list_last([_|Tail], X) :- list_last(Tail, X).

% Nota: função nativa "last/2" last(?List, ?Element) faz a mesma coisa