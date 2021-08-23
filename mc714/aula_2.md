# Aula 2: Sistemas Paralelos

## Arquiteturas de memória

Precisamos considerar dois pontos ao dispositivos, a localização e política de acesso. Quando temos uma memória compartilhada, a localização está no mesmo local, e a política de acesso é uma memória de espaço de endereçamento comum.

A **memória centralidada** é acessada por todos os processadores, na **memória distribuída**, a memória pode ser *fisicamente distribuída entre processadores* ou *memória compartilhada*, com endereçamento global e tempo de acesso diferentes ou pode ser *multiprocessadores de memória distribuída*: que tem trocas de mensagens, acesso através do processador e organização hierárquica.

Considere o seguinte cenário:

```
//  MEMÓRIA CENTRALIZADA

// Pn é o processador de número n
// rede de interconexão pode ser uma rede de internet por exemplo

     P1     P2     P3
     |      |      |
   ___________________
   |    rede de      |
   |   interconexão  |
   ___________________
            |
            |
         MEMÓRIA 
```
     

```  
//  MEMÓRIA distribuída

// Pn é o processador de número n
// Mn é a memória do processador n, geograficamente distribuído


// rede de interconexão pode ser uma rede de internet por exemplo
	
   P1 e M1  P2 e M2
	|             |
   ___________________
   |    rede de      |
   |   interconexão  |
   ___________________
	
```
  

```  
//  MEMÓRIA com acesso de comunicação explícito

// Pn é o processador de número n
// Mn é a memória do processador n, está ligado ao processador n,
//          mas para acessá-lo é necessário passar pelo processador


// rede de interconexão pode ser uma rede de internet por exemplo

   M1            M2
	|             |	
   P1            P2
	|             |
   ___________________
   |    rede de      |
   |   interconexão  |
   ___________________
	
```


## Memória Centralizada

É uma extensão intuitiva da arquitetura de um único processador, temos a contenção na comunicação com memória central para limitar escabilidade. 

Sistemas baseados em barramento geralmente possuem poucos processadores (até 8 processadores), em barramento é a rede de comunicação entre vários processadores, quanto maior o número deles, maior o barramento (problema do gargalo).


## Memória Distribuída

Com a troca de mensagens, podemos criar projetos mais simples, no entanto, sua programação é mais complexa. A memória distribuída, temos maior escabilidade a partir do uso de MPP, massively parallel processor, que são sistemas de memória que trocam mensagens  e podem conter centenas de milhres de processadores.

Com multiprocessadores de memória distribuída, podemos juntos os dois pontos citados.


# Classificação de Sistemas Paralelos

## Sistemas multiprocessados

- sistemas paralelos onde os múltiplos processadores tem acesso direto a uma memória compartilhada
- sem relógio comum
- UMA, uniform memory acess, latência de acesso à memória é a mesma a qualquer processador
- comunicação de processos, leitura e escrita da memória compartilhada
- processadores de mesmo tipo estão no mesmo container


```  
// exemplo do UMA

   P1      P2
	|      |
   ___________________
   |    rede de      |
   |   interconexão  |
   ___________________
	|      |
   M1      M2
	
```


### Termos importantes:

- bus ou switch: interconexão
- bus: limitação de escabilidade, reduz custo
- switch: centralizado, multi-styage switch 


Redes de interconexão comuns são *omega* e *butterfly*, são redes multi-estágio formadas por comutadores 2x2, isso significa que dados de qualquer das duas entradas podem ser direcionados para qualquer das duas saídas. Devido à comutidade dos dados há o risco de sofrerem colisões.


### Sistemas multiprocessados: Omega

Considere que omega tem `n` processadores e `n` unidades de memória.

Temos <img src="https://latex.codecogs.com/gif.latex?\frac{n}{2}&space;\log_{2}n" title="\frac{n}{2} \log_{2}n" /> switches e <img src="https://latex.codecogs.com/gif.latex?\log_{2}n" title="\log_{2}n" /> níveis.


