# Autômatos Finitos

Um autômato finito contém:

 - Alfabeto e conjunto finito de estados $\Sigma = \{a, b,c, ...\}$ 
 - Arestas que levam de um estado para outro $S= \{s_0, s_1, ...\}$
	 - $s_0$ é o estado inicial
 - Funções matemáticas que levam de um estado para outro. $F = \{ s_p, s_q,  ...\}$
	 - Essa função matemática $\tau$ recebe um estado chamado $s_i,$ e um caractere $c$ definidos por um par ordenado $\tau(s_i, c)$
	 - $S$ é o estado atual e é levado para um estado $S'$; $S \rightarrow S'$ 
	 - Com $S \rightarrow S'$ temos $s_i \rightarrow s_j = \tau(s_i, c)$; Isso significa que no estado $s_i$ podemos mudar para $s_j$ a partir de uma função matemática $\tau(s_i, c)$

 
![Finite Automata](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_1/img/finiteAutomata.jpg)

Dentro da nossa aplicação precisamos de uma sequência de expressões regulares que alimentam um gerador de Lexers (que está no projeto em Python)

![](https://github.com/NatSatie/StudyNotes/blob/main/compilers/part_1/img/diagram_lexer.jpg?raw=true)

## Deterministic Finite Automata (DFA)

Youtube: [Finite State Machine (Finite Automata)](https://youtu.be/Qa6csfkK7_I)
Youtube: [DFA Example 1](https://youtu.be/40i4PKpM0cI)

As DFAs seguem algumas regras:

 - Não podemos ter duas arestas que levam ao mesmo estado a partir do mesmo símbolo. Pois perde seu caráter determinístico.
 - Ao sair de um estado inicial $s_i$, o autômato deve seguir *exatamente uma aresta* para cada caractere de entrada.
 - DFA aceita uma string quando estiver no estado final
 - Caso não tenha nenhuma outra aresta ou terminar em um estado não-final, a string é rejeitada 

## Non-deterministic Finite Automata (NFA)

[Theory of Computation, página 35](https://edisciplinas.usp.br/pluginfile.php/736765/mod_resource/content/1/TheoryOfComputation.pdf)
Uma NFA tem arestas especiais nomeadas $\epsilon$ que podem mudar de um estado para outro sem precisar de um caractere. 

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_1/img/NFA_01.jpg)

### Convertendo Regular Expression para NFA

Na figura abaixo, a expressão regular ER tem um NFA com uma aresta de entrada/cauda e uma cabeça, estado final. A ER é uma primitiva (estado vazio ou um único símbolo) ou pode ser uma combinação de ERs.

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_1/img/NFA_02.jpg)

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_1/img/regex_NFA.jpg)
> Written with [StackEdit](https://stackedit.io/).
