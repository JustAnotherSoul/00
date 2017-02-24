% 111 110 101 100 011 010 001 000
% The eight above strings dictates the pattern on the previous row:
% 00000100000
% This is composed of:[0]00, 000, 000, 000, 001, 010, 100, 000, 000, 000, 00[0]
% WIth the bracketed numbers indicating that there is an assumption of 0's at either end

%Takes an initial list, control list, and output list and fills in output list
computeNext([0,0,0 | T], Control, [X | T2], First) :- get(0, Control, X), computeNext([0,0 | T], Control, T2, First).
computeNext([0,0,1 | T], Control, [X | T2], First) :- get(1, Control, X), computeNext([0,1 | T], Control, T2, First). 
computeNext([0,1,0 | T], Control, [X | T2], First) :- get(2, Control, X), computeNext([1,0 | T], Control, T2, First). 
computeNext([0,1,1 | T], Control, [X | T2], First) :- get(3, Control, X), computeNext([1,1 | T], Control, T2, First). 
computeNext([1,0,0 | T], Control, [X | T2], First) :- get(4, Control, X), computeNext([0,0 | T], Control, T2, First). 
computeNext([1,0,1 | T], Control, [X | T2], First) :- get(5, Control, X), computeNext([0,1 | T], Control, T2, First). 
computeNext([1,1,0 | T], Control, [X | T2], First) :- get(6, Control, X), computeNext([1,0 | T], Control, T2, First). 
computeNext([1,1,1 | T], Control, [X | T2], First) :- get(7, Control, X), computeNext([1,1 | T], Control, T2, First). 

computeNext([0,0], Control, [X], 0) :- get(0, Control, X).
computeNext([0,0], Control, [X], 1) :- get(1, Control, X).
computeNext([0,1], Control, [X], 0) :- get(2, Control, X).
computeNext([0,1], Control, [X], 1) :- get(3, Control, X).
computeNext([1,0], Control, [X], 0) :- get(4, Control, X).
computeNext([1,0], Control, [X], 1) :- get(5, Control, X).
computeNext([1,1], Control, [X], 0) :- get(6, Control, X).
computeNext([1,1], Control, [X], 1) :- get(7, Control, X).

get(N, [H|T], X) :- N>0, I is N-1, get(I, T, X).
get(0, [H|T], H).

writeAutomata(0) :-
    write('.').
writeAutomata(1) :-
    write('#').

get_first([H|T], H).

get_last([H],H).
get_last([H|T], Last) :- get_last(T, Last).

oneDimensionalAutomata(A,B) :-
    maplist(writeAutomata, A), nl,
    get_first(A, First),
    get_last(A, Last),
    computeNext([Last|A],B,C, First),
    (A \= C -> oneDimensionalAutomata(C,B) ; true), !.
 
    
