% piotr jest rodzicem ewy
% ewa jest rodzicem ani
rodzic(piotr, ewa).
rodzic(ewa, ania).

 % przodek to rodzic
przodek(X, Y) :- rodzic(X, Y).

% przodek to rodzic przodka
przodek(X, Y) :- rodzic(X, Z), przodek(Z, Y).