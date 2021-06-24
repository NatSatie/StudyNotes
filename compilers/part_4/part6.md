# Local Register Allocation

Considere uma situação que não quiero usar coloração de registradores (ver Parte 6) e é muito caro. Interpretadores e JIT compiladores nmão podem suportar isso. Por isso, vamos allocar registradores dentro do block básico:

## Algoritmo Sethi-Ullman (1970)

Os passos básicos são:

- Construit a árvore do bloco básico
- Usar escalonamento para minimizar o número de registradores necessários na árvore
- As folhas são instruções de load em registradores OU ter sido designado a outros registradores

Considere a seguinte árvore abaixo, vamos usar duas formas de escalonamento um da esquerda para direita e a segunda é direita para a esquerda

![imagem](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_4/localRegister1.jpg)

### Escalonamento da esquerda para a direita

Observe que começamos com o nó `b`, e temos o load no registrador 1 denominado `r1`, assim seguimos e visitamos as demais folhas e temos `r2` e `r3`.

![2magem](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_4/localRegister2.jpg)

Uma vez feito o LOAD de `c` e `e`, podemos executar a instrução em `d`, esse nó pode reciclar um dos dois registradores (pegue o menor registrador?) e temos `d` com `r2`.

![2magem](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_4/localRegister3.jpg)

### Escalonamento da direita para a esquerda

![imagem](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_4/localRegister4.jpg)

![imagem](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_4/localRegister5.jpg)

## Algoritmo: Bottom-up pass: Computar número SU (Sethi-Ullman)

Considere um número de um nó `n` no qual tem `filho(n)` ou filhos do nó `n`, e os nós filhos são `n_i`, e `i = 1, 2`

<a href="https://www.codecogs.com/eqnedit.php?latex=SU(n)&space;=&space;\left\{\begin{matrix}&space;1,&space;\text{&space;if&space;}&space;n&space;\text{&space;is&space;}&space;folha\\&space;1&space;&plus;&space;SU(n_i)&space;\text{&space;if&space;}&space;n_1&space;=&space;n_2&space;)&space;\\&space;max(SU(n_i)),&space;\text{&space;if&space;}&space;n_1&space;!=&space;n_2&space;\end{matrix}\right." target="_blank"><img src="https://latex.codecogs.com/gif.latex?SU(n)&space;=&space;\left\{\begin{matrix}&space;1,&space;\text{&space;if&space;}&space;n&space;\text{&space;is&space;}&space;folha\\&space;1&space;&plus;&space;SU(n_i)&space;\text{&space;if&space;}&space;n_1&space;=&space;n_2&space;&space;\\&space;max(SU(n_i)),&space;\text{&space;if&space;}&space;n_1&space;!=&space;n_2&space;\end{matrix}\right." title="SU(n) = \left\{\begin{matrix} 1, \text{ if } n \text{ is } folha\\ 1 + SU(n_i) \text{ if } n_1 = n_2 ) \\ max(SU(n_i)), \text{ if } n_1 != n_2 \end{matrix}\right." /></a>

TODO: explicações

## Local Reference Allocation Algorithm (1996)



São registradores de endereçamento em boa parte.

