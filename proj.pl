% ProgDekl Projekt zespołowy

% Maciej Szulia, Michał Naumowicz

% UWM WMII 22.05.2023


% Perfumy


% wyświetla liste perfum
%
dostepne_perfumy(['dior', 'guess', 'lacoste','axe','gucci','prada']).

% wywołanie - dostepne_perfumy(Perfumy).


% przypisuje ceny do perfum

cena('dior', 100).
cena('guess', 50).
cena('lacoste', 80).
cena('axe', 30).
cena('gucci', 500).
cena('prada', 150).

% wywołanie - cena(X,Y). X=perfuma, Y=cena.


% liczy ceny perfum
policz_cene_perfum(Perfumy, Cena) :-
    policz_cene_perfum(Perfumy, 0, Cena).

policz_cene_perfum([], Acc, Acc).
policz_cene_perfum([Perfum|Reszta], Acc, Cena) :-
    cena(Perfum, CenaPerfum),
    Acc1 is Acc + CenaPerfum,
    policz_cene_perfum(Reszta, Acc1, Cena).
% Przykładowe wywołanie: policz_cene_perfum(['dior', 'guess', 'lacoste'],
% Cena). zwróci wartość Cena = 230,Cena = zmienna do której ma
% przypisać cenę może byc X.



% Funkcja wyszukująca perfumy do danej ceny
perfumy_do_ceny(Cena) :-
    dostepne_perfumy(Perfumy),
    findall(Perfuma, (member(Perfuma, Perfumy), cena(Perfuma, CenaPerfumy), CenaPerfumy =< Cena), PerfumyDoCeny),
    write('Perfumy do ceny '), write(Cena), write(': '), write(PerfumyDoCeny), nl.

% Przykładowe wywołanie: perfumy_do_ceny(100). Wyświetli Perfumy do ceny 100: ['dior', 'guess', 'lacoste', 'axe', 'prada'].

% Funkcja wyszukująca perfumy o danej cenie
perfumy_o_cenie(Cena) :-
    dostepne_perfumy(Perfumy),
    findall(Perfuma, (member(Perfuma, Perfumy), cena(Perfuma, CenaPerfumy), CenaPerfumy = Cena), PerfumyOCenie),
    write('Perfumy o cenie '), write(Cena), write(': '), write(PerfumyOCenie), nl.

% Przykładowe wywołanie: perfumy_o_cenie(80). Wyświetli Perfumy o cenie 80: ['dior', 'lacoste', 'prada'].

% Funkcja wyszukująca perfumy od danej ceny
perfumy_od_ceny(Cena) :-
    dostepne_perfumy(Perfumy),
    findall(Perfuma, (member(Perfuma, Perfumy), cena(Perfuma, CenaPerfumy), CenaPerfumy >= Cena), PerfumyOdCeny),
    write('Perfumy od ceny '), write(Cena), write(': '), write(PerfumyOdCeny), nl.

% Przykładowe wywołanie: perfumy_od_ceny(100). Wyświetli Perfumy od ceny 100: ['dior', 'gucci', 'prada'].



% Przypisuje ilość sztuk dostępnych perfum
ilosc_dostepnych_perfum('dior', 100).
ilosc_dostepnych_perfum('guess', 50).
ilosc_dostepnych_perfum('lacoste', 18).
ilosc_dostepnych_perfum('axe', 152).
ilosc_dostepnych_perfum('gucci', 13).
ilosc_dostepnych_perfum('prada', 152).

% Sprawdza ilość dostępnych sztuk danej perfumy
ile_sztuk_perfum(Perfuma, Ilosc) :-
    ilosc_dostepnych_perfum(Perfuma, Ilosc).
% ile_sztuk_perfum('dior', Ilosc). Ilosc = 100, Ilosc = zmienna do
% której ma przypisać ilość może byc X .


