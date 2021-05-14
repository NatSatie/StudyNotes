# Representação intermediária

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

```javascript
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

**🚧🚧🚧 EM CONSTRUÇÃO 🚧🚧🚧**

> Written with [StackEdit](https://stackedit.io/).
