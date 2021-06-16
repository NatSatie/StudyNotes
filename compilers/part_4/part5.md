# Stack Frame / Registros de ativação

## Introdução

Funções tem variáveis locais, e sobrevivem até que a função retorne. No caso de recursão cada instância da função tem seus próprios parâmetros e locais.

Quando chamamos funções funcionam como LIFO (last in, first out), e podemos usar uma pilha.

Motivação: [StackOverflow: Explain the concept of a stack frame in a nutshell](https://stackoverflow.com/questions/10057443/explain-the-concept-of-a-stack-frame-in-a-nutshell) 

## Stack Frame ou Registro de ativação

 Fazemos a manipulação de variáveis como um conjunto, e não podemos fazer o push e pop das variáveis inidivialmente. O SP (stack pointer), todas as posições além do SP são lixo e todas as anteriores são alocadas.



![imagem](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_4/stackframes.png)



O desenho acima descreve como funciona (por convenção) um frame pointer. Observe que cresce de cima para baixo (do endeço maior para o menor). Mas o formato do frame depende da: linguagem compilada, do processador alvo, e layout padrão do fabricante do processador.

### Porque as variáveis locais estão próximos do frame pointer?

Se fizermos o acesso do `endereço(frame_pointer) -+ CONSTANTE`, podemos acessar os argumentos do frame anterior, então podemos acessar variáveis locais e argumentos, dependendo do sinal da sua `CONSTANTE` ou `OFFSET`.



## Frame Pointer

Considere uma situação no qual `f()` chama `g(a_1, a_2, ... a_n)`, cada função são respectivamente, **caller/chamador** e **callee/chamado**.

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_4/stackframes_1.png)

### Passo 1 

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_4/stackframes_2.png)

### Passo 2

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_4/stackframes_3.png)

O frame pointer em algumas arquiteturas pode ser um registrador!

### Qual a utilidade do FP?



## Parâmetros

**🚧🚧🚧 EM CONSTRUÇÃO 🚧🚧🚧**

> Written with [StackEdit](https://stackedit.io/).
