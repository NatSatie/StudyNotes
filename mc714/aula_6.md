# Fundamentos dos Sistemas Distribuídos

*Vídeo da aula 7*, 8

Sistema distribuído é um conjunto de computadores independentes que se apresentam ao usuário como um único sistema único e coerente. Sua comunicação, organização são ocultas.

## Middleware

É o sistema de suporte de computadores e redes heterogêneas, middleware pode se estender para várias máquinas e oferece a mesma interface nas mesmas aplicações. Ele oculta o hardware e sistemas operacionais.

### Metas atingidas com o middleware

- fácil acesso aos recursos
  - acesso a recursos remotos
  - economia
  - colaborativo
  - Segurança: proteção de dados é necessário, pois pode ter rastreamento de informações e invasão de privacidade
- ocultar distribuição dos recursos
- ser aberto para ser expandido - escalável

*Não escrevi muita coisa porque tava prestando atenção na aula*

## Escalabilidade

As principais dimensões de escabilidade são tamanho, termos geográficos e administrativos. Um sistema escalável em uma ou mais dimensões frequentemente apresenta perda de desempenho com ampliação.

### Tamanho

Problemas: centralização de serviços, dados e algoritmos, gargalos de processamento, armazenamento e comunicação

Algoritmos centralizados

Algoritmos descentralizados

### Escabilidade Geográfica

Relógio global; 

### Como resolver problemas de Escabilidade?

Ocultar latências co  comunicação assíncrona, distribuição de recursos, replicação de recursos.

