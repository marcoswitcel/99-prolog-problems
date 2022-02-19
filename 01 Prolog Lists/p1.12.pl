/*

Decode a run-length encoded list.
Given a run-length code list generated as specified in problem 1.11. Construct its uncompressed version.

*/

decode(ELs, Ls) :-
    decode_(ELs, Ls, []).

returnAtom(Atom, Atom).
    
decode_([], Acc, Acc).
decode_([Head|Tail], Ls, Acc0) :-
    (atom(Head) ->
        append(Acc0, [Head], Acc)
    ;
        =([Length, Atom], Head),
        length(List, Length),
        maplist(returnAtom(Atom), List),
        append(Acc0, List, Acc)
    ),
    decode_(Tail, Ls, Acc).
