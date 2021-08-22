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


## Classificação de Sistemas distribuídos

### Sistemas multiprocessados

- sistemas paralelos onde os múltiplos processadores tem acesso direto a uma memória compartilhada
- sem relógio comum
- UMA, uniform memory acesso, latência de acesso à memória é a mesma a qualquer processador
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


**Termos importantes**:

- bus ou switch: interconexão
- bus: limitação de escabilidade, reduz custo
- switch: centralizado, multi-styage switch 



### Multicomputadores ou Sistemas multiprocessados

Redes de interconexão comuns são *omega* e *butterfly*, são redes multi-estágio formadas por comutadores 2x2, isso significa que dados de qualquer das duas entradas podem ser direcionados para qualquer das duas saídas. Devido à comutidade dos dados há o risco de sofrerem colisões.


### Sistemas multiprocessados: Omega

Considere que omega tem `n` processadores e `n` unidades de memória.

Temos <img src="https://latex.codecogs.com/gif.latex?\frac{n}{2}&space;\log_{2}n" title="\frac{n}{2} \log_{2}n" /> switches e <img src="https://latex.codecogs.com/gif.latex?\log_{2}n" title="\log_{2}n" /> níveis.


<a href="https://www.codecogs.com/eqnedit.php?latex=j&space;=&space;\left\{\begin{matrix}&space;2i,&space;&&space;0&space;\leq&space;i&space;\leq&space;\frac{n}{2}-1&space;\\&space;2i&space;&plus;&space;1,&space;&&space;\frac{n}{2}-1&space;\leq&space;i&space;\leq&space;n-1&space;\end{matrix}\right." target="_blank"><img src="https://latex.codecogs.com/gif.latex?j&space;=&space;\left\{\begin{matrix}&space;2i,&space;&&space;0&space;\leq&space;i&space;\leq&space;\frac{n}{2}-1&space;\\&space;2i&space;&plus;&space;1,&space;&&space;\frac{n}{2}-1&space;\leq&space;i&space;\leq&space;n-1&space;\end{matrix}\right." title="j = \left\{\begin{matrix} 2i, & 0 \leq i \leq \frac{n}{2}-1 \\ 2i + 1, & \frac{n}{2}-1 \leq i \leq n-1 \end{matrix}\right." /></a>


A função de roteamento considera: para nídel `s` da rede, se p `s+1`-ésimo bit mais significativo do endereço destino é 0, vai o fio de cima, se for 1 vai para o fio de baixo.





### Processadores vetoriais
