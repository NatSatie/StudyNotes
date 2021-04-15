# Construindo Predictive Parser🔮

Vamos verificar como podemos construir o algoritmo do LL parser. Para isso vamos usar três tópicos essenciais: FIRST, NULLABLE, FOLLOW.

## FIRST

Dada uma string `s` de terminais e não-terminais, `FIRST(s)` é o conjunto de todos os terminais que podem iniciar uma string de terminais derivada de `s`.

 1. `T -> id`
 2. `T -> num`
 3. `T -> (E)`

`s = T * F`
Portanto os primeiros elemntos são:
`FIRST(s) = {id, num, ( }`

## NULLABLE

O `NULLABLE(x)` é verdadeiro se X pode derivar a string vazia. E seu retorno pode ser sim ou não (true or false).

## FOLLOW

`FOLLOW(x)` é o conjunto de terminais que podem imediatamente seguir `X`.




> Written with [StackEdit](https://stackedit.io/).
