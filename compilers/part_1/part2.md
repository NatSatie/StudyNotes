# Regex: Regular Expressions

Regex são usados para analisar e identificar o conjunto de strings, tokens e léxicos para a respectiva linguagem.

## Strings em uma linguagem

 - Alfabeto (conjunto de caracteres); `{'a', 'b', 'c', ...}`
 - Conjunto de Strings em várias linguagens; `S = {"if", "case", "{", "break", ";", ...}`
 - Expressões Regulares: definição de regras (algébricas e matemáticas) na formação de strings
 
 Então alguns dos nossos problemas são:
 
 - No programa fonte todas as strings pertecem a s?
 - Se não pertencerem qual o tratamento adequado para elas?
 
## Expressões Regulares

### Símbolo

É um elemento no alfabeto da linguagem `a= {"a"}`.  Interpretar o `a` como uma string singular.

### Alternação

Com duas expressões regulares `M` e `N` que tem o operador de alternação `|` que gera `M|N`. `a | b = {a, b}`

### Concatenação

Com duas expressões regulares `M` e `N`, usando o operador de concatenação (ponto/ dot operator) `·` temos a expressão `M·N`. `(a|b) · a = {aa, ba}`
 
### Epsilon

Representa a linguagem cuja única string é vazia. `(a · b) |` $\in$    `= {"", "ab"}`;  $\in$`= {""}`.

### Repetição

Dada uma expressão regular `M` com asterisco `M*` , ela é a concatenação de zero ou mais strings todas em M. `((a|b) · a)* = {várias combinações}`.

### Outros
Temos várias outras anotações de como podemos criar uma expressão regular.

## Conhecendo mais sobre Regex
Regex não é usado apenas para a partição de tokens, podemos usar em buscas com Javascript, Python e outros! Como mostra nesse vídeo: [Regular Expressions (RegEx) in 100 Seconds](https://fireship.io/lessons/regex-cheat-sheet-js/)

Temos outros guias como [Regex Quick Start](https://www.rexegg.com/regex-quickstart.html), [Coding Train Regular Expressions](https://youtu.be/7DG3kCDx53c). E para treinar temos [Regex 101](https://regex101.com/)

![Fireship Regex gif guide](https://github.com/NatSatie/StudyNotes/blob/main/compilers/part_1/img/regex_fireship.gif)


## Exemplos de Regex

### Parte 1

 - IF: `if`
 - ID: `[a-z][a-z0-9]*`, isso significa que aceita que o primeiro caractere seja uma letra alfabética e as próximas sejam caracteres numéricos ou alfabéticos, independente de quantas vezes apareçam.
 - NUM: `[0-9]*` é um número qualquer
 
### Parte 2

*Obs: Na aula que assisti tinha outras representações e adaptei para o regex moderno.

 - `[0-9]+` Aceita mais de um valor numérico (one or more )
 - `[0-9]*` Aceita nenhum valor ou mais de um valor numérico (Matches zero or more consecutive `a` characters )
 - `[0-9]+[.][0-9]*` isto é uma concatenação das duas expressões acima (Exemplos: 49.9, 85.)
 - `[0-9]*[.][0-9]+` isto é uma concatenação das duas expressões acima (Exemplos: .004545, 45.445)
 - `([0-9]+[.][0-9]*)|([0-9]*[.][0-9]+)` isto é uma alternação entre os dois termos. **Representação alternativa**: `([0-9]+"."[0-9]*)|([0-9]*"."[0-9]+)`

## Dilemas do Analisador Lexicográfico

Como saber se um token é um ID ou uma palavra reservada? Podemos resolver com as seguintes regras:

 1. Longest Match: A maior substring do input que encaixa em uma expressão regular será considerada o próximo token
 2.  Rule Priority: Dado uma substring inicial em particular, a primeira expressão regular que encaixa determina o tipo de token. Isso significa que a ordem da escrita das expressões regulares importam.

> Written with [StackEdit](https://stackedit.io/).
