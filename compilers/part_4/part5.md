# Stack Frame / Registros de ativação

## Introdução

Funções tem variáveis locais, e sobrevivem até que a função retorne. No caso de recursão cada instância da função tem seus próprios parâmetros e locais.

Quando chamamos funções funcionam como LIFO (last in, first out), e podemos usar uma pilha.

Motivação: [StackOverflow: Explain the concept of a stack frame in a nutshell](https://stackoverflow.com/questions/10057443/explain-the-concept-of-a-stack-frame-in-a-nutshell) 

## Stack Frame ou Registro de ativação

 Fazemos a manipulação de variáveis como um conjunto, e não podemos fazer o push e pop das variáveis inidivialmente. O SP (stack pointer), todas as posições além do SP são lixo e todas as anteriores são alocadas.



![imagem](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_4/stackframes.png)



O desenho acima descreve como funciona (por convenção) um frame pointer. Observe que cresce de cima para baixo (do endeço maior para o menor). Mas o formato do frame depende da: linguagem compilada, do processador alvo, e layout padrão do fabricante do processador.







## Frame Pointer

## Parâmetros

**🚧🚧🚧 EM CONSTRUÇÃO 🚧🚧🚧**

> Written with [StackEdit](https://stackedit.io/).
