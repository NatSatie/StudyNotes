# Alocação de Registradores com Coalescing

>  Coalescing: In [computer science](https://en.wikipedia.org/wiki/Computer_science), **coalescing** is a part of [memory management](https://en.wikipedia.org/wiki/Memory_management) in which two adjacent free blocks of [computer memory](https://en.wikipedia.org/wiki/Computer_memory) are merged.
>
> When a [program](https://en.wikipedia.org/wiki/Computer_program) no longer requires certain blocks of memory, these blocks of memory can be [freed](https://en.wikipedia.org/wiki/Free_a_memory_location). Without coalescing, these blocks of memory stay separate from each other in their original requested size, even if they are next to each other. If a subsequent request for memory specifies a size of memory that cannot be met with an integer number of these (potentially unequally-sized) freed blocks, these neighboring blocks of freed memory cannot be allocated for this request. Coalescing alleviates this issue by setting the neighboring blocks of freed memory to be contiguous without boundaries, such that part or all of it can be allocated for the request.

Lembrando sobre o tópico na presença de cópias, seria adequado colocarmos o mesmo registrador para a mesma variável. Então temos duas atribuições que são unificadas em uma mesma variável.

- Eliminação de `moves` redudantes usando o IG - interference graph.
- os nós fonte e destino do `move` são **unidos ou  coalesced** em um só
- A arestas do novo nó são a união de arestas dos dois anteriores

**Isso pode ajudar a gente?** Sim, porém pode complicar o processo de alocação e portanto, afetar a coloração. Isso pode mudar o grafo de k-colorível para não k-colorível.

**Quando fazemos isso?**  Temos duas estratégias: Briggs e George

## Briggs

`a` e `b` podem ser unidos se um nó resultante `a&b` tiver menos do que `K` vizinhos com grau significativo (ou seja `>= K`) . Isso garante que o grafo é k-colorível.

Após a simplificação remove todos os nós não-significativos, sobram menos do que K vizinhos para o nó `a&b `. Logo, ele pode ser removido.

### Exemplo 1

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_6/coaslescing1.jpg)

Ao observa r as imagem, o nó `a` tem dois nós não-significativos.

> Nós não-significativos são nós que tem grau menor que K
>
> Nós siognificativos são nós que tem grau maior ou igual a K

| variável | nó não-significativo | nó significativo |
| -------- | -------------------- | ---------------- |
| a        | 2                    | 2                |
| b        | 1                    | 1                |

### Exemplo 2

Após a união/coalence temos um nó `a&b`:

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_6/coaslescing2.jpg)

| variável | nó não-significativo | nó significativo |
| -------- | -------------------- | ---------------- |
| a&b      | 2                    | 3                |

Com o resultado do coalescing conseguimos 3 vizinhos, ou 3 nós significativos, permitindo que mantenha um número inferior ao K, então, facilitando a coloração.

### Exemplo 3

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_6/coaslescing3.jpg)

| variável | nó não-significativo | nó significativo |
| -------- | -------------------- | ---------------- |
| a        | 2                    | 2                |
| b        | 0                    | 4                |

## George

1. `a` e `b` podem ser unidos se para cada vizinho `t` de a:
   1. t interfere com b ou t tem grau inisignificante (< K)
2. Seja `S` conujunto de vizinhos insignificantes de a em `G`
3. Sem o coalescing, todos em S poderiam ser removidos gerando um grafo `G1`
4. Fazendo o coalescing, todos os nós de S também poderão ser removidos,c riando `G2`
5. `G2` é subgrafo de `G1`, onde o nó `a&b` corresponde ao b
6. `G2` é no mínimo tão fácil para colorir quanto `G1`



### Exemplo 1: G1

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_6/coaslescing4.jpg)

| variável | nó não-significativo | nó significativo |
| -------- | -------------------- | ---------------- |
| a        | 2                    | 2                |
| b        | 0                    | 4                |

Antes de fazer o coalescing temos que gerar um grafo e fazemos o simplify. **Então temos remover os nós brancos acima, que são nós não-signigicativos**.

### Exemplo 1: G2

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_6/coaslescing5.jpg)

| variável | nó não-significativo | nó significativo |
| -------- | -------------------- | ---------------- |
| a&b      | 0                    | 4                |

Após a junção dos nós `a` e `b`, observe que com o método BRIGGs, não podíamos colorir pois tinha nós não-significativos, o nós brancos que removemos usando o SIMPLIFY no `G1`.
 Depois do simplify, o `a` some, `G2` vira subgrafo de `G1`, mantemos a complexicade de colorir. 

**Porém** isso só acontece pois temos duas arestas dos nós vizinhos de `a`, que conectam em `b`, após o coalescing essas arestas somem. Por isso, o `exemplo 2` vai tentar fazer uma situação que é diferente desse.

### Exemplo 2: G1

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_6/coaslescing6.jpg)

| variável | nó não-significativo | nó significativo |
| -------- | -------------------- | ---------------- |
| a        | 2                    | 2                |
| b        | 0                    | 3                |

Como `a ` em `G1` tem nós não-significativos podem ser removidos como sempre.

Porém temos o nó `b` que pode ser colorido! Então o que acontece com o coalescing??

### Exemplo 2: G2

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_6/coaslescing7.jpg)

| variável | nó não-significativo | nó significativo |
| -------- | -------------------- | ---------------- |
| a&b      | 0                    | 4                |

Após o coalescing muda o número de npos não-significativos, ou seja, `a&b != b`!!!! Então eu aumentei a complexidade do problema, como violamos a estratégia de George, então não podemos continuar.

## O que aprendemos com Coalescing?

- são estratégias conservativas
- podem sobrar MOVES que poderiam ser removidos
- é melhor que fazer o SPILL
- É necessário anotar com arestas pontilhdas os vértices **move-related**
- Quando não podemos fazer a simplificação ou o coealescing podemos dizer que estão liberados ou freezed 

## Quais são as fases de alocação do Coalescing?

1. BUILD:
   1. construir o IG
   2. Categorizar em move-related ou move-unrelated
2. SIMPLIFY
   1. remover os nós não-significativos, grau maior que K, um de cada vez
3. COALESCE:
   1. fazer o coalesce conservativo dos move-related no grafo resultante do passo anterior
   2. Com a reduçao de graus pé provável que apareça mais oportunidades de coalescing
   3. Quando um nó resultante não é mais move-related ele fica disponível para a prórxima simplificação
4. FREEZE:
   1. executando quando tem o simplify nem o coalescing podem ser aplicados
   2. procura nós move-related de grau baixo
   3. congela os moves desses nós. Eles passsam a ser candidatos para a simplificação
5. SPILL: 
   1. Se não houver nós de grau baixo, selecionamos um nó com grau significativo para spill
   2. coloca-se esse nó na pilha
6. SELECT:
   1. desempilhar todos os nós e atribuir cores

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_6/map2.jpg)



