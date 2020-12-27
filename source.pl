list_ADD([],[],[]).
list_ADD([H1|T1],[H2|T2],[X|L3]):-list_ADD(T1,T2,L3), X is H1+H2.
/**
Takes each item from list 1 and the add-ons with items from list 2 and makes a list of 3
?-list_sum(First list,Second List,R).
*/

list_sub([],[],[]).
list_sub([H1|T1],[H2|T2],[X|L3]):-list_sub(T1,T2,L3), X is H1-H2.
/**
Takes each item from list 1 and subtracts the items from list 2 and makes a list of 3
?-list_sub(First list,Second List,R).
*/

list_mul([],[],[]).
list_mul([H1|T1],[H2|T2],[X|L3]):-list_mul(T1,T2,L3), X is H1*H2.
/**
Takes each item from list 1 and multiplies them by the items from list 2 and makes a 3 list
?-list_mul(First list,Second List,R).
*/

list_div([],[],[]).
list_div([H1|T1],[H2|T2],[X|L3]):-list_div(T1,T2,L3), X is H1/H2.
/**
Takes each item from list 1 and divides it by the items from list 2 and makes a list of 3
?-list_div(First list,Second List,R).
*/


list_sum([], 0).
list_sum([Head|Tail], Sum) :-
    is_list(Head),
    list_sum(Head, 0, Accumulator),
    list_sum(Tail, Accumulator, Sum).
list_sum([Head|Tail], Sum) :-
    \+ is_list(Head),
    list_sum(Tail, Head, Sum).
list_sum([], Accumulator, Accumulator).
list_sum([Head|Tail], Accumulator, Sum) :-
    is_list(Head),
    list_sum(Head, Accumulator, NextAccumulator),
    list_sum(Tail, NextAccumulator, Sum).
list_sum([Head|Tail], Accumulator, Sum) :-
    number(Head),
    NextAccumulator is Accumulator + Head,
    list_sum(Tail, NextAccumulator, Sum).
	
/**	
Add all the items in a list
?- list_sum([1,2,3],R). For one list
	
?- list_sum([[1,2,3],[4,5,6]],R). For two Lists
*/
