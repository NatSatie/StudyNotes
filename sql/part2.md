# Capítulo 1: Programar em PL/SQL

## O que é PL/SQL

É uma linguagem estruturada, legível e acessível no qual é capaz de rodar em qualquer banco de dados que usa a tecnologia da Oracle.

PL/SQL é uma *embedded language*, que significa uma lingaugem que complementa/adiciona flexibilidade para a aplicação. Não confundir com um sistema embarcado, que é um hardware e software construídos dentro de um robô, carro, brinquedo, ou seja, em um sistema embarcado. E PL/SQL é uma linguagem de alta performance com integração a banco de dados.

PL/SQL é um banco de dados da Oracle procedural que se extende ao SQL, que integra ao banco de dados com cobertura de todas as funcionalidades da Oracle.

## Conhecendo PL/SQL

```
// Declaração de um block anônimo PL/SQL
DECLARE
	l_book_count INTEGER;
	
// BEGIN é uma palavra de início de uma sessão de execução, o código que vai rodar 
BEGIN

	SELECT COUNT(*)
		INTO l_book_count
		FROM books
		WHERE author LIKE '%FEUERSTEIN, STEVEN%';
	
	// DBSM_OUTPUT.PUT_LINE serve para imprimir
	DBMS_OUTPUT.PUT_LINE (
		'Steven has written (or co-written)' ||
		l_book_count ||
		' books.'
	);
	
	// Quero atualizar o meu nome 
	UPDATE books
		SET author = REPLACE(author, 'STEVEN', 'STEPHEN')
		WHERE author LIKE '%FEUERSTEIN, STEVEN%';

END;
	
		
```


### Controle e Lógica Condicional

 - Condicionais: `IF`,`CASE`
 - Loops e controles interativos: `FOR`, `WHILE`, e loops simples
 - `GOTO` statement
 

### Sugestões do autor para aprender PL/SQL

- Construa testes antes de fazer o código
- Crie regras claras de como os desenvolvedores devem fazer na aplicação
- Crie regras claras para fazer tratamento de exceções
- Use design top-down para limitar a complexidade dos requisitos que voce vai lidar ao longo do tempo


# Server-side rendering com PL/SQL

Server-side rendering consiste em aplicações que invocam sub-programas escritos em PL/SQL ou em Java. Você cria um gatilho para o programa armazenado no banco de dados e é retornado uma resposta.


## Subprogramas SQL

Um sub-programa é invocado com `CREATE PROCEDURE` ou `CREATE FUNCTION`. Ele é executado em uma aplicação de banco de dados e invoca o subprograma a partir de um gatilho.

![](https://docs.oracle.com/cd/E11882_01/server.112/e40540/img/cncpt073.gif)


### Subprogramas são blocks anônimos?

Não.Blocos anônimos não tem nome e são unidades PL/SQL não persistentes. Elas são usadas para:

1. Inicializar chamadas de subprogramas e construct de pacotes
2. Isolar um handler de exceção
3. Controlar um trecho de código encadeado/nesting de outros blocos de PL/SQL



# Referências

[1 embedded-language](https://www.pcmag.com/encyclopedia/term/embedded-language)

[2: Server Side rendering](https://docs.oracle.com/cd/E11882_01/server.112/e40540/srvrside.htm#CNCPT1767)