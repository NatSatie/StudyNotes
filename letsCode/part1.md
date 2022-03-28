# Criação de um middleware com Java, Spring, Maven, PostgresSQL e Heroku

Esse projeto foi fortemente inspirado por esse tutorial [Spring Boot, JPA/Hibernate, PostgreSQL example with Maven](https://bezkoder.com/spring-boot-postgresql-example/).

O middleware consiste na camada intermedária para fazer fazer requesições e conectar ao banco de dados. [Veja mais aqui](https://en.wikipedia.org/wiki/Middleware#:~:text=Examples%20of%20database%2Doriented%20middleware,that%20perform%20in%20machine%2Dtime.)


![](https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Middleware_Schema.svg/1071px-Middleware_Schema.svg.png)

Nesse tutorial será feito a criação de um banco de dados e será subido para os servidores do Heroku como uma aplicação real.

Segue o nosso roadmap

1. Instalação das ferramentas (Windows) 
   - Docker Desktop
   - DBeaver
   - Postman
   - Intellij IDEA
   - Git Bash e Windows Terminal
   - Github Desktop
   - Java (11)
   - Postgres (versão atualizada)
   - Heroku
2. Criando o seu projeto
3. Modelar o sistema
4. Gerando o docker e rodar localmente
5. Seu projeto no Github
6. Subir a aplicação no Heroku

# Instalação

// a fazer

# Criando o Projeto

## Crie o repositório no Github

## Spring Initializr

Inicializar o projeto com [Spring Initializr](https://start.spring.io/) e extraia o conteúdo para a pasta do repositório.

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/letsCode/springio.jpg)

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/letsCode/diretoryAfterExtracting.jpg)

Vamos commitar o conteúdo usando o Github Desktop.

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/letsCode/githubDesktop1.gif)

Legal! o nosso projeto está salvo no repositório. 

### Configurando o Docker

Ao abrir o windows terminal vamos puxar a imagem do docker com o comando `docker pull postgres`, dessa forma baixamos a imagem do container do postgres.

Uma vez a imagem baixada vamos criar um container que vamos chamar `my-postgres-container` seguindo o comando `docker run --name my-postgres-container -e POSTGRES_PASSWORD=postgres -d -p 5416:5432 postgres`.

**Caso aconteça essa mensagem aqui**, certifique-se que seu docker está ligado.

```
docker: error during connect: This error may indicate that the docker daemon is not running.: Post "http://%2F%2F.%2Fpipe%2Fdocker_engine/v1.24/containers/create?name=my-postgres-container": open //./pipe/docker_engine: O sistema não pode encontrar o arquivo especificado.
See 'docker run --help'.
```

Ao criar a imagem, certifique-se que está certinho com `docker ps -a` para ver se está ativo.


```
docker exec -it my-postgres-container /bin/sh
```

### nota de problemas recorrentes

Ao criar o docker, pode aparecer um erro fatal, que não podemos encontrar o database, a melhor solução que achei foi trocar a porta 5432 por 5416 por exemplo. Não precisa ser necessariamente esse valor, pode ser um outro desde que não seja uma porta reservada do localhost.

```
FATAL: password authentication failed for user "postgres"
```

### DBeaver

Crie uma nova conexão no DBeaver com a configuração do Postgres. 

![](https://raw.githubusercontent.com/NatSatie/StudyNotes/main/letsCode/dbeaver.gif)


### Indo para o IntelliJ

Vamos editar o arquivo `src/main/resources/application.properties` e colocar

```
spring.datasource.url= jdbc:postgresql://localhost:5416/postgres
spring.datasource.username= postgres
spring.datasource.password= postgres
spring.jpa.properties.hibernate.jdbc.lob.non_contextual_creation= true
spring.jpa.properties.hibernate.dialect= org.hibernate.dialect.PostgreSQLDialect
# Hibernate ddl auto (create, create-drop, validate, update)
spring.jpa.hibernate.ddl-auto= update
```

Com tudo configurado vamos começar a codar nosso problema

# Criando os objetos em Java

## Estrutura inicial: Model-view-controller (MVC) design pattern

Antes de começarmos a codificar nosso problema, vamos decompor em como é organizado o tutorial que estou seguindo.

Ele segue o design pattern [MVC](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller), no qual temos uma representação para visualizar nosso dado, um controlador que manipula o dado e um atualizador do dado.

![](https://upload.wikimedia.org/wikipedia/commons/a/a0/MVC-Process.svg)

Podemos considerar que `model` é a representação do nosso dado, `controller` vai manipular esse dado com adição, remoção e alteração (o básico do CRUD - create, read, update, delete) e `repository` será nossa forma de visualizarmos o dado como um todo.

O problema que vamos resolver são a lista de animes/mangás que tenho interesse. Vamos ter uma tabela de `anime`, no qual teremos as seguintes colunas e tipos:

- id: long
- name: String
- year: String
- genre: String

### Criando o Modelo

De referência, observe [esse link](https://github1s.com/NatSatie/spring-boot-jpa-postgresql/blob/master/src/main/java/com/bezkoder/spring/jpa/postgresql/controller/TutorialController.java). Teremos um pacote chamado `model` que terá o `anime.java`.

Ao analisar linha a linha, vamos colocar o pacote `javax.persistence.*`, que é um pacote de faz o gerenciamento e persistência de objetos na API. Vamos usar a tag `@Entity` que avisa a API que a classe é uma entidade no modelo relacional (quando dizemos modelo relacional é a modelagem do banco de dados que estamos implementando).

Com lokbok, podemos evitar a escrita de código desnecessário então temos

```
package com.example.postgesqlherokutest.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name="animes")
public class Anime {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Column(name="name")
    private String name;

    @Column(name="year")
    private String year;

    @Column(name="genre")
    private String genre;

    public Anime(String name, String year, String genre) {
        this.name = name;
        this.year = year;
        this.genre = genre;
    }
}
```

### Controller e Repository

Vamos criar o consoller e o repository juntos, nesse caso vamos anotar algumas tags importantes.

@Autowired

### Rodando no IntelliJ

