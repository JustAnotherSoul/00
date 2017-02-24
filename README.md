# 00
0x00

Automata:

oneDimensionalAutomata(<InitialState>, <ControlArray>).
Control array relates to the previous row and each element determines the fate of the middle cell in the pattern: [000,001,010,011,100,101,110,111]. This decision was made because the index of the array corresponds to the binary encoding it maps to.

Patterns loop: For example the pattern [0,1,0,1] is processed as the following triplets
  [{1}01, 010, 101, 01{0}] with the bracketed numbers being the wrapped digits.
  If the control array were, say, [0,0,0,0,0,1,0,1] the next row would be [1,0,1,0].

Relevant topics:
* Cellular Automaton (Rule 110 is turing complete)
* One-dimensional Automaton
