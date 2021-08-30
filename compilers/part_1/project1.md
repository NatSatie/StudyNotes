# Projeto 1: Lexer

Esse projeto será construído a clsse `UCLExer`, que é responsável pela separação de tokens do código e identificamos palavras importantes dentro de um código.

O que esperamos é que ao ler:

```
int v[] = {1, 2, 3, 4};
int main(){
    for (int i = 1; i <= 4; i = i+1)
        print(v[i]);
    return;
}
```

Possamos identificar o que é um vetor, uma função, um ciclo de for, print e um return. Essas palavras são identificadas como `KEYWORDS`. Caracteres menores, como parênteses, chaves, menor, igual são `CONSTANTS` e os nomes das variáveis de `ID`.

### Keywords ou palavras reservadas

```
keywords = (
        "ASSERT",
        "BREAK",
        "CHAR",
        "ELSE",
        "FOR",
        "IF",
        "INT",
        "PRINT",
        "READ",
        "RETURN",
        "VOID",
        "WHILE",
    )
    
keyword_map = {}
for keyword in keywords:
    keyword_map[keyword.lower()] = keyword
```

### Tokens, pode ser um ID ou uma CONSTANT

```
tokens = keywords + (
        # Identifiers
        "ID",
        # constants
        "STRING_LITERAL",
        "INT_CONST",
        "FLOAT_CONST",
        "CHAR_CONST",
        "LBRACKET",
        "RBRACKET",
        "LPAREN",
        "RPAREN",
        "LBRACE",
        "RBRACE",
        "COMMA",
        "SEMI",
        "EQUALS",
        "EQ",
        "NE",
        "LE",
        "LT",
        "GE",
        "GT",
        "PLUS",
        "MINUS",
        "TIMES",
        "DIVIDE",
        "MOD",
        "NOT",
        "PLUSPLUS",
        "DIVEQUAL",
        "PLUSEQUAL",
        "TIMESEQUAL",
        "MINUSEQUAL",
        "MINUSMINUS",
        "MODEQUAL",
        "OR",
        "AND"
    )
```

## Como interpretamos o código no projeto?

Dentro do código do projeto, temos a seguinte estrutura geral:

```
def t_NOME_TOKEN(self, t):
        REGRA DE REGEX
        ADICIONAR DENTRO DO MAPA DE PALAVRAS RESERVADAS/ MAP
        return t
```

Então temos que criar individualmente as palavras reservadas que serão essenciais ao projeto. Para saber mais, procure `C and C++ tokens ans keywords`, mas acho que essa lista é o suficiente porque tem muita informação em `C`.

O parâmetro `t` significa token, que espera ser ligado a um `t.type`, que faz parte do mapa de palavras reservadas. E tem o `t.value` que é a string do token.

### Exemplo 1: Como identificar uma variável?

Para identificar uma variável, podemos considerar que:

1. Tem no mínimo 1 caractere, esse primeiro caractere deve ser uma letra
2. A partir do segundo caractere pode ser uma letra ou número

Então dentro do REGEX, podemos definir a regra como: `r'[_a-zA-Z][_a-zA-Z0-9]*'` .

- `r''` é o trecho de identifica o modelo REGEX
- `_` matches the character _ with index 9510 (5F16 or 1378) literally (case sensitive)  - ver [regex](https://regex101.com/)
- `a-Z` matches a single character in the range between a (index 97) and z (index 122) (case sensitive)
- `A-Z` matches a single character in the range between A (index 65) and Z (index 90) (case sensitive)

Então o código final é:

```
def t_ID(self, t):
        r'[_a-zA-Z][_a-zA-Z0-9]*'
        t.type = self.keyword_map.get(t.value, "ID")
        return t
```

### Casos especiais / mais complexos de regex

| Caso                 | REGEX                |
| -------------------- | -------------------- |
| CHAR_CONST           | `r'\'.\''`           |
| STRING_LITERAL       | `r'\"(.*?)\"'`       |
| NEWLINE              | `r'\n+'`             |
| COMMENT              | ` r'\/\*(.|\n*\*\/'` |
| UNTERMINATED_COMMENT | ` r'\/\*(.|\n)*`     |
| LINE COMMENT         | `r'\/\/.*'`          |
| TIMES                | `r'\*'`              |









