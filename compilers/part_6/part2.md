

# Grafo de Interferência (IG - interference graph)

Inicialmente com o CFG, control flow graph, podemos analisar a longevidade das variáveis. Com a longevidade identificada o que podemos fazer?

**Grafo de interferência** permite informar quais são as variáveis vivas em um mesmo ponto de um programa. A interferência é quando ocorre quando a e b não podem usar o mesmo registrador. A aresta `a <- regitrador` implica que a variável a interfere no registrador.

Considere quando `a <- ...` não seja MOVE, o `live-out = b_1 , ... b_j` são as variáveis vivas e criamos as arestas `(a, b_1), ... ,(a, b_j)`. 

Quando temos uma instrução de `MOVE`, precisa-se de um tratamento especial, pois geram-se cópias. E precisamos assegurar para não gerar falsas interferências entre fonte e destino.

```
                                       s       
t := s ; instrução de cópia            |      t
...                                    |      |
x := op s ; uso de s                   |      |
...                                           |
y := op t; uso de t                          |
```

- se `s` e `t` estiverem vivas após a instrução de cópia podemos aproveitar o mesmo registrador:  não criar interferência entre as duas.

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_6/interferenceGraph1.jpg)

Observe a imagem acima, precisamos ver todos os `outs` e criamos as arestas.

**1 ) Bloco 1 para o bloco 2:**  `a` deve interferir em todas as saídas do bloco 1, ou seja, `out[1] = {ac}`, então criamos a aresta `(a,c)`

**2 ) Bloco 2 para o bloco 3:**  observamos agora `out[2] = {ac}`, então criamos a aresta `(b,c)` pois `b` interfere em `c`

Não vou seguir os demais passos pois o resultado é:

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_6/interferenceGraph2.jpg)

 # Alocação de Registradores

Uma vez criado o grafo de interferência podemos ver que duas variáveis não podem assumir um mesmo registrador. 

Anteriormente quando usamos a IR e a seleção de intruções tinhamos um número **infinito** de instruções. Nesse caso, vamos tratar de problemas reais usando registradores físicos.

**Qual o objetivo de tudo isso?** Eliminação de operações inúteis, e reduzir o gasto dos registradores.

Com isso podemos relacionar o grafo de interferência ao problema de coloração de grafos, pois podemos tratar cada nó de uma variável, seja colorida por uma cor. E essas cores representam o número de registradores.

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_6/interferenceGraph3.jpg)


# Coloração de Registradores

**Objetivo:** Colorir o grafo de interferência (IG) com o menor número de cores possíveis. Ou seja, vamos usar a menor quantidade de registradores possíveis em um grafo de interferência.

Em computação, lembre-se que esse problema é NP-completo ((vídeo explicando)[https://youtu.be/otjOaczA2n4]), se não existir uma k-coloração, temos que colocar alguns temporários ou variáveis na memória. (IME-USP  - coloração de grafos)[https://www.ime.usp.br/~pf/algoritmos_para_grafos/aulas/vertex-coloring.html].

> A propósito, dizemos que um grafo é k-colorível se tem uma coloração válida com k cores. (IME-USP)

Quando não há uma k-coloração, usamos uma operação chamda **spilling**.

## Coloração por simplificação

Temos quatro fases: 

1. BUILD: contruir a IG
2. SIMPLIFY: simplificar/reduzir o IG, são feitas outras chamadas caso seja necessário
3. SPILL:  Caso essa variável, não consiga uma cor ouseja, em um registrador por alocação.
4. SELECT: As informações, os nós são armazenados numa pilha e fazemos o `pop` e trazemos os nós de volta para o grafo e é dado uma cor para o nó.

## Fase 1: BUILD

- Construção do IG
- Fazer a análise de longevidade

## Fase 2: SIMPLIFY 

- Suponha que um grafo `G` tenha um nó `m` com menos de k-vizinhos
  - `k` é o número de registradores
  - Só com essas informações temos a garantia que esse nó terá sempre cores distintas para ela mesma E seus vizinhos
- Por isso que podemos reduzir o grafo para `G' = G - {m}`
- Se `G'` pode ser colorido com `k` cores, `G` tambpem pode

Só e somente com esses passos listados acima podemos fazer um algoritmo recursivo, removemos cada nó `m` que tem grau menor que `k` em uma **pilha**.

## Fase 3: SPILL

Após a simplificação, a fase 2 pode falhar quando encontrarmos nós com grau maior que `k`. O nó pode ser marcado para a spill. Ele não vai ser processado no spill ainda porque pode ter uma cor cabível em outras análises.

- Damos prioridade ao nó de maior grau. Isso significa que tem maior número de acessos na memória.

Considere a seguinte situação:

```
 k = 4 // número de cores
 ...
 
 m = m +1; // m é o nó
 ...
 for(int i=0; i < N; i++){
 	a[i] += a[i] + m;
 }
 
```

Como podemos observar esse programa? Temos `m` chamado 2 vezes na terceira linha do código acima, e no `for` é chamado `N` vezes. Por isso o custo total dele `cost(m)` seria a toda do número de usos, que é `2+N` e o grau ou `degree(m)` é representado do grafo do desenho abaixo.

<a href="https://www.codecogs.com/eqnedit.php?latex=cost(m)&space;=&space;\frac{\sum&space;uses(m))&space;}{degree(m))}&space;=&space;\frac{2&plus;N}{4}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?cost(m)&space;=&space;\frac{\sum&space;uses(m))&space;}{degree(m))}&space;=&space;\frac{2&plus;N}{4}" title="cost(m) = \frac{\sum uses(m)) }{degree(m))} = \frac{2+N}{4}" /></a>

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_6/coloringGraph1.jpg)

Como podemos ver podemos empilhar o nós dessa forma

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_6/graphStack.gif.jpg)













