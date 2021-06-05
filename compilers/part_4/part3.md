# Seleção de instruções e Programação dinâmica

📺[# Compilation - Part Five: Object Code Generation](https://youtu.be/TikxuBeHgqk)

## Custo da cobertura
Com a seleção de instruçõies podemos gerar uma árvore a partir de uma representação intermediária com um código próximo a assembly (de baixo nível), temos que buscar com o custo da cobertura qual o menor custo.

> Optimum: a melhor cobertura da árvore é a soma dos custos dos padrões utilizados é a menor soma possível


## Optimal e Optimum

Considere uma cobertura onde nenhum par de padrões adjacentes possa ser combinado em um par de custo optimal
Caso haja um padrão que possa ser qubrado e diminua o custo total, ele deve ser descartado (não optimal)

Optimal = soluções locais com custo mínimo (mínimo local)
Optimum = é sempre optimal


Observe (atentamente) a imagem abaixo, que é a tabela de padrões:

![enter image description here](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_4/01.png)

 - MOVEM tem custo m
 - Todas as outras instruções têm custo 1

Essa instrução faz colocar um dado de uma memória para outra, porém, para isso o dado dentro de M[ri] tem que passar por um barramento para alcançar M[rj].

>  [Barramento](https://pt.wikipedia.org/wiki/Barramento) é um conjunto de linhas de comunicação que permitem a interligação entre dispositivos, como a [CPU](https://pt.wikipedia.org/wiki/CPU "CPU"), a [memória](https://pt.wikipedia.org/wiki/Mem%C3%B3ria_(computador) "Memória (computador)") e outros periféricos. 

  Temos um processo invisível que consome um ciclo, pois os dados são armazenados pelo processador.

### O que acontece quando MOVEM tem custo m variável?

Se m tem um custo variável significa que temos uma variação de ciclos por instrução.

Considere a seguinte árvore abaixo com dois tipos de cobertura A (sem MOVEM) e B (com MOVEM).

![enter image description here](https://github.com/NatSatie/StudyNotes/blob/main/compilers/part_4/02.png?raw=true)

 - Lembre-se que o custo dos registradores **não conta** em verde

![enter image description here](https://github.com/NatSatie/StudyNotes/blob/main/compilers/part_4/03.png?raw=true)

![enter image description here](https://github.com/NatSatie/StudyNotes/blob/main/compilers/part_4/04.png?raw=true)

| custo m| A (sem movem) | B (com movem) |
|--|--|--|
| 0 | 6 (árvores) * (1 custo da instrução) | 5 (árvores) + (m=0) (custo da raíz da árvore que é movem) |
| 1 | 6 (árvores) * (1 custo da instrução) | 5 (árvores) + (m=1) (custo da raíz da árvore que é movem) |
| 2 | 6 (árvores) * (1 custo da instrução) | 5 (árvores) + (m=2) (custo da raíz da árvore que é movem) |

Quando m=2, descobrimos que o Maximal Munch não resulta em optimum, pois o custo é maior que a cobertura A.

O maximal munch pode criar um mau padrão, e não necessariamente resulta em um resultado optimum.

### Diferenças entre arquiteturas RISC e CISC

 - RISC: padrões pequenos, custo mais uniforme e optimal e optimum não são muito diferentes
 - CISC: instruções mais complexas, provocando padrões maiores, optimal e optimum podem ser bem diferentes

## Programação Dinâmica

Tem o objetivo de encontrar a cobertura ótima / optimum. Considere que o algortimos:

 - A soma do custo de todas as intruções da melhor cobertura da sub-árvore com raiz no respectivo nó
 - para cada nó: encontra o melhor custo para a sub-árvore, analisa os padrões para poder cobrir n, algoritmo bottom-up

> Written with [StackEdit](https://stackedit.io/).
