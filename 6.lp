homem(miguel).
homem(joao).
homem(pedro).
homem(daniel).
homem(carlos).

mulher(maria).
mulher(paula).
mulher(carla).
mulher(filipa).
mulher(ana).

clube(porto).
clube(academica).
clube(sporting).
clube(benfica).
clube(belenenses).

animal(raposa).
animal(cavalo).
animal(tartaruga).
animal(papagaio).
animal(gato).

bebida(agua).
bebida(cha).
bebida(leite).
bebida(sumol).
bebida(cafe).

cor(amarela).
cor(azul).
cor(vermelha).
cor(branca).
cor(verde).

casa(1).
casa(2).
casa(3).
casa(4).
casa(5).

pref(miguel,paula,5).
pref(miguel,ana,4).
pref(miguel,maria,3).
pref(miguel,carla,2).
pref(miguel,filipa,1).

pref(maria,carlos,5).
pref(maria,miguel,4).
pref(maria,daniel,3).
pref(maria,joao,2).
pref(maria,pedro,1).

pref(joao,maria,5).
pref(joao,paula,4).
pref(joao,carla,3).
pref(joao,filipa,2).
pref(joao,ana,1).

pref(paula,daniel,5).
pref(paula,carlos,4).
pref(paula,joao,3).
pref(paula,miguel,2).
pref(paula,pedro,1).

pref(pedro,paula,5).
pref(pedro,carla,4).
pref(pedro,ana,3).
pref(pedro,filipa,2).
pref(pedro,maria,1).

pref(carla,miguel,5).
pref(carla,daniel,4).
pref(carla,joao,3).
pref(carla,pedro,2).
pref(carla,carlos,1).

pref(daniel,maria,5).
pref(daniel,carla,4).
pref(daniel,paula,3).
pref(daniel,filipa,2).
pref(daniel,ana,1).

pref(filipa,pedro,5).
pref(filipa,joao,4).
pref(filipa,daniel,3).
pref(filipa,miguel,2).
pref(filipa,carlos,1).

pref(carlos,ana,5).
pref(carlos,carla,4).
pref(carlos,paula,3).
pref(carlos,maria,2).
pref(carlos,filipa,1).

pref(ana,daniel,5).
pref(ana,joao,4).
pref(ana,pedro,3).
pref(ana,carlos,2).
pref(ana,miguel,1).

sonof(miguel,joao).
sonof(joao,pedro).
sonof(daniel,pedro).
sonof(carlos,daniel).

drinks(3,leite).
married(pedro,ana).

1{painted(H,C):cor(C)}1:-casa(H).
1{painted(H,C):casa(H)}1:-cor(C).

1{lives(M,H):casa(H)}1:-homem(M).
1{lives(M,H):homem(M)}1:-casa(H).

1{fan(M,C):clube(C)}1:-homem(M).
1{fan(M,C):homem(M)}1:-clube(C).

1{drinks(H,D):casa(H)}1:-bebida(D).
1{drinks(H,D):bebida(D)}1:-casa(H).

1{married(M,W):mulher(W)}1:-homem(M).
1{married(M,W):homem(M)}1:-mulher(W).

1{owner(W,A):mulher(W)}1:-animal(A).
1{owner(W,A):animal(A)}1:-mulher(W).

painted(H,vermelha):-sonof(carlos,F), lives(F,H).
owner(W,papagaio):-married(miguel,W).
lives(G,1):-sonof(carlos,F),sonof(F,G).
fan(M,porto):-lives(M,amarela).
livesbyside(M1,M2):-lives(M2,H),lives(M1,H+1).
livesbyside(M1,M2):-livesbyside(M2,M1).
fan(M,academica):-owner(W,raposa),married(M2,W),livesbyside(M,M2).
livesbyside(pedro,M):-painted(H,azul),lives(M,H).
owner(W,tartaruga):-married(W,M),fan(M,sporting).
drinks(H,sumol):-fan(M,benfica),lives(M,H).
drinks(H,cha):-sonof(miguel,F),lives(F,H).
fan(S,belenenses):-sonof(S,daniel).
fan(M1,porto):-owner(W,cavalo),married(M2,W),livesbyside(M1,M2).
drinks(H,cha):-painted(H,verde).
painted(H-1,branca):-painted(H,verde).

:-married(carlos,maria).

:-married(M1,W1),married(M2,W2),pref(M1,W1,X1),pref(M1,W2,X2),X1<X2,pref(W2,M2,Y1),pref(W2,M1,Y2),Y1<Y2.

#show owner/2.