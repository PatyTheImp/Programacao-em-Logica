team(a;b;c;d;e;f).
group(1;2).
match(1;2;3;4;5;6).

plays(f,1;f,3).

3{in(T,G):team(T)}3:-group(G).
1{in(T,G):group(G)}1:-team(T).

2{plays(T,M):match(M)}2:-team(T).
2{plays(T,M):team(T)}2:-match(M).

:-in(a,1).
:-in(a,G),in(e,G).
:-in(f,G),in(e,G).
:-in(b,G1),in(c,G2),G1!=G2.

:-plays(T1,M),plays(T2,M),in(T1,G1),in(T2,G2),G1!=G2.
:-plays(b,6).
:-plays(c,M),plays(d,M+1).
:-plays(T,M),plays(T,M+1).

#show plays/2.