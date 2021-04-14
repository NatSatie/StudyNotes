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

(não terminei de escrever, perdão)


> Written with [StackEdit](https://stackedit.io/).
