# 1.1 Tokens

Vamos começar com a introdução do compilador, para isso temos um programa fonte (source program) que pode estar em C (qualquer linguagem compilada), que será dividida em pequenos pedaços chamado de tokens. 

Os tokens são pequenas estrutura de dados que contém uma constante associada e seu respectivo id.

| index | Variable name | value |
|:--------:|:--------:| :--------:| 
| 1 | position | ... | 
| 2 | initial | ... | 
| 3 | rate | ... | 


``` javascript
    position = inicial + rate * 60
    
    \\Quando passa pelo Lexical Analyser
    \\ <token-name, attribute-value>
    
    <id, 1> <=> <id,2> <+> <id, 3> <*> <60>
```
A análise lexical, verifica as estruturas lexicais e se estão corretas, passamos por uma árvore. 

![parse Tree](https://github.com/NatSatie/StudyNotes/blob/main/compilers/part_1/img/parse.gif)

> Written with [StackEdit](https://stackedit.io/).
