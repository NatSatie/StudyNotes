# Representação intermediária (IR)

Dentro da disciplina de compiladres começamos a transição para o back-end do compilador, isso significa que vamos para a transformação do código de máquina.

IR é intermediate representation, então pegamos a nossa AST para uma representação masi baixo nível para que seja compilado para várias linguegens.

> An **intermediate representation** (**IR**) is the [data structure](https://en.wikipedia.org/wiki/Data_structure "Data structure") or code used internally by a [compiler](https://en.wikipedia.org/wiki/Compiler) or [virtual machine](https://en.wikipedia.org/wiki/Virtual_machine "Virtual machine") to represent [source code](https://en.wikipedia.org/wiki/Source_code). An IR is designed to be conducive for further processing, such as [optimization](https://en.wikipedia.org/wiki/Compiler_optimization "Compiler optimization") and [translation](https://en.wikipedia.org/wiki/Program_transformation "Program transformation").[[1]](https://en.wikipedia.org/wiki/Intermediate_representation#cite_note-Walker-1)

## Características de uma IR:

**Exemplo: Acesso a variáveis/estrutura de dados de alto nível:**
Considere um processador com arquitetura RISC, quando acessamos um array `A` de inteiros, precisamos fazer uma certa quantidade de etapas/tarefas (sequência de instruções). 
Pegar o frame pointer para pegar o endereço base e apontar ao heap. Quero acessar  o índice `i` e multiplicar por 4 (todo acesso de um índice em um Assembly é de 4 bytes). E assim temos o endereço base para nosso heap.

Diante disso, seria melhor que nossos processadores compreendessem arrays pela representação intermediária. E com a IR podemos conservar nossa AST sem prejuízos de converter estruturas de dados de alto nível para Assembly

### Representação Gráfica:
Podemos usar árvores ou um DAG - *directed acyclic graph*. Quando encontramos um nó, transformamos para um nó da árvore. E é usado para avaliar o fluxo de computação (ex: a := b+c) e não de controle (ex: if statement)

### Como construímos o DAG?
- DAG é assciado a uma expressão
- Nós internos são operadores
- Folhas são operandos (variáveis e constantes)
- Nós póssuem rótulos que representam o último valor computado para aquele nó

`a := b * -c + b * -c`

```javascript]]
// Representação de uma árvore
// (something) é um label para o operador/variável
// Construção de uma árvore é de baixo para cima

         assign (a1)
	       /    \
	   (a0)a   (t2)+
	           /    \
	        (t1)*   (t1)*
	       /    |     |    \   
	      /     |     |     \
    (b0)b (t0)uminus (b0)b  (t0)uminus 
                |                |
             (c0)c             (c0)c    
```

```javascript
//Representação de uma DAG
         assign (a1)
	       /    \
	   (a0)a   (t2)+
	            ()
	           (t1)*
		       /   \   
		      /     \
	      (b0)b    (t0)uminus 
	                   |
	                 (c0)c    
```

## Aplicações de IR

 - Detecção de sub-expressões comuns
 - Detecção de identificadores, basta observar as folhas
 - Detecção de sentenças que geram valores que podem ser usados fora do bloco.

Lembre-se DAG pode ter mais de uma raiz e árvore não, por isso, podemos ver a raiz e por onde vai ser usado.

*Nas referências dos livros são representações em árvore.*

## Representação em árvore 
Considere quando pensamos em assembly, podemos pegar o frame pointer, somar o offset para somar o endereço da base do array/do vetor, obs: o compilador aloca memória para o array, o array todo fica no heap.

Mains informações de alocação de memória em um array:
[Vídeo](https://youtu.be/KvZUY4QHkVo)
[Leitura](http://www.cs.ecu.edu/karl/3300/spr16/Notes/C/Array/heap.html)

```javascript
//Exemplo: a[i]
//MEM == memória
		   	  MEM
			   |
			   +
			/     \
		  MEM     BINOP
		  |       /  |  \
		  e     MUL  i   CONST
			   	 	      |
					      w
```

**🚧🚧🚧 EM CONSTRUÇÃO 🚧🚧🚧**

> Written with [StackEdit](https://stackedit.io/).
