# Protocolo TCP: Transmission Control Protocol

> aula 20-05, 44min

## Visão Geral

Esse protocolo foi lançado em 1974 junto com o protocolo IP. Eles foram efetivamente implantados em 1993. Essa conexão é ponto-a-ponto, sua conexão é descrita como um fluxo de bytes ordenados e confiável, então o TCP não se importa em manter a unidade da camada de aplicação, ou seja não é estruturado em mensagens.

- ponto a ponto
- fluxo de bytes ordenados e confiável
  - confiável: um processo envia e tem a certeza que chega na outra extremidade
  - ordenados: tem ordem
- dutado ou de pipeline
- buffers de envio e recepção
- transmissão full duplex
  - posso enviar do ponto a para b e vice-versa
- orientação a conexão
  - handshaking
- fluxo controlado
  - receptor não será afogado

Um vício de linguagem que temos é que não existe explicitamente um TCP receptor e transmissor, pois ele é full duplex

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/redes/part3/part2_img1.jpg)

## TCP orientado a bytes

Observe que o temos um dado que é dividido em segmentos TCP, isso pode ser um objeto interio vindo da camada de aplicação.

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/redes/part3/part2_img2.jpg)

## Estrutura do segmento TCP

O objeto abaixo é o **cabeçalho do segmento TCP**

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/redes/part3/part2_img3.jpg)

*(aula 25-05 58min)*

- número porta de origem
- número da porta de destino
- núemro de sequência: é um número aleatório

