node(1). node(2). node(3). node(4). 
edge(1,2). edge(1,3). edge(2,3). edge(2,4). 
edge(3,2). edge(3,4). edge(4,1). edge(4,2).

1{cycle(X,Y) : edge(X,Y)}1 :- node(X).
reach(Y):-cycle(1,Y).
reach(Y):-reach(X),cycle(X,Y),X!=1.
:-node(Y), not reach(Y).
#show cycle/2.