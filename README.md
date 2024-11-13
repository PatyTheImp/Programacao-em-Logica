## Programação por Conjuntos de Resposta

O tópico destas aulas é a programação por conjuntos de resposta. Pretende-se que use a programação por conjuntos de resposta para modelar alguns problemas e obter as suas soluções usando o [CLINGO](https://potassco.org/).

Mas antes de usar o CLINGO...

### 1 - Programas Proposicionais

Para cada um dos seguintes programas positivos, indique os modelos (clássicos) e decida quais deles são estáveis.

P1.1:
- chuva←
- molhado←chuva
- molhado←rega

P1.2:
- café←
- limão←chá
- açucar←café
- leite←café,açucar
- chá←limão
- chá←dieta

Para cada um dos seguintes programas normais, indique os modelos (clássicos) e decida quais deles são estáveis.

P1.3:
- rega←~chuva
- chuva←~rega
- molhado←chuva
- molhado←rega

P1.4:
- dieta←~açucar
- café←~chá
- limão←chá
- açucar←café
- leite←café,açucar
- chá←limão
- chá←dieta

### 2 - CLINGO

Para os exercícios seguintes vamos usar o CLINGO. Recomendamos que instale (se não tiver) o [Visual Studio Code](https://code.visualstudio.com/), abra o mesmo, e nas extensões (Menu Extensions à esquerda), procure pela extensão EZASP e instale a mesma (isso vai de forma automática instalar mais duas extensões úteis).

Para usufruir das vantagens da extensão:

1. Deve usar ficheiros (de texto) com a extensão .lp;
2. Para correr programas pode clicar no botão direito do rato no espaço do ficheiro editado e escolher a opção "Compute all answer sets";
3. Em Mac é preciso tornar executável o binary colocado na pasta da extensão Answer Set Programming Language Support (correndo por exemplo no terminal na respetiva pasta - no seu user há uma pasta .vscode/extensions/ffrankreiter.answer-set-programming-language-support-0.7.1/ - o comando: chmod 755 clingo_mac).

Para opcionalmente configurar a extensão para os ficheiros de uma mesma pasta:

1. Clicar no botão direito do rato no espaço do ficheiro editado e escolher a opção "Command Palette...";
2. No menu escolher a opção "EZASP - Create config.json";
3. Depois pode abrir o ficheiro config.json no Explorer a esquerda (se necessário deve abrir no Menu "File" -> "Open Folder...");
4. Neste ficheiro na opção "disable Features" pode ativar ou desativar os mesmos - por defeito, todos menos o último estão ativos.

**I** Use o CLINGO para verificar a correção dos modelos estáveis encontrados nas perguntas anteriores. As seguintes indicações devem ajudar:

1. A seta é substituída por `:-` enquanto `~` é substituído por `not`;
2. Não são permitidos acentos;
3. Cada regra acaba com um `.`.

### 3 - Programas com Variáveis

**I** Para o seguinte programa com variáveis P e cada um dos conjuntos de factos Fi, use o CLINGO para encontrar os modelos estáveis e responda às seguintes perguntas:

1. Quantas soluções existem?
2. Quantas soluções existem sem a restrição?
3. Explique a diferença!

P:
- `1{cycle(X,Y) : edge(X,Y)}1 :- node(X).`
- `reach(Y):-cycle(1,Y).`
- `reach(Y):-reach(X),cycle(X,Y),X!=1.`
- `:-node(Y), not reach(Y).`
- `#show cycle/2.`

F1:
- `node(1). node(2). node(3).`
- `edge(1,2). edge(2,3). edge(3,1). edge(3,2).`

Uma representação mais compacta desta informação em clingo é:
- `node(1..3).`
- `edge(1,2;2,3;3,1;3,2).`

F2:
- `node(1). node(2). node(3). node(4).`
- `edge(1,2). edge(1,3). edge(2,3). edge(2,4). edge(3,2). edge(3,4). edge(4,1). edge(4,2).`

Uma representação mais compacta desta informação em clingo é:
- `node(1..4).`
- `edge(1,2;1,3;2,3;2,4;3,2;3,4;4,1;4,2).`

### 4 - Programação por Conjuntos de Resposta (I)

**I**: Pretende-se organizar um torneio com 6 equipas (**a**,**b**,**c**,**d**,**e**,**f**) com uma fase de grupos (dois grupos de três equipas) e uma final entre os vencedores dos grupos. A pedido de certas equipas, pretende-se assegurar, na fase de grupos, o seguinte:

i. A equipa **a** não quer ficar no grupo 1.
ii. As equipas **a** e **e** não querem ficar no mesmo grupo.
iii. As equipas **e** e **f** não querem ficar no mesmo grupo.
iv. As equipas **b** e **c** querem ficar no mesmo grupo.

Especifique uma codificação uniforme deste problema em programação por conjuntos de resposta tal que os átomos sobre o predicado in/2 em cada conjunto de resposta (modelo estável) correspondam à distribuição das equipas pelos grupos. Pode utilizar os seguintes passos para desenvolver esta solução:

1. Crie uma representação dos factos (equipas e grupos).
2. Crie um (ou mais) gerador(es) para o predicado in/2 que gere(m) as possíveis associações das equipas aos grupos, garantindo que cada grupo tem três equipas e cada equipa pertence a um grupo.
3. Adicione restrições correspondendo a i)-iv).

