# Geração de Código: Análise do Fluxo de Dados

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

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_5/copyPropagation1.png)

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_5/copyPropagation2.png)

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/compilers/part_5/constPropagation.png)
