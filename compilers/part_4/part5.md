# Stack Frame / Registros de ativação

## Introdução

Funções tem variáveis locais, e sobrevivem até que a função retorne. No caso de recursão cada instância da função tem seus próprios parâmetros e locais.

Quando chamamos funções funcionam como LIFO (last in, first out), e podemos usar uma pilha.

Motivação: [StackOverflow: Explain the concept of a stack frame in a nutshell](https://stackoverflow.com/questions/10057443/explain-the-concept-of-a-stack-frame-in-a-nutshell) 

# Stack Frame ou Registro de ativação

 Fazemos a manipulação de variáveis como um conjunto, e não podemos fazer o push e pop das variáveis inidivialmente. O SP (stack pointer), todas as posições além do SP são lixo e todas as anteriores são alocadas.



![imagem](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_4/stackframes.png)



O desenho acima descreve como funciona (por convenção) um frame pointer. Observe que cresce de cima para baixo (do endeço maior para o menor). Mas o formato do frame depende da: linguagem compilada, do processador alvo, e layout padrão do fabricante do processador.

### Porque as variáveis locais estão próximos do frame pointer?

Se fizermos o acesso do `endereço(frame_pointer) -+ CONSTANTE`, podemos acessar os argumentos do frame anterior, então podemos acessar variáveis locais e argumentos, dependendo do sinal da sua `CONSTANTE` ou `OFFSET`.

# Frame Pointer

Considere uma situação no qual `f()` chama `g(a_1, a_2, ... a_n)`, cada função são respectivamente, **caller/chamador** e **callee/chamado**.

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_4/stackframes_1.png)

### Passo 1 

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_4/stackframes_2.png)

### Passo 2

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_4/stackframes_3.png)

O frame pointer em algumas arquiteturas pode ser um registrador! Além disso

- Seus tamanhos são variados
- podem ter tamanho fixos (normalmente)
  - O Frame pointer sempre será diferente do SP por um tamanho conhecido
  - Não precisa gastar um registrador

### Qual a utilidade do FP?

Às vezes não sabemos o tamanho do frame pointer, as vezes descobrimos no tempo de compilação. 

[Mais referências sobre a diferença de SP e FP](https://www.embeddedrelated.com/showthread/comp.arch.embedded/31646-1.php#:~:text=The%20stack%20pointer%20always%20points,the%20frame%20pointer%20(ever).)

# Parâmetros

Quase todas as chamadas de funções tem no máximo 4 parâmetros (quase nenhuma tem 6). Atualmente os parâmetros (`k = 4 ou 6`) são passados pelos registradores e o restante na pilha.

## Registradores

O número de registradores é limitado, e muitas funções podem usar os mesmos registradores ao mesmo tempo. Considere `f()` e `g()` usam o mesmo registrador `r`. Na arquitetura MIPS temos:



- Caller-save (caller é chamador, save é salvar): `f` salva e restaura o registrador `r` . `$t0 - $t9`
- Callee-save (callee é chamado, save é salvar): `g` salva e restaura o registrador `r`  `$s0 - $s9`



### Exemplo 1: Caller-save ($t0 - $t9)

```
g(a1, a2, ...){
	// g() não precisa salvar o registrador $t1, pois o callee salva se precisar
	$t1 = 2 * $t2
}
```

Considere que o código quando tem  `>>>` quer dizer que é a localização do compilador

```
// Passo 1
f(...){
	>>> x = y + 1
	// $t é o caller-save, que foi criado para a linha apontada
	$t1 = x
	g(a1, a2, ...)
}
```

```
// Passo 2
f(...){
	x = y + 1
	>>>  g(a1, a2, ...)
	// x não é chamado novamente, então o $t1 não exis
}
```

### Exemplo 2: Calle-save ($s0 - $s9)

```
// g() somente salva se precisar de $s1 dentro
g(a1, a2, ...){
	// G() é rersponsável por salvar $s1
	$s1 = 2 * k
}
```

```
g(a1, a2, ...){
	// Pilha = $s1
	$s1 = 2 * k
	// $s1 = pilha
}
```

### Exemplo 3: Calle-save ($s0 - $s9)

```
// Passo 1
	// x é alocado a um registrador callee-save $s1
f(...){
	>>> x = y + 1
	// Então $s1 = x
	g(a1, a2, ...)
	// Como x é usado depois da chamada de g(), então temos que recuperar o valor de x
	// x = $s1
	y = 2*x
}
```

```
// Passo 2
	// SE g() não usar $s1, podemos substituir o x por $s1 diretamente
f(...){
	$s1 = y + 1
	g(a1, a2, ...)
	y = 2*$s1
}
```

## Endereço de Retorno

Atualmente, a pilha fica no ra ou $31pela arquitetura MIPS.

Procedimentos que não são folhas (**TODO:** verificar o que é ), devem salvar na pilha.

## Statics Links

Temos funções aninhadas (como abaixo), no qual precisamos de uma ligação entre o stack frame de f para o stackframe de g para acessar o valor de x, então teremos um apontador ou static link que aponta ao frame de g  

```
int f(){
	int x
	int g(){
		y = x
	}
}
```





> Written with [StackEdit](https://stackedit.io/).