**II**: Dada uma distribuição das equipas pelos grupos no exercício anterior, pretende-se agora determinar em que ordem os 6 jogos da fase de grupos se realizam (cada equipa joga uma vez contra as outras equipas do mesmo grupo), tendo em conta o seguinte:

i. A equipa **b** não quer realizar o último jogo.
ii. A equipa **f** realiza os jogos 1 e 3.
iii. A equipa **d** não joga imediatamente a seguir à equipa **c**.
iv. Nenhuma equipa realiza dois jogos consecutivos.

Estenda a sua codificação uniforme do problema anterior (utilizando programação por conjuntos de resposta) tal que os átomos sobre o predicado plays/2 em cada conjunto de resposta (modelo estável) correspondam à distribuição das equipas pelos jogos.

### 5 - Programação por Conjuntos de Resposta (III)

**I - Exact Hitting Sets**: Dada uma coleção de conjuntos, o problema Exact Hitting Sets consiste em selecionar exatamente um elemento de cada conjunto. Por exemplo, os conjuntos {a,b,c}, {a,c,d} e {b,c} têm dois Exact Hitting Sets: {b,d} e {c}. Representamos esta instância através dos seguintes factos:

- `set(1). element(1,a). element(1,b). element(1,c).`
- `set(2). element(2,a). element(2,c). element(2,d).`
- `set(3). element(3,b). element(3,c).`

Especifique uma codificação uniforme deste problema em programação por conjuntos de resposta tal que os átomos sobre o predicado select/1 em cada conjunto de resposta (modelo estável) correspondam a Exact Hitting Sets para instâncias arbitrárias do problema.

