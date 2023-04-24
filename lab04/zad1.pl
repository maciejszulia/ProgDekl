%program: dziadek

/*1*/ojciec(karol,jan).
% karol jest ojcem jana
/*2*/ojciec(karol,adam).
% karol jest ojcem adama

/*3*/dziecko(tomasz,jan).
% tomasz jest dzieckiem jana
/*4*/dziecko(piotr,adam).
% piotr jest dzieckiem adama

/*5*/dziadek(karol,marek).
% karol jest dziadkiem marka
/*6*/dziadek(X,Y):-ojciec(X,Z),dziecko(Y,Z).
% X jest dziadkiem Y jeżeli X jest ojcem Z i Y jest dzieckiem Z