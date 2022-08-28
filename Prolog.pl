%Taller 2
%David Andres Duarte
%Hechos

publica(shaun,[v1,v3]).
publica(doug,[v4]).
publica(jorge,[v2,v5,v6]).
publica(alvin,[v6,v7]).

like(juan, [v1, v2, v3]).
like(pedro, [v2, v4, v4]).
like(maria, [v3, v4, v1]).
like(ana, [v4, v5, v2]).
like(marta, [v3,v2]).
like(grumpy, []).

%---------------
%Primer punto
%---------------
video(X) :- publica(_,Y), member(X,Y).
%------------------------------------------------
%---------------
%Segundo punto
%---------------
tamaño([],0).
tamaño([_|Y], N) :- tamaño(Y, N1), N is N1+1.
jaccard(X,Y,Z) :- sort(X,N1), sort(Y,N2), tamaño(N1,N3), tamaño(N2,N4), intersection(N1,N2,N5), tamaño(N5,N6), Z is N6/(N3 + N4 - N6).
%------------------------------------------------
%---------------
%Tercer punto
%---------------
colabora(Y,X):- publica(Y,N1), publica(X,N2), \+X == Y, intersection(N1,N2,N3), \+tamaño(N3,0).
%------------------------------------------------
%-------------
%Cuarto punto
%---------------
afinidadLikes(X,Y,A):-  like(X,N1), like(Y,N2), jaccard(N1,N2,A).
%------------------------------------------------
%-------------
%Quinto punto
%---------------
inserta(X,[],[X]).
inserta(X,[Y|Ys],[Y|Zs]) :- inserta(X,Ys,Zs).
canales(X,Y):- findall(N5,(like(X,N1), publica(_,N2), intersection(N1,N2,N3), \+tamaño(N3,0), publica(N5,N2)),Y).
%------------------------------------------------
%-------------
%Sexto punto
%-------------
afinidadCanales(X,Y,A) :- canales(X,N1), canales(Y,N2), jaccard(N1,N2,A).
%------------------------------------------------
%-------------
%Septimo punto
%-------------
recomendarAmigo(X,Y) :- afinidadLikes(X,Y,N2), afinidadCanales(X,Y,N1), (N1>0.5 ; N2>0.5),\+Y==X.