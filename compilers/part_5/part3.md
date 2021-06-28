# Otimizações

# Copy Propagation

O propósito é eliminação de cópias desnecessárias, considere as sentenças:

```
d: t <- z // d é definido por t recebe z
...
n: y <- t op x // n é a sentença
```

Será que se t permanecer o mesmo ao longo do programa , será que precisamos de uma cópia para t? Se for sempre o mesmo temos a segurança de chamar a sentença `n` como `n:y <- z op x`.

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_5/copyPropagation1.jpg)

Observe que estamos usando Reaching Definitions para analisar as sentenças que se propagam nos nós.

> <a href="https://www.codecogs.com/eqnedit.php?latex=in[n]&space;=&space;\large{\bigcup_{p&space;\in&space;pred[n]}}&space;\normalsize{out[p]}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?in[n]&space;=&space;\large{\bigcap_{p&space;\in&space;pred[n]}}&space;\normalsize{out[p]}" title="in[n] = \large{\bigcup_{p \in pred[n]}} \normalsize{out[p]}" /></a>
>
> <a href="https://www.codecogs.com/eqnedit.php?latex=out[n]&space;=&space;gen[n]&space;\cup&space;(in[n]&space;-&space;kill[n])" target="_blank"><img src="https://latex.codecogs.com/gif.latex?out[n]&space;=&space;gen[n]&space;\cup&space;(in[n]&space;-&space;kill[n])" title="out[n] = gen[n] \cup (in[n] - kill[n])" />

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_5/copyPropagation2.jpg)

# Constant Propagation

