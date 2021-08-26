# Aula 4: Caracterização de sistemas paralelos

De acordo com o sistema paralelo que está trabalhando isso pode afetar o projeto do algoritmo projetado, temos que considerar as lâtências, muito acesso a dados comuns, acesso de dados locais e pouco acesso a dados distribuídos.

O objetivo do sistema paralelo é dividir a carga entre processadores. Tarefas que podem ser aceleradas são as que podem ser particionadas em subtarefas com pouca comunicação. Por exemplo, operações sobre vetores e matrizes. 

## Taxonomia

### Processamento Flynn

- SISD, single instruction single data
- MISD, multiple instruction single data
- SIMD, single instruction multiple data
- MIMD, multiple instruction multiple data

### Programação

- Memória compartilhada
- Troca de mensagens
- PRAM: parallel random access machine
- LogP vs PRAM

 ## SISD - single instruction single data

Temos então um stream de instruções singulares e um stream singular de dados, segue o movelo convencional de Von Neumann, com uma CPU, uma unidade de memória e conectados por bus/barramento.

```
dados -> unidade de processamento <- instruções
```

## SIMD - single instruction multiple data

Tem um stream de instruçlões singulares, e um fluxo para vários dados, seu processamento consiste em vários processadores.  Usado para arrays  e matrizes.

```
dados => unidade de processamento <=|
dados => unidade de processamento <=|
dados => unidade de processamento <=|= instrução
dados => unidade de processamento <=|
dados => unidade de processamento <=|
      
```

## MISD - multiple instruction single data

Tem um stream de instruçlões singulares, e um fluxo para vários dados, seu processamento consiste em vários processadores.  Usado para arrays  e matrizes.

```` 
       |=> unidade de processamento <= instrução
       |=> unidade de processamento <= instrução
dados  |=> unidade de processamento <= instrução
       |=> unidade de processamento <= instrução
       |=> unidade de processamento <= instrução

````

## MIMD - multiple instruction multiple data

Multiple instruction stream, multiple data stream. Lida com instruções diferentes, dados distintos e tem modo de operação de sistemas distribuídos e paralelos em geral. Não tem relógio comum.

```
dados  => unidade de processamento <= instrução
dados  => unidade de processamento <= instrução
dados  => unidade de processamento <= instrução
dados  => unidade de processamento <= instrução
dados  => unidade de processamento <= instrução
```

# Memória compartilhada

## Modelos PRAM e LogP

O modelo PRAM, significa Parallel Random Access Machine. É uma máquina ideal com memória centralizada e compartilhada com processadoress síncronos. Não é considerado o custo de comunicação entre processaodres, e células podem comunicar concorrentemente.

É um modelo bem simples que descarta várias considerações de um sistema.

## Modelo LogP

É um modelo real, que considera o custo de comunicação entre processadores.

- `L` é o limite superior no atraso na troca da mensagem
- `o` é overhead, tempo de um processadore para enviar ou recer uma mensagem
- `g` é gap, ou gargalo, tempo mínimo entre transmissões/recepções consecutivas de mensagens (1/BW)
- `P` número de processadores

E ele é limitado a númuro de mensagens simultâneas a `ceil(L/g)`

Considere a situação em que:
`limit=4, overhead=2, gap=5`
`processors=[processor0, ...processor7]` tal que `processors.length = 8`

Além disso considere que `processor0`, corresponde ao processador zero.

`processor` é um processador genérico.

```
if (processor == processor0)
	for (i=1, i <= processors, i++)
		send(i, value)
else
	\\ recebe o valor zero e o endereço do value
	receive(processor0, &value)
	
```

