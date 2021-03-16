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

Representa a linguagem cuja única string é vazia. `(a · b) |` ![{\displaystyle \in }](https://en.wikipedia.org/api/rest_v1/media/math/render/svg/6fe4d5b0a594c1da89b5e78e7dfbeed90bdcc32f)    `= {"", "ab"}`; ![{\displaystyle \in }](https://en.wikipedia.org/api/rest_v1/media/math/render/svg/6fe4d5b0a594c1da89b5e78e7dfbeed90bdcc32f) `= {""}`.

### Repetição

Dada uma expressão regular `M` com asterisco `M*` , ela é a concatenação de zero ou mais strings todas em M. `((a|b) · a)* = {várias combinações}`.

### Outros
Temos várias outras anotações de como podemos criar uma expressão regular.

## Exemplos de Regex

> Written with [StackEdit](https://stackedit.io/).
