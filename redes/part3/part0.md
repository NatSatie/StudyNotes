# Transferência confiável de dados

## Transferência confiável de dados sobre um canal perfeitamente confiável: rdt 1.0

Nomearemos o protocolo como `rdt 1.0`, considere uma máquina de estado infinito - FSM de remetente para destinatário. 

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/redes/part3/part2_tcp01.jpg)

Então temos do lado do restinatário:

```
fsm_remetente(data):
	//cria um pacote com make_package e envia ao canal udt_send
	pacotes = make_package(data)
	udt_send(pacotes)
	pass

fsm_destinatário(pacote, data):
	extract(pacote, data)
	deliver_data(data)
	
main_destinatario():
	dados = rdt_send(data)
	fsm_remetente(dados)

main_remetente():
	for pacote in pacotes:
		rdt_receive(pacote)

```

## Transferência confiável de dados sobre um canal com erros de bits: rdt 2.0

Nomearemos o protocolo como `rdt 2.0`, considere uma máquina de estado infinito - FSM de remetente para destinatário,  temos um procolo de retransmissão de dados chamado de ARQ, automatic repeat reQuest. 

Temos alguns sinais como ACK, de reconhecimento positivo e NACK de reconhecimento negativo que podem ser presentados por 1 e 0 respectivamente.

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/redes/part3/part2_tcp02.jpg)

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/redes/part3/part2_tcp03.jpg)

## Transferência confiável de dados usando ACK e NACK: rdt 2.1

## Transferência confiável de dados: rdt 2.2



## Transferência confiável de dados por um canal com perda de dados e erros de bits: rdt 3.0







