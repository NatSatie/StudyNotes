# Introdução de Parsing

O nosso lexer pode ser construído a partir de uma DFA ou NFA, ou até mesmo uma NFA convertida para DFA. Dessa forma temos uma árvore de tokens organizados hierarquicamente.

Para isso precisamos verificar frases corretas, da mesma forma que o lexer é capaz de identificar palavras corretas.

Como a entrada do Parser é uma sequência de tokens em uma determinada combinação. E precisamos reconhecer cadeias corretas de tokens em nossa linguagem.

Assim que conhecemos frases corretas, ou cadeias corretas de tokens. Da mesma forma que no inglês temos `"SUJEITO" + "VERBO" + "PREDICADO".`

## Analisador Sintático
Ele recebe uma sequência de tokens vindo do analisador láximo e determina se a frase / string de tokens corresponde à gramática.

Um dos serviços essenciais é identificação de erros, por exemplo.
```
	// Isso é uma empressão em regex
    expr = ab(c|d)e
```
```
	//Será que posso transformar o regex em uma frase?
    aux = c | d
    expr = a b aux e
```

## Gramáticas livres de contexto

Será que é possível que podemos adicionar nomes com expressões regulares e definirmos a gramática? Uma soma pode ser valores numéricos com um +.

Quando analisamos determinados exemplos, percebemos que determinadas expressões depende uma da outra, provocando uma relação de recursão mútua. E não podemos representar expressões apenas por regex. Com autômatos determinísticos também não temos a capacidade de contagem (memória unitária).

Nossa forma de produção será a partir desse modelo:

`symbol -> symbol symbol symbol  (...) symbol `

Então, precisamos definir os símbolos como:

 - Terminais: uma string do alfabeto da linguagem
 - Não-terminais: aparecem do lado esquerdo
 - Start symbol: um não terminal

### Exemplo de Gramática livre de contexto

S é uma sentença; E é expressão; L é lista
Sentenças não tem valor associado, apenas efeitos colaterais.

|S  | E | L|
|--|--|--|
| 1. `S -> S;S` ; é um terminal |  4. `E->id` |  8. `L->E`|
| 2. `S-> id:=E` id:= efeito colateral| 5. `E->num`| 9. `L->E` |
| 3. `S-> print(L)` print() efeito colateral| 6. `E->E+E`| |
| | 7. `E->(S,E)`| |
 
## Derivações

Considere a expressão:

`a:=7; b:=c+(d:=5+6,d)`

Vamos seguir de uma derivação da esquerda para a direita. O que estiver em negrito é o que vai ser derivado no passo seguinte.

| Passo | Resultado | Regra |
|--|--|--|
| 1 | **S** |1. `S -> S;S`|
| 2 | **S**; S  |2. `S-> id:=E`|
| 3 | id:=**E**; S  |5. `E->num`|
| 4 | id:=num; **S**  |2. `S-> id:=E`|
| 5 | id:=num; id:=**E**  |6. `E->E+E`|
| 6 | id:=num; id:=**E**+E  |4. `E->id`|
| 7 | id:=num; id:=id+**E**  |7. `E->(S,E)`|
| 8 | id:=num; id:=id+(**S**,E)  |2. `S-> id:=E`|
| 9 | id:=num; id:=id+(id:=**E**,E)  |6. `E->E+E`|
| 10 | id:=num; id:=id+(id:=**E**+E,E)  |5. `E->num`|
| 11 | id:=num; id:=id+(id:=num+**E**,E)  |5. `E->num`|
| 12 | id:=num; id:=id+(id:=num+num,**E**)  |4. `E->id`|
| 13 | id:=num; id:=id+(id:=num+num,id)  |4. `E->id`|

Temos dois tipos de derivações

 1. Leftmost derivation: da esquerda para a direita
 2. Rightmost derivation: da direita para a esquerda

## Parse Trees

> Written with [StackEdit](https://stackedit.io/).
