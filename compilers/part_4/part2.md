# Seleção de instruções e maximal munch

Considere que: 

 1. IR é representada com árvores;
 2. Uma árvore da IR expressa uma operação "simples" em cada nó (Acesso À memória, operador binário e salto condicional)
 3. Instruções da máquina podem realizar uma ou mais dessas operações

```
// Que instrução é essa?
// Estamos somando duas expressões que aponta para um lugar na memória
// CONST = constante
		MEM
		 |
		 +
	/    |    \
PLUS	 e 	CONST
				|
				e
```

## Padrões de árvores
Podemos expressar as instruções da máquina como um fragmento da árvore de IR.
 
### Exmplo: arquitetura Joulette
 - Arquitetura load/store
 - qq instrução pode acessar qq registrador
 - registradores podem armazenar dado ou endereçõ
 - r_0 sempre contém zero
 - cada instrução 1 ciclo

### 1. ADD e MUL:
Efeito ADD: r_i <- r_j + r_k
Efeito MUL: r_i <- r_j * r_k

Árvores:
```
  +       *
/   \   /   \
``` 

```
 -> + (r_i)
  /   \ 
 r_j  r_k
``` 

### 2. SUB e DIV:
Efeito SUB: r_i <- r_j - r_k
Efeito DIV: r_i <- r_j / r_k

Árvores:

```
  -       /(DIV)
/   \   /   \
``` 

### 3. ADDI:

Efeito ADDI: r_i <- r_j + c

Árvores:
```
     +        +          CONST
   /   \    /   \    
CONST         CONST  
``` 

### 4. SUBI:

Efeito SUBI: r_i <- r_j - c

Árvores:
```
     -    
   /   \  
CONST     
``` 

### 5. LOAD:
Efeito LOAD: r_i <- M[r_j + c]

Árvores:
```
      MEM           MEM        MEM        MEM
       |             |          |          |
       +             +        CONST
      / \           / \
        CONST    CONST  
``` 

### 6. STORE:

Efeito STORE: M[r_j + c] <- r_i

Árvores:
```
        MOVE       MOVE         MOVE         MOVE
       /  \        /  \        /    \       /    \
      MEM          MEM        MEM          MEM 
       |            |         |            |          
       +            +       CONST    
      / \          / \
        CONST   CONST  
``` 

### 7. MOVEM (CISC) **:

Efeito MOVEM: M[r_j] <- M[r_i]

(detalhar mais)


## Seleção de instruções: Exemplo

`a[i] := x`

```
					  MOVE
				    /      \
				  MEM      MEM
				   |         |
				   +         +
				  /    \      / \
			    MEM     *    FP  CONST_x
			     |      |  \
			     +  TEMP_i  CONST_4  
			    / \
			  FP  CONST_a
```
*escrever solução*

![gráfico](https://github.com/NatSatie/StudyNotes/blob/main/compilers/part_4/3QuGyH6RhG.gif?raw=true)

### A solução é única? 

Não!

![](https://github.com/NatSatie/StudyNotes/blob/main/compilers/part_4/N9bfZPymF1.gif?raw=true)

## Maximal Munch:

>In [computer programming](https://en.wikipedia.org/wiki/Computer_programming) and [computer science](https://en.wikipedia.org/wiki/Computer_science "Computer science"), "**maximal munch**" or "**longest match**" is the principle that when creating some construct, as much of the available input as possible should be consumed.
>[Wikipedia](https://en.wikipedia.org/wiki/Maximal_munch#:~:text=In%20computer%20programming%20and%20computer,this%20term%20is%20by%20R.G.G.)

Encontra a cobertura mais otimizada (optimal)

### Passos:
- inicie no nó raiz
- encontre o maior padrão que possa ser encaixado a aquele nó
	- cubra a raiz e provavelmente os outros nós
- repira o processo da árvore IR a ser coberta
- para cada padrão selecionado uma instrução é gerada



> Written with [StackEdit](https://stackedit.io/).
