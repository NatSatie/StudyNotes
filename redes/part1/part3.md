# Núcleo da Rede

Sabemos que uma aplicação de rede, os sistemas finais trocam mensagens entre si, essas mensagens podem assumir várias funções diferentes como de controle ou conter dados.

Para isso é necessário que a mensagem seja dividida em pequenos pedaços chamamos de **pacotes (packet)**. E os comutadores de pacotes (roteadores ou comutadores de camada de enlace) transmitem esses dados. Essa velocidade é mensurada a partir de um pacote de L bits, que passa por um enlace que suporta até R bits/segundo, então a velocidade dele será L/R bits/s.

## Transmissão armazena-e-reenvia (store and forward)

A maioria dos comutadores usam store-and-forward, que o comutador de pacotes deve receber todos os dados antes de começar a transmitir o primeiro bit para o enlace de saída.

## Atrasos de fila e perda de pacote

Os comutadores de pacotes são ligados a vários enlaces, cada comutador tem um buffer de saída ou uma fila de saída, que armazena pacotes que serão enviados a um roteador de enlace.

Os pacotes quando são transmitidos são sujeitos a atrasos devido a outros comutadores de enlace que tem seus buffers de saída cheios, esse tempo de atraso é chamado atraso de fila.

Esses tipos de atrasos serão explorados mais tarde.

## Tabelas de repasse e protocolos de roteamento

## Multiplexação de redes de comutação de circuitos


> Written with [StackEdit](https://stackedit.io/).
