# Symbol Table

Precisamos verificar a corretude da AST, e precisamos fazer a verificação de tipos. 

<a href="https://www.codecogs.com/eqnedit.php?latex=\sigma&space;=&space;\{&space;g&space;\rightarrow&space;string&space;,&space;a&space;\rightarrow&space;int\}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\sigma&space;=&space;\{&space;g&space;\rightarrow&space;string&space;,&space;a&space;\rightarrow&space;int\}" title="\sigma = \{ g \rightarrow string , a \rightarrow int\}" /></a>

Para isso segundo Appel, precisamos de:

- Parâmetros e variáveis locais de um mérodo m em minijava somente são visíveis dentro de m
-  Campos e métodos de uma classe somente são visíveis dentros de uma classe
- Para recuperar o escopo é preciso ter uma pilha de *undo*

**Exemplo**: temos uma função que seus parâmetros int porém recebemos parâmetros em float

> As regras de análise semântica são bem rígidas e temos que verificar caso a caso

| table symbol  | linha  |  código | Anotações|
|---|---|---|---|
| <a href="https://www.codecogs.com/eqnedit.php?latex=\sigma_0" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\sigma_0" title="\sigma_0" /></a> | 1 |  class C { |Considere o sigma como um mapa |
| <a href="https://www.codecogs.com/eqnedit.php?latex=\sigma_1&space;=&space;\sigma_1&space;&plus;&space;\{&space;a&space;\rightarrow&space;int,&space;b&space;\rightarrow&space;int,&space;c&space;\rightarrow&space;int&space;\}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\sigma_1&space;=&space;\sigma_1&space;&plus;&space;\{&space;a&space;\rightarrow&space;int,&space;b&space;\rightarrow&space;int,&space;c&space;\rightarrow&space;int&space;\}" title="\sigma_1 = \sigma_1 + \{ a \rightarrow int, b \rightarrow int, c \rightarrow int \}" /></a> | 2 | int a; int b, int c; | Com a inserção de declarações precisamos criar um novo mapa, o + é união de sigma_0 com as declarações; Considere o \rightarrow como o BIND |
| <a href="https://www.codecogs.com/eqnedit.php?latex=\sigma_1" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\sigma_1" title="\sigma_1" /></a> | 3 | public vod m() { |
| <a href="https://www.codecogs.com/eqnedit.php?latex=\sigma_1" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\sigma_1" title="\sigma_1" /></a> | 4 | System.out.println(a+c) | Observe que esse print chama a e c como variáveis globais dentro da classe|
| <a href="https://www.codecogs.com/eqnedit.php?latex=\sigma_2&space;=&space;\sigma_1&space;&plus;&space;\{&space;j&space;\rightarrow&space;int&space;\}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\sigma_2&space;=&space;\sigma_1&space;&plus;&space;\{&space;j&space;\rightarrow&space;int&space;\}" title="\sigma_2 = \sigma_1 + \{ j \rightarrow int \}" /></a> | 5 | int j = a+b; | Temos uma declaração com j, que criamos um novo ambiente chamado de sigma 2; com o BIND/amarro de j e int; Mas não necessariamente estou criando um novo mapa (provocação mais a frente)|
| <a href="https://www.codecogs.com/eqnedit.php?latex=\sigma_3&space;=&space;\sigma_3&space;&plus;&space;\{&space;a&space;\rightarrow&space;String&space;\}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\sigma_3&space;=&space;\sigma_3&space;&plus;&space;\{&space;a&space;\rightarrow&space;String&space;\}" title="\sigma_3 = \sigma_3 + \{ a \rightarrow String \}" /></a> | 6 | String a = "hello"; | Veja de que a está amarrado a int anteriormente, podemos ESCONDER a nova amarração usando {a-> String}|
| <a href="https://www.codecogs.com/eqnedit.php?latex=\sigma_3" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\sigma_3" title="\sigma_3" /></a> | 7 | System.out.println(a) |
| <a href="https://www.codecogs.com/eqnedit.php?latex=\sigma_3" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\sigma_3" title="\sigma_3" /></a> | 8 | System.out.println(j) |
| <a href="https://www.codecogs.com/eqnedit.php?latex=\sigma_3" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\sigma_3" title="\sigma_3" /></a> | 9 | System.out.println(b) |
| <a href="https://www.codecogs.com/eqnedit.php?latex=\text{descarta&space;}&space;\sigma_3&space;\text{&space;restaura&space;}&space;\sigma_1" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\text{descarta&space;}&space;\sigma_3&space;\text{&space;restaura&space;}&space;\sigma_1" title="\text{descarta } \sigma_3 \text{ restaura } \sigma_1" /></a> | 10 | } | Nessa linha estamos fechando o escopo, tenho que descartar sigma 3, porque está fora do escopo, e retomamos  sigma 1|
| <a href="https://www.codecogs.com/eqnedit.php?latex=\text{descarta&space;}&space;\sigma_1&space;\text{&space;restaura&space;}&space;\sigma_0" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\text{descarta&space;}&space;\sigma_1&space;\text{&space;restaura&space;}&space;\sigma_0" title="\text{descarta } \sigma_1 \text{ restaura } \sigma_0" /></a> | 11 | } | 

🛠️Em construção🛠️


> Written with [StackEdit](https://stackedit.io/).
