# Camadas de aplicação

Um processo é um programa que executa num hospedeiro / host.

Paradigma cliente e servidor 

Num protocolo na camada de aplicação, o http usa o tpc.
Temos APLS (==aplicação) internet, com protocolos na camada de APL e protocolo de transporte (TCP)

o que o serviço de transforte deve oferecer para uma aplicação?
perda de dados, largura de banda e temporarização (baixo retardo para estarem viáveis). alguns serviços tem elasticidade de banda

serviço tcp e e udp: protocolos de transporte de internet
tcp = mais confiável
udp = menor segurança mas usado para tempo real

## Tempo de resposta


### HTML 1.1 persistente
RTT = round trip time

1 rtt para iniciar a coneção tcp
quando faço uma requisição e receber o que quero: 1 rtt
2rtt + tempo de transmissão

Todos meus pedidos de get dos objetos embutidos na página. Então se eu tenho 10 objetos embutidos, todos os gets para pegar um objeto usam a mesma conexão tcp e faço uma conexão.




> Written with [StackEdit](https://stackedit.io/).
