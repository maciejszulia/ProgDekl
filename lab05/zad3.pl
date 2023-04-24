urodzony(jan, 1974).
urodzony(ludwik, 1976).
urodzony(maciej, 1960).
urodzony(grzegorz, 1975).

starszy(X, Y) :-
    urodzony(X, RokUrodzeniaX),
    urodzony(Y, RokUrodzeniaY),
    RokUrodzeniaX < RokUrodzeniaY.
