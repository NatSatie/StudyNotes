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

## TCP: Orientado a bytes

Observe que o temos um dado que é dividido em segmentos TCP, isso pode ser um objeto interio vindo da camada de aplicação.

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/redes/part3/part2_img2.jpg)

## Estrutura do segmento TCP

O objeto abaixo é o **cabeçalho do segmento TCP**

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/redes/part3/part2_img3.jpg)

>  *(aula 25-05 58min)*

- número porta de origem
- número da porta de destino
- número de sequência (seq): é um número aleatório
- número de reconhecimento (ACK - acknowledgment number):
- dados (data): informação

(TODO)

## Tempo de Resposta (RTTs) e Temporização

 *(aula 25-05 1h08min)*

## TCP: Transferência confiável de dados

Observe o algoritmo abaixo, que descreve os possíveis cenários que pode ocorrer dentro da transmissão

```
while(true){
	switch(event):
		case 1: 
			- dados são recebidos da aplicação acima
			- cria segmento TCP com número de sequência nextSeqSum
			- iniciliza temporarizador para segmento nextSeqSum
			- passa segmento para IP
			- nextSeqSum = nextSeqSum + length(dados)
		case 2:
			- temporatizador expirado de segmento com número de sequência y
			- retransmite segmento com número de sequência y
			- reinicia temporarizador para número de sequência y
		case 3:
			- ACK  recebido com valor de campo ACK de y
			if (y > sendBase) {
				- ack cumulativo de todos os dados até y
			} else {
				(TODO)
			}

}
```

### Geração de ACKs

(TODO tabela)

> aula 25-05 16min

## Fast Retransmit



