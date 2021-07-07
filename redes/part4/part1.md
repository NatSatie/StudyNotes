# Camada de Rede

>  Aula do dia e 01-06 (perdido) e 08-06

### Quais são as funções da camada de rede? 

Responsável pelo transporte de pacotes da estação do remetente à receptora, para isso é necessário seguir os protocolos de rede em cada estação/roteador. 

- Determinação do caminho: criara  rota seguida por pacotes da origem ao destino. Necessário saber de algoritmos de roteamento
- Comutação: movimentação de pacotes dentro do roteador da entrada à saída apropriada

A camada de rede ocorre o transporte dos segmentos do transmissor ao receptor, ocorre o encapsulamento dos segmentos em datagramas, assim que chega no receptor, os segmentos são desencapsulados e entregues à camada de transporte. E os roteadores examinam o cabeçalho de todos os datagramas que passam pelo roteador.

## Modelo de serviço de rede: Rede de Datagramas

O modelo de rede de datagramas não precisa de estabelecimento de chamada na camaada de rede. 

Roteadores não guardam estados sobre conexões fim-a-fim. Pacotes são roteados tipicamente usando endereos de destino, pacotes entre o mesmo par de origem podem seguir caminhso diferentes.

> Conforme a [RFC 1594](https://tools.ietf.org/html/rfc1594), um **Datagrama** (ou **Trama**) é "uma entidade de dados completa e independente que contém informações suficientes para ser roteada da origem ao destino sem precisar confiar em trocas anteriores entre essa fonte, a máquina de destino e a rede de transporte". Um **datagrama** é uma unidade de transferência básica associada a uma rede de [comutação de pacotes](https://pt.wikipedia.org/wiki/Comutação_de_pacotes) em que a entrega, hora de chegada, e a ordem **não são garantidos**.

## Modelo de serviço de rede: Circuitos Virtuais

> Um **circuito virtual** (**CV**) é um meio de transportar [dados](https://pt.wikipedia.org/wiki/Dado) sobre uma [rede de computadores](https://pt.wikipedia.org/wiki/Rede_de_computadores) de [comutação de pacotes](https://pt.wikipedia.org/wiki/Comutação_de_pacotes) de modo que aparente existir um [enlace](https://pt.wikipedia.org/wiki/Enlace) da [camada física](https://pt.wikipedia.org/wiki/Camada_física) entre os [sistemas finais](https://pt.wikipedia.org/w/index.php?title=Sistemas_finais&action=edit&redlink=1) de origem e destino desses dados.
>
> O termo "circuito virtual" é sinônimo de **conexão virtual** e [canal virtual](https://pt.wikipedia.org/wiki/Canal_virtual). Antes que uma conexão ou circuito virtual possam ser usados, eles tem que ser estabelecidos, entre dois ou mais [nós](https://pt.wikipedia.org/wiki/Nó) ou [aplicações de software](https://pt.wikipedia.org/wiki/Software_aplicativo), por meio da [configuração](https://pt.wikipedia.org/wiki/Configuração) das partes relevantes da rede de interconectividade. Após isto, um [fluxo de bits](https://pt.wikipedia.org/wiki/Fluxo_de_bits) ou [fluxo de bytes](https://pt.wikipedia.org/w/index.php?title=Fluxo_de_bytes&action=edit&redlink=1) pode ser entregue entre os nós, desta forma um protocolo de circuito virtual permite que protocolos de alto nível evitem manipular a divisão de dados em [segmentos](https://pt.wikipedia.org/wiki/Segmento), [pacotes](https://pt.wikipedia.org/wiki/Pacote) ou [quadros](https://pt.wikipedia.org/wiki/Quadro).
>
> A comunicação de circuitos virtuais assemelha-se à [comutação de circuitos](https://pt.wikipedia.org/wiki/Comutação_de_circuitos), uma vez que ambas são [orientadas à conexão](https://pt.wikipedia.org/w/index.php?title=Orientadas_à_conexão&action=edit&redlink=1), o que significa que em ambos os casos os dados são entregues na ordem correta e a sinalização de sobrecarga é requerida durante a fase de estabelecimento de uma conexão. Entretanto, a comutação de circuitos fornece uma taxa de bits e latência constante, enquanto esta taxa pode variar em um serviço de circuito virtual devido a fatores como:
>
> - variação de comprimentos de fila de pacotes nos nós de rede;
> - variação da taxa de bits gerada pela aplicação;
> - variação de carga de outros usuários compartilhando os mesmos recursos de rede por meios de [multiplexação estatística](https://pt.wikipedia.org/w/index.php?title=Multiplexação_estatística&action=edit&redlink=1), etc.