<a href="https://www.codecogs.com/eqnedit.php?latex=j&space;=&space;\left\{\begin{matrix}&space;2i,&space;&&space;0&space;\leq&space;i&space;\leq&space;\frac{n}{2}-1&space;\\&space;2i&space;&plus;&space;1&space;-&space;n,&space;&&space;\frac{n}{2}-1&space;\leq&space;i&space;\leq&space;n-1&space;\end{matrix}\right." target="_blank"><img src="https://latex.codecogs.com/gif.latex?j&space;=&space;\left\{\begin{matrix}&space;2i,&space;&&space;0&space;\leq&space;i&space;\leq&space;\frac{n}{2}-1&space;\\&space;2i&space;&plus;&space;1&space;-&space;n,&space;&&space;\frac{n}{2}-1&space;\leq&space;i&space;\leq&space;n-1&space;\end{matrix}\right." title="j = \left\{\begin{matrix} 2i, & 0 \leq i \leq \frac{n}{2}-1 \\ 2i + 1 - n, & \frac{n}{2}-1 \leq i \leq n-1 \end{matrix}\right." /></a>


A função de roteamento considera: para nídel `s` da rede, se p `s+1`-ésimo bit mais significativo do endereço destino é 0, vai o fio de cima, se for 1 vai para o fio de baixo.


![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/mc714/aula2_01.png)


### Sistemas multiprocessados: Butterfly

Função de interconexão depende de `n` e `s`, número de processadores e nível de interconexões respectivamente. Seja `M = n/2` switches em cada nível e `<x, s>` um switch `x` no nível `s`.

Existe uma aresta de `<x, s>` para `<y, s+1>` se:

1. x == y
2. x XOR y tem exatemente um bit 1 que está no `s+1`-ésimo bit mais significativo

Função de roteamento considera para um nível `s`, se `s+1`-ésimo  bit mais significativo é 0, vai para o fio de cima, caso contrário, vai para o figo de baixo.

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/mc714/aula2_02.jpeg)


## Multicomputadores (aula 3)

- É um sistema paralelo onde múltiplos processadores não tem acesso direto à memória compartilhada.
- Essa memória pode ou não formar um espaço de endereçamento comum.
- Não tem relógio físico comum
- São próximos fisicamente (não obrigatório)
- fortemente acoplados, ou seja, em hardware e software
- por exemplo, clusters.


A comunicação pode ser feita por endereçamento comum ou troca de mensagens, o espaço de endereçamento comum, corresponde à arquitetura NUMA, non-uniform memory acess. E a topologia regulares e simétricas são usadas para computação de alto desempenho.

De acordo com a conexão com os hacks entre os multicomputadores, muda sua performance e custo do uso de cabos e equipamento.

### Topologia dos Multicomputadores

A topologia pode varias em várias formas, como mesh, anel, torus, cubo e hipercubo.

Na figura abaixo, temos na figura (a) um 2d mesh cada computadores tem 4 conexões, e o roteamento pode ser feito de várias formas (temos `k^2` processadores). Na figura (b) temos um hipercubo (`power(2, k)` processadores).


![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/mc714/aula3_01.jpeg)


![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/mc714/aula3_02.jpeg)

Também temos outras formas de rotamento como:

- bus ou barramento
- anel
- crossbar switch (todo mundo conecta com todo mundo)


## Processadores vetoriais ou Array processors (aula 3)

**Características:**

- Processadores fisicamente próximos e fortemente acoplados
- tem relógio comum
- podem não compartilhar memória e podem comunicar por troca de mensagens
- processamento e troca de dados sincronizados
- Exemplo: DSP e processamento de imagens

## Diferenças com sistemas paralelos

temos que considerar as latências, e como resolvemos o problema, se é necessário um sistema paralelo ou um sistema distribuído.

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/mc714/aula3_03.jpeg)

# Tarefa

Encontre as inconsistências da figura acima com os slides anteriores. Considere os níveis abaixo: analise o que pode ser diferente em cada um deles.

- Programação: memória compartilhada ou troca de mensagens
- Arquitetura: como é a disposição física dos componentes

### Anotações

Sistemas multiprocessados 