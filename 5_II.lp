vertex(1..10).
edge(1,6;1,3;1,8;1,9;1,4).
edge(2,5;2,9;2,8).
edge(3,4;3,10;3,6;3,1;3,9).
edge(4,6;4,10;4,1).
edge(5,10;5,1;5,8;5,7;5,2).
edge(6,7;6,3;6,2).
edge(7,9;7,1;7,4;7,8;7,2).
edge(8,4;8,3;8,6;8,2;8,10).
edge(9,5;9,3;9,7;9,8;9,2).
edge(10,8;10,3;10,7;10,9;10,2).
threshold(8).

{select(V):vertex(V)}T:-threshold(T).

:-edge(V1,V2),not select(V1),not select(V2).

#show select/1.