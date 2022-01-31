# Capítulo 1: Programar em PL/SQL

## O que é PL/SQL

É uma linguagem estruturada, legível e acessível no qual é capaz de rodar em qualquer banco de dados que usa a tecnologia da Oracle.

PL/SQL é uma *embedded language*, que significa uma lingaugem que complementa/adiciona flexibilidade para a aplicação. Não confundir com um sistema embarcado, que é um hardware e software construídos dentro de um robô, carro, brinquedo, ou seja, em um sistema embarcado. E PL/SQL é uma linguagem de alta performance com integração a banco de dados.

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

## Criando e Rodando PL/SQL



# Referências

[1](https://www.pcmag.com/encyclopedia/term/embedded-language)
