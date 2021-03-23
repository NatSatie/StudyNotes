# Notas de aula de Compiladores

### Referências 👀

[Stack Frame Layouts](http://shio2.k.hosei.ac.jp/ntro/)

DEVto [Generic Compiler Toolchain](https://dev.to/matthewchrobak/generic-compiler-toolchain-4ej7)

TutorialsPoint [Compilers Design](https://www.tutorialspoint.com/compiler_design/index.htm)

Youtube: [Parsing](https://youtu.be/r6vNthpQtSI)

Youtube: [Comparing C to machine language](https://youtu.be/yOyaJXpAYZQ)

Youtube: [How a compiler works in 1 minute](https://youtu.be/IhC7sdYe-Jg)

## Interpretando a jornada a frente:

Essas anotação são referentes ao livro Modern Compiler Implementation in Java, 2nd Edition. Na imagem logo abaixo temos alguns pontos a discutir: Como lemos essa imagem? E o que ela vai nos ensinar a partir de agora.
  ![Alt](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_1/img/roadmap.jpg)

Primeiramente, recomendamos assistir esse [vídeo](https://youtu.be/QXjU9qTsYCc) a partir dos 4 minutos. Assim vamos interpretar melhor.

### Análise Lexical

Com o programa abaixo, o compilador vai dividir em pequenos pedaços chamado de **tokens** a partir da **Análise Lexical** (Capítulo 2 do livro: Lex). 

``` javascript
	int main(){
		int x;
		x = 3;
	}
```
### Análise Sintática & Semantic Actions

Após a divisão de tokens, precisamos dividir os tokens em uma árvore camada parse tree (Capítulo 3) que divide em uma relação hierárquica definida como ações semânticas (Capítulo 4). E definimos a partir da Análise sintática, se a frase é uma variável, função etc (Capítulo 5).

![parse tree ](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_1/img/parse_tree.jpg)

### Transformando em linguagem de máquina

Esses são os passos dados dentro do livro:

**Frame Layout** (Capítulo 6) é uma parte que vai definir variáveis, parâmetros, em pilhas (activation records ou stack frames) e tranforma essas variáveis em uma forma compreensível para o computador (machine language)[referência](http://shio2.k.hosei.ac.jp/ntro/).
**Tradução** (Capítulo 7) produz intermediate representation trees (IR trees), porém no livro não é entregue detalhes sobre a importância do passo.
**Canonicalize** (Capítulo 8): prepara determinadas expressões e condicionais para as próximas etapas.
**Instruction Selection** (Capítulo 9): agrupa os nós do IR trees en grupos que correspondem a certas ações para linguagem de máquina
**Control Flow Analysis** (Capítulo 10): Analisa a sequência de instruções em um control flow graph que mostra todas as possibidades de fluxo do controle que podem ser feitas ao executar.
**Dataflow Analysis** (Capítulo 10): Coleta informações sobre o fluxo de dados das variáveis.
**Register Allocation** (Capítulo 11): Escolhe certos registradores para armazenar variáveis, e valores temporários para cada programa.
**Code Emission** (Capítulo 12): Substitui os nomes temporários de cada instrução de máquina com os registradores da máquina.

Observando a imagem no Tutorial Point compiler Designer, 

![Compiler Design - Phases of Compiler](https://www.tutorialspoint.com/compiler_design/images/compiler_phases.jpg)

> Written with [StackEdit](https://stackedit.io/).