% Wyświetla informacje o ilości dostępnych perfum
wyswietl_ilosc_dostepnych_perfum :-
    dostepne_perfumy(Perfumy),
    wyswietl_ilosc_dostepnych_perfum(Perfumy).

wyswietl_ilosc_dostepnych_perfum([]).
wyswietl_ilosc_dostepnych_perfum([Perfuma|Reszta]) :-
    ile_sztuk_perfum(Perfuma, Ilosc),
    format('~w - dostępnych sztuk: ~w~n', [Perfuma, Ilosc]),
    wyswietl_ilosc_dostepnych_perfum(Reszta).

%wywołanie - wyswietl_ilosc_dostepnych_perfum.



% wyświetla nazwy perfum, których ilość jest większa niż podana liczba
perfumy_ilosc_wieksza_niz(Ilosc) :-
    dostepne_perfumy(Perfumy),
    findall(Perfuma, (member(Perfuma, Perfumy), ile_sztuk_perfum(Perfuma, IloscDost), IloscDost > Ilosc), PerfumyIloscWieksza),
    write('Perfumy, których ilość jest większa niż '), write(Ilosc), write(': '), write(PerfumyIloscWieksza), nl.
%perfumy_ilosc_wieksza_niz(50). =[dior,axe,prada]


% wyświetla nazwy perfum, których ilość jest mniejsza niż podana liczba
perfumy_ilosc_mniejsza_niz(Ilosc) :-
    dostepne_perfumy(Perfumy),
    findall(Perfuma, (member(Perfuma, Perfumy), ile_sztuk_perfum(Perfuma, IloscDost), IloscDost < Ilosc), PerfumyIloscMniejsza),
    write('Perfumy, których ilość jest mniejsza niż '), write(Ilosc), write(': '), write(PerfumyIloscMniejsza), nl.
%perfumy_ilosc_mniejsza_niz(20). =  [lacoste,gucci]




% wyświetla składniki perfum
skladniki('dior', ['Róża', 'Cytryna', 'Śliwka']).
skladniki('guess', ['Drzewo sandałowe', 'Cytryna']).
skladniki('lacoste', ['Wanilia', 'Róża']).
skladniki('axe', ['Wanilia', 'Ambra']).
skladniki('gucci', ['Cytryna', 'Wanilia', 'Róża']).
skladniki('prada', ['Imbir', 'Mentol', 'Jaśmin']).



% wyszukuje perfumy na podstawie składnika
wyszukaj_perfume_po_składniku(Składnik) :-
    dostepne_perfumy(Perfumy),
    findall(Perfuma, (member(Perfuma, Perfumy), zawiera_składnik(Perfuma, Składnik)), ZnalezionePerfumy),
    write('Perfumy zawierające składnik '), write(Składnik), write(': '), write(ZnalezionePerfumy), nl.

zawiera_składnik(Perfuma, Składnik) :-
    skladniki(Perfuma, Składniki),
    member(Składnik, Składniki).
%wywołanie - wyszukaj_perfume_po_składniku(Składnik).



% jakie składniki ma perfuma
jakie_składniki_ma_perfuma(Perfuma) :-
    skladniki(Perfuma, Składniki),
    write('Składniki perfumy '), write(Perfuma), write(': '), write(Składniki), nl.
%wywołanie - jakie_składniki_ma_perfuma(Perfuma).



%!!!!!!!! WYMAGANE DO DZIAŁANIA KOSZYKA !!!!!!!!!!!! TWORZY KOSZYK :)
%?- init_koszyk.
% true.

%?- dodaj_do_koszyka(['dior', 'guess', 'lacoste']).
%Dodano do koszyka: ['dior','guess','lacoste']
%true.

%?- dodaj_do_koszyka(['axe', 'gucci']).
%Dodano do koszyka: ['axe','gucci']
%true.

%?- wyswietl_koszyk.
%Zawartość koszyka: ['dior','guess','lacoste','axe','gucci']
%true.

