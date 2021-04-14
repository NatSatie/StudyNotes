# AST: Abstract Syntax Tree

📺 [Vídeo de Referência](https://youtu.be/jpfaXK4xCYE)

Para lembrar, é importante ressaltar que uma parser tree é uma derivação de uma sequência de tokens, no entanto, seu modelo não é suficiente para um compilador.

As ASTs são parecidas com as parser trees com alguns comportamentos especiais.

A ideia da ASTs é eliminar parte dos lixos desnecessários. 

## Aula: Porque usarmos uma AST? Recursive Descend Parser

Considere a seguinte gramática LR (1) *(left to right parsing, rightmost derivation)* abaixo:

*E = expression ; T = Termo;  F = Fator*

(Relembrando) Para que essa gramática fosse realmente efetivada para ser um parser primitivo é necessário remover as recursões para a esquerda. 

Quando a recursão são feitas as devidas eliminações podemos usar o empty para terminar a busca.

**Gramática para Expressões **

| |  |
|--|--|
| E-> E + T | E-> id |
| E-> E - T | E-> num | 

**Remoção de ambiguidades**
| menor prioridade hirárquica | <- | maior prioridade hierárquica |
|--|--|--|
| E-> E + T | T-> T * F | F -> id |
| E-> E - T | T-> T / F | F -> num |
| E-> T     | T-> F     | F -> (E)|

**Remove recursão à esquerda**
| |  |  |
|--|--|--|
| S -> E $   | T-> F T'    | F -> id |
| E-> T E'   | T'-> * F T' | F -> num |
| E'-> + T E'| T'-> / F T' | F -> (E)|
| E'-> - T E'| T-> F     | |
| E'-> empty | | |

``` javascript
// Parser primitivo

// kind corresponde ao tipo, val é um objeto
class Token {
	int kind; Object val;
	Token( int k, Object v) {
			kind = k;
			val = v;
	}
}

// Nomes para os tokens
final int EOF=0, ID=1, NUM=2, PLUS=3, MINUS=4, ...

// Método lookup que busca quem é essa string id; Ela verifica se está presente ou não
int lookup(String id){...}

// follow é forma de sincronização
int F_follow[] = {PLUS, MINUS, RPAREN, EOF};

// Método da função
int F() {
	switch(tok.kind){
		//Corresponde à primeira regra da gramática F -> id
		case ID:
			int i = lookup( (String) (tok.val));
			advance();
			return i;
		case NUM:
			int i=((Integer) tok.val).intValue();
			advance();
			return i;
		case LPAREN:
			eat(LPAREN);
			int i = E();
			eatOrSkipTo(RPAREN, F_follow);
			return i
		case EOF:
		default:
			print("expected ID, NUM or left-paren");
			skipto(F_follow);
			return 0;
	}
}
```

Nesse caso temos um parser com interpretador combinados. E se gerarmos automaticamente?

> 🥳 Fun fact: [AST Explorer, aplicação de AST em Javascript](https://astexplorer.net/)

```javascript

// Geração automática do JavaCC
// O que está entre chaves é aquilo que vou interpretar no parser

// Start é o mergulho na expressão
void Start():
	{ int i;}
	// i é o resultado da interpretação
	{ i = Exp() <EOF> {
			// Essa é ação tomada quando é entendida pelo interpretador
			Sysmtem.out.println(i);
		}
	}
int Exp():
	{ int a,i;}
	{ a = Term()
		(
			"+" i=Term(){ a=a+i;}
			| "-" i=Term(){ a=a-i;}
		)*
		{return a;}
	}

int Term(): 
	{...}

int Factor():
	{...}
```

> Written with [StackEdit](https://stackedit.io/).
