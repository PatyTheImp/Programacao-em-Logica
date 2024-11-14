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

married(pedro,ana).
owner(miguel,papagaio).

1{painted(H,C):cor(C)}1:-homem(H).
1{painted(H,C):homem(H)}1:-cor(C).

1{lives(M,H):casa(H)}1:-homem(M).
1{lives(M,H):homem(M)}1:-casa(H).

1{fan(M,C):clube(C)}1:-homem(M).
1{fan(M,C):homem(M)}1:-clube(C).

1{drinks(H,D):homem(H)}1:-bebida(D).
1{drinks(H,D):bebida(D)}1:-homem(H).

1{married(M,W):mulher(W)}1:-homem(M).
1{married(M,W):homem(M)}1:-mulher(W).

1{owner(W,A):homem(W)}1:-animal(A).
1{owner(W,A):animal(A)}1:-homem(W).

painted(F,vermelha):-sonof(carlos,F).
lives(G,1):-sonof(carlos,F),sonof(F,G).
fan(M,porto):-painted(M,amarela).
painted(M,amarela):-fan(M,porto).
livesbyside(M1,M2):-lives(M2,H),lives(M1,H+1).
livesbyside(M1,M2):-livesbyside(M2,M1).
fan(M,academica):-owner(M2,raposa),livesbyside(M,M2).
painted(M,azul):-livesbyside(pedro,M).
livesbyside(pedro,M):-painted(M,azul).
owner(M,tartaruga):-fan(M,sporting).
fan(M,sporting):-owner(M,tartaruga).
drinks(M,sumol):-fan(M,benfica).
drinks(F,cha):-sonof(miguel,F).
fan(S,belenenses):-sonof(S,daniel).
fan(M2,porto):-owner(M1,cavalo),livesbyside(M1,M2).
drinks(H,cafe):-painted(H,verde).
painted(H,verde):-drinks(H,cafe).
painted(M2,branca):-painted(M,verde),lives(M,C),lives(M2,C-1).
painted(M,verde):-painted(M2,branca),lives(M,C),lives(M2,C-1).
drinks(M,leite):-lives(M,3).
lives(M,3):-drinks(M,leite).

:-married(carlos,maria).

:-married(M1,W1),married(M2,W2),pref(M1,W1,X1),pref(M1,W2,X2),X1<X2,pref(W2,M2,Y1),pref(W2,M1,Y2),Y1<Y2.

#show lives/2.