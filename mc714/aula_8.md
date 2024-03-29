# Tipos de arquitetura em sistemas distribuídos

*Aula 11*

Trata-se do controle da organização lógica do software e das componentes dos sistemas. Temos algumas organizações como arquitetura de software, arquiteturas centralizadas/descentralizadas/híbridas, divisão de plataformas com middleware, uso de técnicas para alcançar transparência.

## Sistemas autonômicos

Sistemas adaptáveis que tem retroalimentação de informação. Existem parâmetros que podem ser alterados pelo próprio software e ajustar por conta própria. Ex: existência de aumento do tráfico de dados e o middleware redireciona os dados para reduzir. 

## Estilos arquitetônicos

Trata-se da organização da lógica do sistema em componentes de software . O conector é o mecanismo que serve de mediador da comunicação entre componentes.

- Arquiteturas em camas: sistema hierárquico, cada requisição passa por uma camada/nível 

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/mc714/aula8_01.jpg)

- Arquitetura baseada em objetos: cada objeto é um componente. Ex: cliente e servidor

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/mc714/aula8_02.jpg)

- Arquitetura centralizada em dados: processos se comunicam por um repositório em comum. Aplicações se comunicam por leitura e escrita de arquivos compartilhados. Ex: sistemas web.
- Arquitetura baseada em eventos: existe um barramento, associados a sistemas com publish/subscribe. propagação de eventos que contém dados. Middleware transmite somente para assinantes, sistemas fracamente acoplados (monitoramento e sensores).
  - Essa arquitetura pode ser combinada com arquitetura centrada em dados

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/mc714/aula8_03.jpg)

# Arquitetura centralizada

Os processos são divididos em clientes e servidores, o servidor implementa um servidor específico e o cliente faz uma request, o servidor processa e traz o retorno como uma resposta.

Temos que confiderar a confiabilidade e eficiência. Alguns casos admitem retransmissão outros não.



# Camadas de Aplicação (24:00)





# Arquiteturas descentralizadas (aula 12)

