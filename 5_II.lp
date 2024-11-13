vertex(1). vertex(2). vertex(3). vertex(4). vertex(5). vertex(6).
edge(1,2). edge(1,3). edge(2,4). edge(3,5). edge(4,5). edge(4,6).
threshold(3).

{select(V):vertex(V)}T:-threshold(T).

:-edge(V1,V2),not select(V1),not select(V2).

#show select/1.