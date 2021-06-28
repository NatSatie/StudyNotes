# Camada de Transporte

Nesse capítulo serão estudados os protocolos UDT e TCP. 

## Introdução

Relembrando que o protocolos de transporte são executados em sistemas terminais. 

> Emissor: Fragmenta a mensagem de aplicação em segmentos e envia na cama de rede

### Analogia das Casas

Doze crianças escrevendo cartas para as doze crianças. O irmão mais velho Ann leva para o correio essas cartas, o correio é responsável pelo transporte e leva para as outras 12 crianças, mas é o irmão mais velho Bill que busca essas cartas.

Então processos = crianças, mensagem da aplicação = cartas no envelope, hosts=casas, protocolo de transporte = irmãos mais velhos Ann e Bill, protocolo da camada de rede = serviço de correio.



> Camada de rede: Comunicação lógica entre hosts ou sistemas



> Camada de transporte: Comunicação lógica entre processos, depende dos serviços da camada de redes e extende os serviços da camada de rede



## Multiplexação e Demultiplixação

Demultiplexação no receptor: entrega de segmentos recebidos para os processos da camada de aplicação corretos

Multiplexação no emissor: juntar dados de multiplos processos de aplicação envelopando dados do cabeçalho.

Sempre temos a porta remetente e receptora



### Demultiplexação não orientada a conexão



### Demultiplexação orientada a conexão



## UDP: User Datagram Protocol



### Comunicação de Sockets 

(apresentação da parte 1, introdução, slides 140/180, ver TCP server)

(47min)



## Princípios de Transferência Confiável de Dados - rdt

( aula 18-05, 48min)



## Protocolos Pipelined



## Protocolo Volta-N

(aula 20-05, 3min)



## Protocolo Retransmissão Seletiva

(aula 20-05, 23min)

