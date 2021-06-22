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

### Exemplo 1: G2

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_6/coaslescing5.jpg)

| variável | nó não-significativo | nó significativo |
| -------- | -------------------- | ---------------- |
| a&b      | 0                    | 4                |

### Exemplo 2: G1

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_6/coaslescing6.jpg)

| variável | nó não-significativo | nó significativo |
| -------- | -------------------- | ---------------- |
| a        | 2                    | 2                |
| b        | 0                    | 3                |

### Exemplo 2: G2

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_6/coaslescing7.jpg)

| variável | nó não-significativo | nó significativo |
| -------- | -------------------- | ---------------- |
| a&b      | 0                    | 4                |

