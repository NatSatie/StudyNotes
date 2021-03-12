# Minhas péssimas práticas como programadora😨
Comecei a trabalhar no meu primeiro emprego como estagiária. Resolver problemas torna-se muito mais complexo do que resolver exercícios na academia e gostaria de compartilhar meus péssimos hábitos que estão sendo corrigidos no momento.

## Uso de IFs
A condicional é uma das primeiras sentenças lógicas que usamos em programação. E é muito comum usarmos para resolver problemas dos mais simples até os complexos. No entanto, ele pode ser dispensável em **várias** situações, isso pode melhorar a performance do seu programa.

### Muitos ifs 🚫
![Cadeia de IFs](https://diogommartins.files.wordpress.com/2016/08/hadouken-indentation.jpg?w=720&h=312&crop=1)

No StackOverflow, podemos ver [discussões como boas e más práticas com o uso de ifs](https://stackoverflow.com/questions/33934703/is-using-too-many-if-statements-bad-programming/33935093), mas sempre é importante lembrar que temos os:

1. [Ternários](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Operators/Conditional_Operator)

``` javascript
	(Condição) ?
		(resultado se for verdadeiro)
		: (resultado se for falso);
```
2.  Sentenças lógicas (and, or, logical shifts)
*Adicionar mais exemplos*

> Written with [StackEdit](https://stackedit.io/).