**II - Vertex Cover**: Dado um grafo não dirigido, o problema Vertex Cover consiste em selecionar um sub-conjunto dos vértices tal que cada arco contenha um vértice selecionado, e que o número de vértices selecionado não exceda um dado limiar. Por exemplo, o grafo ({1,2,3,4,5,6},{{1,2},{1,3},{2,4},{3,5},{4,5},{4,6}} tem três Vertex Covers com um máximo de três vértices: {1,3,4}, {1,4,5} e {2,3,4}. Representamos esta instância através dos seguintes factos:

- `vertex(1). vertex(2). vertex(3). vertex(4). vertex(5). vertex(6).`
- `edge(1,2). edge(1,3). edge(2,4). edge(3,5). edge(4,5). edge(4,6).`
- `threshold(3).`

Especifique uma codificação uniforme deste problema em programação por conjuntos de resposta tal que os átomos sobre o predicado select/1 em cada conjunto de resposta (modelo estável) correspondam a Vertex Covers para instâncias arbitrárias do problema.

### 6 - De quem é o gato?

Existe uma rua com cinco casas, cada uma com uma cor diferente (vermelha, azul, branca, amarela e verde), habitadas por homens diferentes mas da mesma família (Miguel, João, Pedro, Daniel e Carlos), adeptos de clubes diferentes (Académica, Benfica, Belenenses, F. C. Porto e Sporting) e onde se bebe uma bebida diferente (sumol, chá, café, leite e água). Os cinco homens são casados com cinco mulheres (Maria, Carla, Paula, Filipa e Ana), sendo cada uma delas dona de um animal de estimação diferente (papagaio, raposa, tartaruga, cavalo e gato).

Desta história sabe-se que:

1. O Miguel é filho do João.
2. O João é filho do Pedro.
3. O Daniel é filho do Pedro.
4. O Carlos é filho do Daniel.
5. O pai do Carlos vive na casa vermelha.
6. A mulher do Miguel é dona do papagaio.
7. O avô do Carlos vive na primeira casa à esquerda.
8. Na casa amarela é-se adepto do F. C. Porto.
9. O adepto da Académica vive na casa ao lado da dona da raposa.
10. O Pedro vive ao lado da casa azul.
11. A mulher do adepto do Sporting tem uma tartaruga.
12. O adepto do Benfica bebe sumol.
13. O pai do Miguel bebe chá.
14. O filho do Daniel é adepto do Belenenses.
15. O adepto do F. C. Porto mora ao lado da casa onde vive a dona do cavalo.
16. Na casa verde bebe-se café.
17. A casa verde fica imediatamente à direita da casa branca.
18. Na casa do meio bebe-se leite.
19. O Pedro é casado com a Ana.
20. O Carlos não é casado com a Maria.

Sabe-se que os homens e mulheres desta história têm as suas preferências em relação aos elementos do sexo oposto. Por exemplo, sabe-se que a mais preferida do Miguel é a Paula, seguida da Ana, após a qual aparece a Maria, seguida da Carla. A menos preferida do Miguel é a Filipa. Representemos estas preferências da seguinte maneira:

- **Miguel**: Paula > Ana > Maria > Carla > Filipa

Os restantes elementos da nossa história têm as seguintes preferências:

- **Maria**: Carlos > Miguel > Daniel > João > Pedro
- **João**: Maria > Paula > Carla > Filipa > Ana
- **Paula**: Daniel > Carlos > João > Miguel > Pedro
- **Pedro**: Paula > Carla > Ana > Filipa > Maria
- **Carla**: Miguel > Daniel > João > Pedro > Carlos
- **Daniel**: Maria > Carla > Paula > Filipa > Ana
- **Filipa**: Pedro > João > Daniel > Miguel > Carlos
- **Carlos**: Ana > Carla > Paula > Maria > Filipa
- **Ana**: Daniel > João > Pedro > Carlos > Miguel

Além disso, sabe-se que todos os homens e mulheres desta história têm casamentos estáveis. Um casamento é instável se existe um homem e uma mulher que se preferem mais entre eles do que aos seus esposos. Por exemplo, considerem uma situação em que o Miguel é casado com a Paula, e o Pedro com a Maria. Se o Miguel preferir a Maria à Paula e a Maria preferir o Miguel ao Pedro, então ambos os casamentos são instáveis (pois o Miguel e a Maria separar-se-iam dos seus cônjuges para ficarem juntos).

Belo dia, é encontrado o gato no meio da rua. Os serviços camarários pretendem saber quem é a dona do gato e em que casa é que ela mora.

Resolva este problema usando programação por conjuntos de resposta. Em concreto, especifique um programa por conjuntos de resposta onde a informação disponível esteja codificada, e seja usada para resolver o problema: o(s) conjunto(s) de resposta deverão conter a solução do problema. Para facilitar, pode encontrar [aqui](tp4/tp4.lp) um ficheiro com alguns factos desta história.

**Nota**: Não é recomendável a modelação deste problema recorrendo a um predicado do tipo `tuplo(T,U,V,W,X,Y,Z)` significando que a casa número T é habitada pelo personagem U, adepto do clube V, com o animal de estimação W, etc. A razão para tal está relacionada com a vantagem em manter baixo o número de variáveis nas regras. Porquê?