%?- usun_z_koszyka(['dior', 'lacoste']).
%Usunięto z koszyka: ['dior','lacoste']
%true.

%?- wyswietl_koszyk.
%Zawartość koszyka: ['guess','axe','gucci']
%true.

%?- wyczysc_koszyk.
%Koszyk został wyczyszczony.
%true.

% ?- sumuj_ceny_koszyka(Suma).
% Suma cen perfum w koszyku: 180
% Suma = 180.


:- dynamic(koszyk/1).

% Inicjalizacja pustego koszyka
init_koszyk :-
    retractall(koszyk(_)),
    assertz(koszyk([])).

% Sprawdzenie, czy wszystkie perfumy są dostępne
perfumy_dostepne([]).
perfumy_dostepne([Perfuma | Reszta]) :-
    dostepne_perfumy(Dostepne),
    member(Perfuma, Dostepne),
    perfumy_dostepne(Reszta).

% Dodanie perfum do koszyka
dodaj_do_koszyka(Perfumy) :-
    perfumy_dostepne(Perfumy),
    koszyk(Koszyk),
    append(Koszyk, Perfumy, NowyKoszyk),
    retractall(koszyk(_)),
    assertz(koszyk(NowyKoszyk)),
    write('Dodano do koszyka: '), write(Perfumy), nl.

% Usunięcie perfum z koszyka
usun_z_koszyka(Perfumy) :-
    koszyk(Koszyk),
    subtract(Koszyk, Perfumy, NowyKoszyk),
    retractall(koszyk(_)),
    assertz(koszyk(NowyKoszyk)),
    write('Usunięto z koszyka: '), write(Perfumy), nl.

% Wyświetlenie zawartości koszyka
wyswietl_koszyk :-
    koszyk(Koszyk),
    write('Zawartość koszyka: '), write(Koszyk), nl.

% Wyczyszczenie koszyka
wyczysc_koszyk :-
    retractall(koszyk(_)),
    assertz(koszyk([])),
    write('Koszyk został wyczyszczony.'), nl.


% Sumuje ceny perfum w koszyku
sumuj_ceny_koszyka(Suma) :-
    koszyk(Koszyk),
    policz_cene_perfum(Koszyk, Suma),
    write('Suma cen perfum w koszyku: '), write(Suma), nl.



% wywołanie - jakie_składniki_ma_perfuma(Perfuma, Składniki).

% wyświetla czy perfumy zawieraja alkohol

zawiera_alkohol(dior).
zawiera_alkohol(guess).


% wyświetla czy perfumy zawieraja alergeny

zawiera_alergeny(lacoste).
zawiera_alergeny(axe).



% wyswietla czy perfumy moga byc stosowane z chorobami dermatologicznymi (mogą byc stosowane gdy NIE maja alkoholu i alernegow)

% moze_byc_stosowane_przy_chorobach_skory zwraca true gdy perfuma NIE ma alkoholu i NIE ma alergenow

moze_byc_stosowane_przy_chorobach_skory(Perfuma) :-

    \+ zawiera_alkohol(Perfuma),      %  nie zawiera alkoholu
    \+ zawiera_alergeny(Perfuma).      %  nie zawiera alergenów


% Wyświetla informacje o tym, czy perfumy mogą być stosowane z chorobami dermatologicznymi

wyswietl_stosowane_perfumy :-

    dostepne_perfumy(Perfumy),

    wyswietl_stosowane_perfumy(Perfumy).


wyswietl_stosowane_perfumy([]).

wyswietl_stosowane_perfumy([Perfuma|Reszta]) :-

    (moze_byc_stosowane_przy_chorobach_skory(Perfuma) ->

        format('~w - mozna stosowac z chorobami dermatologicznymi.~n', [Perfuma])

    ;

        format('~w - nie mozna stosowac z chorobami dermatologicznymi.~n', [Perfuma])

    ),

    wyswietl_stosowane_perfumy(Reszta).