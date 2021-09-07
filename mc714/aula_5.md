# Primitivas para comunicação distribuída

*Vídeo da aula 6*

As funções primitivas de trica de mensagens são `send()` e `receive()`. Para o `send() ` é necessário um `destino ` e `buffer` com dados. Já o `receive()` precisa `origem ` e `buffer` de destino.

### Primitiva Send

1. Com o buffer: copia os dados do espaço para um buffer no kernel[1], com isso os dados são copiados para a rede
2. Sem o buffer: dados são copiados diretamente do espaço do usuário para a rede

### Primitiva Receive

Maioria dos casos com buffer pois os dados podem já ter chegado quando a primitiva é invocada, exigindo um espaço temporário no kernel.

### Primitiva síncrona

- send and receive são síncronas se fazem handshake [2]
- o processamento do send só temrina depois que o receive correpondente foi invocado e a operação de recebimento foi terminada
- receive termina somente quando os dados copiados ao buffer de recepção ao usuário

### Primitiva Assíncrona

	- primitiva send é assíncrona se controle retorna ao processo depois dos dados serem copiados para fora do buffer do usuário
	- não há sentido em definir receive assíncrona

### Primitiva Bloqueante

Controle retorna ao processo após o processamento da primitiva (síncrona ou assíncrona) ser completado

### Primitiva não bloqueante

- controle retorna ao processo imediatamente após invocá-la, mesmo se a operação foi foi terminada
- para o send, o controle retorna ao processo antes da cópia dos dados para fora do buffer do usuário
- para receive, controle pode retornar ao processo mesmo antes dos dados chegarem ao remetente
- parâmetro de retorno é um `handle` que pode ser usado para verificar o estado da chamada

```
send(X, destino, handle_k)
...
...
wait(handle_1, ..., handle_k, ... handle_m)
```

## Tipos de send

|                | Síncrona                | Assíncrona                |
| -------------- | ----------------------- | ------------------------- |
| BLOQUEANTE     | síncrona bloqueante     | assíncrona bloqueante     |
| NÃO BLOQUEANTE | síncrona não bloqueante | assíncrona não bloqueante |

## Tipos de receive

|                | Síncrona                |
| -------------- | ----------------------- |
| BLOQUEANTE     | síncrona bloqueante     |
| NÃO BLOQUEANTE | síncrona não bloqueante |

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/mc714/fig14_aula6.png)

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/mc714/fig14b_aula6.png)

# Anotações de vocabulário

[1] Kernel: significa núcleo, em um sistema operacional temos o `user mode` e `kernel mode`. O primeiro é o modo no que tem restrições para o usuário no sistema operacional (OS - operational system), e o segundo, é o o modo privilegiado no qual não há restrições. 

[2] Handshake: TCP three-way handshake

