# Aula 1: Sistemas distribuídos

## Introdução de Sistemas distribuídos

Para definir o que é um sistema distribuído, temos várias definições de acordo com o autor. Para **Kshemkalyani e Sighal**, podemos resumir em entidades independentes que resolvem um problema que não pode ser resolvido sozinho (observe que não é citado a presença de computadores). Enquanto para **Couloris, Dollimire e Kindberg**, temos sistemas com componentes de hardware ou software localizados em computadores de rede comunicam-se e coordenam suas ações através por troca de mensagens. Finalmente, **Tanembaum e Van Steen**, diz que é um conjunto de computadores independentes que se apresentam aos usuários como um sistema único e coerente.

### Características de um sistema distribuído

Segundo **Lamport**, o usuário descobre que uma aplicação é um sistema distribuído, quando o sistema sofre por alguma falha.

A coleção de computadores não tem memória compartilhada nem um relógio físico comum. A comunicação é feita a partir de uma rede de comunicação e o computador tem sua própria memória e sistema operacional.

Para **Goscinski**, existe uma grande quantidade de computadores que podem ser sistemas fracamente acoplados por uma rede de longa distância, ou ser um sistema é fortemente acoplado a LANs (local acess network) ou fortemente acoplados a sistemas multiprocessados. Essa interpretação tem maior gama de interpretações.


- Sem relógio físico comum: os processadores estão assíncronos um do outro
- Sem memória compartilhada: exige comunicação por troca de mensagens, além disso é necessário uma camada de abstração do espaço de endereçamento comum que é acessado por uma abstração da memória compartilhada distribuída. (processamento paralelo)

- Separação geográfica: exemplo: clusters, pequeno sistemas distribuídos
- Autonomia e heterogeneidade: processadores distintos e com performances diferente e OS diferentes.

### Hardware das componentes

Como explicamos, cada dispositivo tem unidades de memória e processamento e são conectados a partir de uma rede de comunicação.

### Software das componentes

- Aplicação distribuída
- Middleware: aplicação intermediária
- Sistema operacional
- Pilhas e protocolos de rede


## Arquitetura e Middleware

Uma execução distribuída é a execução de processos no sistema distribuído que buscam atingir um objetivo comum. O middleware é um software distribuído que coordena o sistema distribuído e fornece transparência de heterogeneidade

### Bibliotecas, padrões, mecanismos de middleware

- CORBA, commom object request broker
- RPC, remote procedure call
- MPI, message passing interface


## Porque sistemas distribuídos?

Usamos várias aplicações distribuídas no nosso dia a dia como transações de banco, além disso,  melhora o compartilhamento de recursos, como hardware, softweare, dados. 
E observando a possibilidade de sistemas não serem distribuídos, torna-se impraticável de replicarmos softwares ou executar tarefas em um lugar só. Além disso, o acesso de dados geograficamente distribuídos.


Mais uma motivação de usar, é a confiabilidade, podemos replicar dados, ampliar disponibilidade, integridade do recurso estar "correto" , e temos tolerância a falhas.







> Escrito com  GhostWriter