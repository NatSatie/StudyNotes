# Conversão NFA em DFA 

Como a NFA depende de muito chutes, isso significa que seu custo de processamento é mais caro, além dos recursos utilizados.

Por isso que usamos conversão de uma NFA para DFA.

## Exemplo 1: in

De acordo com a imagem abaixo nosso IF pode ser uma NFA da seguinte forma:
(Perdão ao erro de colocar um texto preto e um cinza, eu tinha lido if sem querer )

### Passo 1: 
Primeiramente vamos observar a imagem abaixo, temos nosso primeiro passo em {1}

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_1/img/nfa_to_dfa.png)

### Passo 2

Vamos percorrer a imagem a partir de todos os <img src="https://latex.codecogs.com/gif.latex?\epsilon" title="\epsilon" /> que existem no estado {1}. Temos o conjunto dado como {2,5, 10, 15}

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_1/img/nfa_to_dfa_01.png)

### Passo 3

Como não temos nenhum <img src="https://latex.codecogs.com/gif.latex?\epsilon" title="\epsilon" /> para percorrer, então precisamos verificar quais caminhos que aceitam o caractere i, então temos {3, 6, 16}

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_1/img/nfa_to_dfa_02.png)

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_1/img/nfa_to_dfa_03.png)

### Passo 4

Nesse caso temos mais um <img src="https://latex.codecogs.com/gif.latex?\epsilon" title="\epsilon" /> no caminho de {6} para {9} e de {9} para {7}

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_1/img/nfa_to_dfa_04.png)

### Passo 5

Agora finalmente seguimos para a letra "n" de "in", que nesse casso nos resta apenas {8}, porém, 
{8} tem um <img src="https://latex.codecogs.com/gif.latex?\epsilon" title="\epsilon" /> para {9}, que é um estado final.

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_1/img/nfa_to_dfa_05.png)

### Conclusão

> Written with [StackEdit](https://stackedit.io/).
