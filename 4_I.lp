team(a;b;c;d;e;f).
group(1;2).

3{in(T,G):team(T)}3:-group(G).
1{in(T,G):group(G)}1:-team(T).

:-in(a,1).
:-in(a,G),in(e,G).
:-in(f,G),in(e,G).
:-in(b,G1),in(c,G2),G1!=G2.

#show in/2.