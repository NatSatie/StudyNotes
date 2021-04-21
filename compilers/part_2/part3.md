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

> OBSERVAÇÃO IMPORTANTE: não estou seguindo o algoritmos dado pelo livro, é mais para efeito didático de entender a base.

## Exemplo prático (resolvido na forma errada)

Considere a seguinte gramática:

|  |  | | 
| --| --| --| 
| 1. Z -> d | 3. Y -> | 5. X-> Y| 
| 2. Z -> X Y Z | 4. Y -> c | 6. X-> a| 

### NULLABLE

Construindo NULLABLE, precisamos analisar quais são os não-terminais que derivam para uma string nula. 

O caso mais óbvio é a regra 3, que `Y-> (vazio)`.  O próximo deve ser X, que pode ser derivado para Y, porém, vimos que Y pode derivar em vazio.

E para `Z`? Se vermos a regra 2, `Z -> X Y Z`, se X e Y forem string vazias sobra somente `Z`. Porém, Z deriva para um terminal `a`.

| | Nullable | First | Follow 
| --| --| --| --| 
| X| yes | | | 
| Y| yes | | | 
| Z| no | | |

### FIRST

Vamos revisar a definição: 

> Dada uma string `s` de terminais e não-terminais, `FIRST(s)` é o conjunto de todos os terminais que podem iniciar uma string de terminais derivada de `s`.

Começando em ordem alfabética, `X` pode ser derivado de `Y (não terminal)` e `a (terminal)`. Porém, `Y` pode ser derivado para `vazio` ou `c (terminal)`. Então o first de `X` é `a c`. *Consideramos a notação sem vírgula, porque pode ser confundido com um terminal!*

Para `Y`, já percebemos que só tem um terminal: `c`.

E para `Z`? Ele pode derivar para `d`, como mostra a regra 1. Porém, ele deriva de X e Y também. Como Y pode ser `c` ou uma `string vazia`, temos que considerar que o primeiro não-terminal ou terminal pode ser algum terminal de `X` (se `Y` for uma `cadeia vazia`). Então Z pode ter como FIRST, `a c d`

| | Nullable | First | Follow 
| --| --| --| --| 
| X| yes | a c | | 
| Y| yes | c | | 
| Z| no | a c d | |

### FOLLOW

> `FOLLOW(x)` é o conjunto de terminais que podem imediatamente seguir `X`.

O que follow significa? Saberemos quais são os próximos terminais que um não-terminal espera receber (por isso se chama parsing preditivo).

Vamos iniciar com o `Z`, Z é uma das primeiras regras, e pode ser derivado para `d` ou `X Y Z`, porém não há nenhum terminal que segue depois dele. Então está com follow `vazio`.

Quando analisamos Y, temos a possibilidade de ter como próximo terminal, na regra 2. `Z -> X Y Z`, então pode ter `d`.

Para X, podemos ter `d ou c` como terminais seguidos.

| | Nullable | First | Follow 
| --| --| --| --| 
| X| yes | a c | c d| 
| Y| yes | c | d| 
| Z| no | a c d | |

Veja a solução correta logo abaixo do algoritmo correto

## Exemplo prático (resolvido do jeito certo)

Como devemos computar nosso algoritmo da tabela NULLABLE, FIRST, FOLLOW;

```javascript

//inicializar FIRST e FOLLOW vazios. NULLABLE deve ser todos falsos

1 for each terminal symbol i:
2 	FIRST[i] = {i}
3 repeat
	// significa para cada regra que X -> Y_1 ... Y_k
	// X -> Y_1 ... Y_k === X deriva para Y_1 ...
	// Y podem são outras regras de produção
	// k é um inteiro 
4 	for each production X -> Y_1 Y_2 ... Y_k
		// Se todas as regras derivam a uma string nula 
		// ou não existe uma regra de produção em X
5 		if Y_1 ... Y_k são todos nullable OU k = 0 
6 			NULLABLE[X] = true
		// Percorre todas as regras de produção de X com i
		// E ao msm tempo,
		// percorre com j, uma regra de produção a frente
7 		for each i in 1 to k, each j from i+1 to k
			// Se as regras de 1 a i-1 derivam a uma string nula 
			// ou se i é a primeira regra
8 			if Y_1 .. Y_{i-1} são todos nullable ou i=1
				// U é união
9 				FIRST[X] = FIRST[X] U FIRST[Y_i]
			// Se todas as regras de i+1 a k derivam a uma string nula 
			// ou está na última regra
10 			if Y_{i+1} .. Y_k são todos nullable ou i=k
11				FOLLOW[Y_i] = FOLLOW[Y_i] U FOLLOW[X]
			// Se as regras de i+1 a j-1 derivam a uma string nula 
			// ou a próxima regra é a mesma 
			// Os tokens que seguem Y_i recebem os terminais e não-terminais que começam com Y_j 
12 			if Y_{i+1} .. Y_j-1 são todos nullable ou i+1=j
13				FOLLOW[Y_i] = FOLLOW[Y_i] U FIRST[Y_j]
```
### Versão do Algoritmo mais clean
```javascript

//inicializar FIRST e FOLLOW vazios. NULLABLE deve ser todos falsos

1 for each terminal symbol i:
2 	FIRST[i] = {i}
3 repeat
4 	for each production X -> Y_1 Y_2 ... Y_k
5 		if Y_1 ... Y_k são todos nullable OU k = 0 
6 			NULLABLE[X] = true
7 		for each i in 1 to k, each j from i+1 to k
8 			if Y_1 .. Y_{i-1} são todos nullable ou i=1
9 				FIRST[X] = FIRST[X] U FIRST[Y_i]
10 			if Y_{i+1} .. Y_k são todos nullable ou i=k
11				FOLLOW[Y_i] = FOLLOW[Y_i] U FOLLOW[X]
12 			if Y_{i+1} .. Y_j-1 são todos nullable ou i+1=j
13				FOLLOW[Y_i] = FOLLOW[Y_i] U FIRST[Y_j]
```

Então vamos seguindo as regras do algoritmo :

### Passo 1: inicialização

| | Nullable | First | Follow 
| --| --| --| --| 
| X| no | | | 
| Y| no | | | 
| Z| no | | |

### Passo 2: primeiro ciclo de for

| | Nullable | First | Follow 
| --| --| --| --| 
| X| no | a| | 
| Y| no | c| | 
| Z| no | d| |


### 🛠️ TODO: em progresso o resto do passo a passo 

### Solução

| | Nullable | First | Follow 
| --| --| --| --| 
| X| yes | a c |a c d| 
| Y| yes | c | a c d| 
| Z| no | a c d | |
 
> Written with [StackEdit](https://stackedit.io/).
