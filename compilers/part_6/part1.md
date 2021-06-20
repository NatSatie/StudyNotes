# Análise de Longevidade ou Liveness Analysis



#  Introdução



Dois valores temporários podem ocupar o mesmo registrador se não estão "em uso" ao mesmo tempo. Muitos temporários podem caber em alguns registradores, mas os que não couberem, podem ir para a memória, ou *spill*.

Uma variável viva é que pode ser usada no futuro.

```
a <- 0
b <- a + 1
c <- c + b
a <- b * 2
if a < N goto L1
return c
```

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_6/longevidade1.png)

Considere os seguintes pontos:

- `b` é usado em `4`, então precisa estar vive em `3 -> 4`
- `b` não é definido no nó `3`, logo deve estar vivo `2->3`
- `b` é definida em `2`, logo b está morta na aresta `1->2` 
- Então a faixa de vida de `b` é `{2->3, 3->4}`

Então, quando fazemos a análise da longevidade das variáveis podemos calcular quantos registradores são necessários.

## Terminologia

- `SUCC[n]`: conjunto de nós sucessores a n
- `PRED[n]`: conjunto de nós precedessores a n
- `out-edges`: saem para os sucessores
- `in-edges`: chegam dos predecessores
- uma atribuição a uma variável define a mesma
- uma ocorrência do lado direito de uma expressão é um uso de variável
- `def[var]` de uma variável é o conjunto de nós do grafo que a definem
- `def[node] ` de um nó é o conjunto de variáveis que ele define
- Analogamente para `use[var]` e `use[node]`

## Critérios para a análise de longevidade

- Variável `v` está viva em uma aresta **se** existe um  caminho direcionado dessa aresta até um uso de v, que não passa por alguma definição de `v`
- `live-in`: variável `v` é um live-in em um nó `n` se está viva em alguma in-edge de n. `in-edge` são as arestas que chegam dos predecessores
- `live-out`: variável `v` é live-out no nó `n` se `v`está viva em alguma out-edge de `n`. `out-edges` são as arestas que saem dos sucessores

## Computando a análise de longevidade

- Se `v` está em `use[n]` então `v` é live-in em `n`
- Se `v` é live-in no nó `n` então ela é live-out para todo `m` em `pred[n]`
- Se `v` é live-out no nó `n`, e não está em `def[n]` então `v` também live-in em `n`

## Algoritmo



# Exemplo

# Definition Use Chain ou DU-chain

É uma forma de otimização o armazenamento de longevidade. 

Para isso, cada sentença `s: t := alguma coisa, ...` armazena uma lista de sentenças `si` que usam `t`. Podemos usar como `(si, t)`, o tipo da variável (`t`) e a sentença (`si`).