/*
Find the K'th element of a list.
The first element in the list is number 1.
Example:
?- element_at(X,[a,b,c,d,e],3).
X = c
*/

test(K) :- K = 1, integer(K).

list_element_k(Ls, Element, K) :-
    var(K),
    list_element_k_(Ls, Element, K, 1);
	integer(K),
	list_element_kb_(Ls, Element, K, 1).

% unbound K element	
list_element_k_([Head|_], Head, K, K).
list_element_k_([_|Tail], Element, K, Acc) :-
    AccNext is Acc + 1,
    list_element_k_(Tail, Element, K, AccNext).

% bound K element
list_element_kb_([Head|_], Head, K, K).
list_element_kb_([_|Tail], Element, K, Acc) :-
    K =\= Acc,
    AccNext is Acc + 1,
    list_element_kb_(Tail, Element, K, AccNext).