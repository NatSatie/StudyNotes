# Parsing Preditivo 🔮

Também chamado de **recursive-descent**. Cada produção se torna uma cláusula em uma função recursiva.

Temos uma função para cada não terminal.

### Exemplo: Parser LL

 1. `S -> if E then S else S`
 2. `S -> begin S L`
 3. `S -> print E`
 4. `L -> end`
 5. `L -> ; S L`
 6. `E -> num =num`

Observe que S tem 3 regras de produção, enquanto L tem duas regras de produção e E tem uma regra de produção. O critério de distinção dessas regras são a presença de terminais diferentes.

> Se você tiver tokens diferentes (terminais diferentes) começando as regras de uma produção de um mesmo não terminal e isso for válido para todos os não terminais então tem um parser LL.

```javascript
final int IF=1, THEN=2, ELSE=3, BEGIN=4, END=5, PRINT=6, SEMI=7, NUM=8, EQ=9;

int tok = getToken();

void advance(){
	tok =getToken();
} 

void eat(int t){
	if (tok==t)
		advance();
	else
		error();
}

void S() {
	switch(tok){
		case IF:
			eat(IF);
			E();
			eat(THEN);
			S();
			eat(ELSE);
			S();
			break;
		case BEGIN:
			(...)
	}
}
(...)
```

Dentro do nosso predictive parser, não é o suficiente qual terminal podemos usar. Mesmo que sejam observados k tokens (LL(k))

### OBS: Significado de LA, LL e LR

- LA: look ahead
- LL: left to right , leftmost derivation
- LR: left to right, rightmost derivation





> Written with [StackEdit](https://stackedit.io/).
