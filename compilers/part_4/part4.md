# Representação Intermediária Linear, Blocos Básicos

IR se parece a uma pseudo-código para uma máquina abstrada, como em Java (bytecode), GCC e código de três endereços.

## Código de três endereços

Forma geral: `x := y op z`
Representação linearizada de uma árvore sintática ou DAG

(Ver parte 1 sobre Representação intermediária)

`a := b * -c + b * -c`

```javascript
// Representação de uma árvore
// (--) não representa nada é apenas para preencher espaço e não quebrar o desenho que fiz da árvore
// Construção de uma árvore é de baixo para cima

         assign (--)
	       /    \
	   (--)a   (--)+
	           /    \
	        (--)*   (--)*
	       /    |     |    \   
	      /     |     |     \
    (--)b (--)uminus (--)b  (--)uminus 
                |                |
             (--)c             (--)c    
```
 | t = temporário |
 |--|
 | `t1 := -c`|
 | `t2 := b*t1`|
 |...|
 
### Exemplo: Produto interno

```
// Código original
prod = 0
i = 0
while ( i <= 20) {
	prod = prod + a[i] * b[i];
	i = i + 1; 
}
```

 1. prod := 0
 2. i := 1
 3. t1 := 4*i
 4. t2 = a[t1]
 5. t3 = 4*i
 6. t4 : = b[t3]
 7. t5 := t2 * t4
 8. t6 := prod + t5
 9. prod := t6
 10. t7 := i+1
 11. i := t7
 12. if i <= 20 goto(3)

Observe que esse código é bem semenlhante à ideia do assembly

### Representação

Usamos uma representação em **quádruplas, (op, arg1, arg2, result)**, operador, argument 1, argumento 2 e resultado. Ou em triplas usando um apontador para onde estamos usando esse cálculo, como fazemos isso?

Considere a expressão e seus temporários

`a := b* -c + b*-c`

 0. t1 := -c
 1. t2 := b*t1
 2. t3 := -c
 3. t4 := b*t3
 4. t5 := t2 + t4
 5. a := t5

Podemos converter em triplas como:

 - (0) -> (-, c, )
 - (1) -> (*, b, (0) ) **Observe que em (1) estamos em t2 := b*t1, e (0) é o apontador de  **
 - (2) -> (-, c, )

## Geração de código de três endereços

Como geramos esse código? Podemos usar a AST usando as ações da gramática com atributos.

### Exemplos

### Control-Flow Graph (CFG)

É a representação gráfica do código de três endereços, usamos o nós como parte do código de programação e as arestas como fluxo de controle.

### Blocos Básicos

São sequência de instruções consecutivas, seu fluxo de controle é entrar no código (entra no bloco), sai pelo final (fim do bloco), e *não existem saltos para dentro desse bloco para outro*. Ou seja, não temos *if*'s

## Bônus: Visualização mais didática sobre aplicação de Blocos básicos

Veja essas aulas de referência

Referência principal: [# Compiler Design Lec - 56 -Basic blocks and Flow graphs in Compiler design by Deeba Kannan](https://youtu.be/hzNFRDGZAE4)
Referência secundária: [# What is Basic Block & Flow Graph in Compiler | Partition Algorithm in Basic Block](https://youtu.be/tkSsh91ehUA)

## Algoritmo: Leader

**Input**: uma sequência de 3-address code
**Output**: lista de blocos básicos

**Método:**
	
 1. Primeira instrução em 3-address code
 2. Qualquer instrução que é alvo de uma condicional ou um salto não-condicional
 3. Qualquer instrução que imediatamente segue uma condicional ou um salto condicional

Veja o seguinte código:

```
1  i =1
2  j = 1
3  t1 = 10 * i
4  t2 = t1 * j
5  t3 = 8 + j
6  t4 = t3 -88
7  a[t4] = 0.0
8  j = j + 1
9  if j <= 10 goto(3)
10 i= i+1
11 if i <= 10 goto(2)
12 i = 1
13 t5 = i-1
14 t5 = 88 * t5
15 a[t5] = 1.0
16 i = i+1
17 if i <= 10 goto(13)
 ```

| Instruction | Leader |
|--|--|
|Load (primeira regra): | 1
| Load(primeira + segunda regra): | 1, 3, 2, 13
| Load(primeira + segunda + terceira regra): | 1, 3, 2, 13, 10, 12

O bloco básico começa de um líder para outro.

```
// Basic block 1 começo
	1  i =1
// Basic block 1 fim
// Basic block 2 começo
	2  j = 1
// Basic block 2 fim
// Basic block 3 começo
	3  t1 = 10 * i
	4  t2 = t1 * j
	5  t3 = 8 + j
	6  t4 = t3 -88
	7  a[t4] = 0.0
	8  j = j + 1
	9  if j <= 10 goto(3)
// Basic block 3 fim
// Basic block 4 começo
	10 i= i+1
	11 if i <= 10 goto(2)
// Basic block 4 fim
// Basic block 5 começo
	12 i = 1
// Basic block 5 fim
// Basic block 6 começo
	13 t5 = i-1
	14 t5 = 88 * t5
	15 a[t5] = 1.0
	16 i = i+1
	17 if i <= 10 goto(13)
// Basic block 6 fim
 ```

E qual o resultado disso? (Desculpa fioquei com preguiça de desenhar)

![](https://github.com/NatSatie/StudyNotes/blob/main/compilers/part_4/chrome_qugGFZizf9.png?raw=true)

> Written with [StackEdit](https://stackedit.io/).
