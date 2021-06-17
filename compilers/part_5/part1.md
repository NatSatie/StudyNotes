

# Análise do Fluxo de Dados

## Introdução

Uma vez criado o CFG (control flow graph), vamos usar várias formas de análises no back-end do código para conseguirmos otimizar. Então já geramos nosso CFG e temos os blocos básicos já gerados.

As otimizações afetam a eficiência do programa, porém não pode alterar a saída.

## Exemplos de métodos para otimização

-  Dead code elimination
- Commom-subexpression elimination
- Constant Folding
- Register Allocation

## Exemplo de Otimizações de Código Básicas

### Principais fontes de otimização

Para otimizar o código podemos fazer a eliminação de sub-expressões comuns (CSE), propagação de cópias, eliminação de código morto e constant folding. Temos dois tipos: transformações locais (dentro de um bloco básico) e transformações globais (envolve mais de um bloco básico).

# Copy Propagation

Dentro do processo de Coppy Propagation, podemos observar que quando atribuímos 

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_5/copyPropagation1.png)

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_5/copyPropagation2.png)

## Constant Propagation

Podemos otimizar nesse caso, assim como em Copy Propagation (substitur a referência de `e` para `d`) e fazer uma substituição de `c` para `4`. Mas, observe que quando c é modificado no bloco `B2` podemos ter uma mudança do nosso tratamento no bloco `B3` .

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_5/constPropagation.png)

## Dead Code Elimination

Eliminação de código morto, signifique que temos uma variável usada em um bloco, porém não vai ser usada mais em outros blocos.

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_5/deadCodePropagation.png)

## Commom Sub-expression Elimination

