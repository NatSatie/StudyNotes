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


## Não - tokens

 - Comentários
 - preprocessor directive (bibliotecas, defines)
 - MACROS (ex: NUMS)
 - espaços, identações e newlines

## Analisador Léxico
Temos algumas regras lexicográficas.

 1. O identificador é uma sequência de letras e dígitos
 2. O primeiro caractere do identificador deve ser uma letra
 3. _ ou underscore é uma letra
 4. Caixa alta e caixa baixa são diferentes
 5. Se o input foi dividido em tokens acima do número de caracteres o próximo token deve incluir o maior string que é definido como um token.
 6. espaços, identações e newlines e comentários são ignorados EXCETO se servem para separar um token
 7. alguns espaços são pré-requisitos para separar identificadores vizinhos, palavras-chaves e constantes.

> Written with [StackEdit](https://stackedit.io/).
