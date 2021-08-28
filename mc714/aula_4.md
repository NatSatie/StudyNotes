# Acoplamento, paralelismo, concorrência e granularidade

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

### Concorrência

é a razão do número de operações locais e o número total de operações.

## Paralelismo vs concorrência

Paralelismo:

- condição que aparece duas thread rodando simultaneamente
- 

Concorrência:

- condição existente quando duas threads estão progredindo.
- 



