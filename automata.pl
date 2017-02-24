% 111 110 101 100 011 010 001 000
% The array of binary numbers corresponding to the eight patterns above strings dictates the pattern on the previous row:
% 00000100001
% This is composed of:[1]00, 000, 000, 000, 001, 010, 100, 000, 000, 001, 01[0]
% With the bracketed numbers indicating the supposed value because the ends wrap

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

oneDimensionalAutomata(InitialState, ControlArray) :-
    maplist(writeAutomata, InitialState), nl,
    get_first(InitialState, First),
    get_last(InitialState, Last),
    computeNext([Last|InitialState],ControlArray,NextPattern, First),
    (InitialState \= NextPattern -> oneDimensionalAutomata(NextPattern,ControlArray) ; true), !.
 
    
