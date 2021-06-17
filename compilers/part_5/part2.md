# Análise do Fluxo de Dados: Reaching Definitions

Inicialmente, fizemos a apresentação de métodos de eliminação de código desnecessário para otimizar, porém não esclarecemos COMO a análise é feita.

## Introdução

Essa é uma análise feita com todos os blocos básicos, ou seja, analisamos do fluxo de dados (DFA - data-flow analysis). Usamos quádruplas, `a <- b op c`, ou  `(a, b, c, op)`. E os conceitos que vamos ver nessa parte 5, são:

- Reaching Definitions
- Available Expressions
- Liveness Analysis

# Reaching Definitions

## Conceitos básicos

**Definição não ambígua de t:**

```
d: t <- a op b
d: t <- M[a]
```

**Definição ambígua:** Uma sentença pode ou não atribuir um valor de t.

```
call: f(x,t)
```

**d alcança u**: só se

1. se existe caminho no CFG de d para u
2. esse caminho não contém outra definição não ambígua de t

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_5/reachingDef1.png)

Criamos um ID para as definições como: `d1: t <- x opy `, geramos `d1` e matamos todas as definições de `t`, pois **não** alcançam o final da instrução

**Defs(t)**: é o conjunto de todas as definições de t.

## Gen e Kill

[Stack Exchange: What are gen and kill statements in dataflow analysis? ](https://cs.stackexchange.com/questions/42966/what-are-gen-and-kill-statements-in-dataflow-analysis)

Extras: [Data flow analysis slides](https://www.cs.cmu.edu/afs/cs/academic/class/15745-s03/public/lectures/L4_handouts.pdf), [vídeo: Compiler Design Module 89](https://youtu.be/NRoF_6NN70M)

Então `gen` é a geração de definições e `kill` mata as definições.

## Reaching Definitions

`In[n]`: conjunto de definições que alcançam o início de `n`

`Out[n]`: conjunto de definições que alcançam o final de `n`

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_5/genKill.png)

<a href="https://www.codecogs.com/eqnedit.php?latex=in[n]&space;=&space;\large{\bigcup_{p&space;\in&space;pred[n]}}&space;\normalsize{out[p]}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?in[n]&space;=&space;\large{\bigcup_{p&space;\in&space;pred[n]}}&space;\normalsize{out[p]}" title="in[n] = \large{\bigcup_{p \in pred[n]}} \normalsize{out[p]}" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=out[n]&space;=&space;gen[n]&space;\cup&space;(in[n]&space;-&space;kill[n])" target="_blank"><img src="https://latex.codecogs.com/gif.latex?out[n]&space;=&space;gen[n]&space;\cup&space;(in[n]&space;-&space;kill[n])" title="out[n] = gen[n] \cup (in[n] - kill[n])" /></a>

Considere que `gen[n]` é `{d}` e `kill[n]` como `defs(x) - {d}`