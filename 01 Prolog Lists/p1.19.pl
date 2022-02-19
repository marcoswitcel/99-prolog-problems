/*

 Rotate a list N places to the left.
Examples:
?- rotate([a,b,c,d,e,f,g,h],3,X).
X = [d,e,f,g,h,a,b,c]

?- rotate([a,b,c,d,e,f,g,h],-2,X).
X = [g,h,a,b,c,d,e,f]

Hint: Use the predefined predicates length/2 and append/3, as well as the result of problem 1.17.

*/

:- use_module(library(clpfd)).

list_butlast([_], []).
list_butlast([Head|Tail], [Head|TailWithoutLast]) :-
    list_butlast(Tail, TailWithoutLast).

rotate(NLs, 0, NLs).
rotate(Ls, Value0, RLs) :-
    Value0 #\= 0,
    ( Value0 #> 0 ->
        Ls = [Head|Tail],
        append(Tail, [Head], Acc1),
        Value1 #= Value0 - 1,
        rotate(Acc1, Value1, RLs)
    ;
        last(Ls, Last),
        list_butlast(Ls, LsWihoutLast),
        Acc1 = [Last|LsWihoutLast],
        Value1 #= Value0 + 1,
        rotate(Acc1, Value1, RLs)
    ).