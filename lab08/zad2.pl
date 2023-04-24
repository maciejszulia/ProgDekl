% Maciej Szulia nr 16

f0(X,Y):-between(17,19,X),between(X,20,Y).
f0(21,21).

f1(X,Y):-!,between(17,19,X),between(X,20,Y).
f1(21,21).

f2(X,Y):-between(17,19,X),between(X,20,Y).
f2(21,21).

f3(X,Y):-between(17,19,X),between(X,20,Y),!.
f3(21,21).

