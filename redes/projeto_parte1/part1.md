# Revisão de MC832

Na Arquitetura da Internet precisamos do protocolo da internet é o IP, e seguimos o modelo de cliente e servidor. A comunicação entre cliente e servidor é feita a partir da identificação do endereço IP e a aplicação solicita na camada de transporte para fazer uma conexão.

A maioria das camadas usam protocolo TCP, e é repassado pelo segmento e temos comunicação para a camada de redes. E o datagrama IP vem encapsulado e passa pelo enlace de dados.

## Conexão TCP



## Exercício

### Conexão TCP

Considere a estrutura de um segmento TCP, ver o gerenciamento de conexões.

**Passo 1:** sistema envia o segmento de controle SYN do TCP ao servidor. 

	- tem especificação do número inicial de sequência
	- sem dados

**Passo 2:**  sistema servidor recebe SYN, responde com o segmento de controle SYNACK.

- aloca buffers
- especifica número inicial de sequência

**Passo 3:** sistema cliente recebe SYNACK, 







### Conexão UDP

