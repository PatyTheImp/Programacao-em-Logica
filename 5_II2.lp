% Definição de vértices e arestas
vertex(1). vertex(2). vertex(3). vertex(4). vertex(5). vertex(6).
edge(1,2). edge(1,3). edge(2,4). edge(3,5). edge(4,5). edge(4,6).

% Limite de vértices a serem selecionados
threshold(3).

% Regra para selecionar vértices
{ select(V) : vertex(V) }.

% Garantir que cada aresta tem pelo menos um vértice selecionado
:- edge(U, V), not select(U), not select(V).

% Garantir que o número de vértices selecionados não excede o limite
:- threshold(T), #count { V : select(V) } > T.

#show select/1.