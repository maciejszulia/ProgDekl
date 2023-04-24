% Rozpoznawanie wielomianów jedenej zmiennej
% o współczynnikach liczbowych

/* def.: rekurencja strukturalna

1) x jest wielomianem zmiennej x
c - liczba jest wielomianem dowolnej zmiennej

2) Jeżeli w, w1, w2 są wielomianami zmiennej x, to
-w, w1+w2, w1-w2, w1*w2, w^N (N - liczba naturalna)
są wielomianami zmiennej x */

% wielomian(w,x) spełniony, gdy w jest wielomianem zmiennej x
% o współczynnikach liczbowych
% definicja rekurencyjna

% warunki zakończenia rekurencji
wielomian(X,X).
wielomian(C,_):-number(C).

% rekurencja
wielomian(-W,X):-wielomian(W,X).
wielomian(W1+W2,X):-wielomian(W1,X),wielomian(W2,X).
wielomian(W1-W2,X):-wielomian(W1,X),wielomian(W2,X).
wielomian(W1*W2,X):-wielomian(W1,X),wielomian(W2,X).
wielomian(W^N,X):-integer(N), N>1, wielomian(W,X).

% Maciej Szulia
