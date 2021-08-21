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

## Memória Distribuída

