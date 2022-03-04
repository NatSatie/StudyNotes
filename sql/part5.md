# PL/SQL: Capítulo 1: Overview 

Livro de referência: Oracle Advanced PL/SQL Developer Professional guide

## Estrutura do PL/SQL

| PROGRAM HEADER     - required stored subprograms only |
|-------------------------------------------------------|
| DECLARE     - local variable declarations             |
| BEGIN     - executable statements                     |
| EXCEPTION     - exception handling statements END;    |

## DML statements

DML significa Data Management Language, que faz a manipulação de dados nas tabelas. Alguns desses exemplos seriam INSERT, UPDATE, DELETE, MERGE, TRANSACTIONS. (Veja mais em SQL Server DML Statements - Ram Kedem e DML Statements (apache.org))

## TCL statements

TCL significa Transactional Control Language, dada uma unidade de trabalho no banco de dados, a ação seguinte de execução é uma transação. Statements como COMMIT, ROLLBACK e SAVEPOINT são os mais usados em SQL. (Ver mais em TCL Commands in SQL - javatpoint)

## DDL statements

DDL statements corresponde a Data Definition Language, usado para criar, deletar, modificar um schema, por exemplo, databases, tables e views. Os comandos mais usados são CREATE, DROP ALTER. (DDL Statements (apache.org))

// todo adicionar imagem em new.png (797×669) (geeksforgeeks.org)

## PROCEDURES

Procedures nao podem ser chamadas a partir de SELECT statements, nem aparecer ao lado direito de um operador de atribuição. Ele deve ser executado em um bloco procedural
Aceita parâmetros de IN, OUT, IN OUT (Opcional)
Implica-se que como aceita par”ametros OUT, significa que é a única forma de trazer um valor de saída. Mas não pode ser feito a partir de um RETURN. Quando ele é usado em uma procedure, é para sair ou pular uma etapa da execução.

// todo: adicionar tabela de diferença de IN, OUT e IN OUT.

### Exercise 1:

Which of the following  features are not available in SQL Developer?

a - Query builder: é um construtor de consultas. Ele serve para criar uma instrução SQL de forma mais simples e pragmático para consultas de banco de dados ( [Trabalhando com Banco de Dados: Query Builder](https://www.yiiframework.com/doc/guide/2.0/pt-br/db-query-builder)). Um exemplo seria

```
SELECT `id`, `email` 
FROM `user`
WHERE `last_name` = :last_name
LIMIT 10
```

Então essa opção é FALSA, pois existe o query builder no SQL Developer.

b - Database export and import. FALSA

c - Database backup and recovery functions: backup de dados não está citados no livro de referência. VERDADEIRA

d - Code subversion repository: trata-se se controle do código fonte. (Using Source Code Control (oracle.com)). FALSA

### Exercise 2

Referências: 

Types of SQL Statements (oracle.com)
8 Using PL/SQL Subprograms (oracle.com)

Dada uma função em uma expressão SQL, podemos ter

Um SELECT não pode ter DML statements: Verdadeiro, SELECT serve apenas para acessar dados, mas não pode manipular direto do banco de dados. 
Uma função deve retornar um valor: Sim, por definição, a função termina com o statement RETURN, que espera um valor. Enquanto em procedure, pode ter o RETURN com um valor nulo.**obs: no livro a resposta é falsa, mas ainda não entendi as razões.**

# PL/SQL: Capítulo 2: Designing PL/SQL Code


