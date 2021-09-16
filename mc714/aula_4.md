# Acoplamento, paralelismo, concorrência e granularidade

*Vídeo da aula 5*

## Acoplamento

está ligado ao conceito de amarração, homogeneidade entre módulos, por exemplo, sistemas fortemente acoplados como SIMD, MISD, relógio comum ou fracamente acoplados.

Um sistema fracamente acoplado, é gasto masi tempo para encaminhar a mensagem do que sua transmissão em si.

### Acoplamento em MIMD

- os multiprocessadores são fortemente acoplados com, acesso de meória uniforme (UMA), barramento (bus, sequente, encore), ou switch (NYU)
- multiprocessadores/multicomputadores com memória non-uniform memory acess ou troca de mensagens
- multicomputadores sem memória compartilhada ou sem relógico comum
- multicompitadores fracemente acoplados, são fisicamente distantes, um sistema distribuído

### Paralelismo e speedup

Speedup é o cálculo deperformance de uma máquina espacífica, depende do número de processadores e mapeamento do código nesses processadores. O cálculo é feito a partir da razão entre o tempo de execução em um único processador (`T(1)`) e o tempo com `n` processadores (`T(n)`).

> O paralelismo em um programa paralelo / distribuído é uma medida agregada da porcentagem de tempo que todos os processadores estão executando instruções de cpu ao invés de aguardar comunicação. Se a medida agregada é somente em função do código, paralelismo é independente da arquitetura.

**Exemplo 1:** Considere que temos `T(1) = 10`, ou seja o tempo de um processador consome uma unidade de tempo `10`.  E um segundo conjunto de processadores com `T(2) = 5`, dois processadores e cada um consome `5` de tempo.  Então `T(1)/T(2) = 2`

**Exemplo 2:** Considere que temos `T(1) = 10`, ou seja o tempo de um processador consome uma unidade de tempo `10`.  E um segundo conjunto de processadores com `T(3) = (3+4+3)/3 = 3.333333`, três processadores, dois consomem `3` de tempo e um de `4` de tempo.  Então `T(1)/T(3) = 3 `

**Paralelismo em um programa paralelo/distribuído:** dado a medida agregada da porcentagem de tempo que todos os processadores estão executando instruções de CPU ao invés de aguardar a comunicação (memória compartilhada ou troca de mensagens). Se a medida agregada é somente em função do código, é independente da arquitetura. Caso contrário, a definição de paralelismo é semelhante ao speedup.

### Concorrência

É a razão do número de operações locais e o número total de operações.

## Paralelismo vs concorrência

Paralelismo:

- condição que aparece duas thread rodando simultaneamente
- programação para execução de código simultânea
- quando tarefas executam ao mesmo tempo

Concorrência:

- condição existente quando duas threads estão progredindo.
- programação como composição de processos executando independentemente
- quando tarefas podem começar, executar e terminar em intervalos de tempo sobrepostos (multitasking)

(processor faz exemplos interessantes com roedores)

## Sistemas de troca de mensagem vs Sistema de memória compartilhada

### Troca de mensagens e memória compartilhada

Mais fácil de programar, pode ser usada como espaço de endereçamento comum. A comunicação por troca de mensagem pode ser simulada por comunicação via memória compartilhada (e vice-versa), os paradigmas são equivalentes.

Para simular TROCA DE MENSAGAM PARA MEMÓRIA COMPARTILHADA, endereçamento comartilhado pode ser particionado em conjuntos distintos. As operações send and receive podem ser implementadas pela read and write do espaço de endereçamneto do destinatário/remetente.

Para simular MEMÓRIA COMPARTILHADA PARA TROCA DE MENSAGENS, send and receive viram operações de read and write. cada local compartilhado pode ser um processo separado. Essa implementação pode sair caro.





