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

Uma vez a imagem baixada vamos criar um container que vamos chamar `my-postgres-container` seguindo o comando `docker run --name my-postgres-container -e POSTGRES_PASSWORD=postgres -d -p 5432:5432 postgres`.

**Caso aconteça essa mensagem aqui**, certifique-se que seu docker está ligado.

```
docker: error during connect: This error may indicate that the docker daemon is not running.: Post "http://%2F%2F.%2Fpipe%2Fdocker_engine/v1.24/containers/create?name=my-postgres-container": open //./pipe/docker_engine: O sistema não pode encontrar o arquivo especificado.
See 'docker run --help'.
```

Ao criar a imagem, certifique-se que está certinho com `docker ps -a` apra ver se está ativo.

Execute os comandos abaixo, linha por linha, vamos usar a partir do tutorial de cirar um usuario (https://ubiq.co/database-blog/create-user-postgresql/)

```
docker exec -it my-postgres-container /bin/sh
su - postgres
createuser --interactive --pwprompt
// comentario: criar usuario e por uma senha e concordar que eh um superuser
```

```
docker exec -it my-postgres-container /bin/sh
su - postgres
createdb mydb
```

### nota de problemas recorrentes

ao criar o docker, pode aparecer um erro fatal, que não podemos encontrar o database, a melhor solução que achei foi trocar a porta 5432 por 5416 por exemplo. Não precisa ser necessariamente esse valor, pode ser um outro desde que não seja uma porta reservada do localhost.

### pgAdmin

Vamos abrir o pgAdmin para configurar algumas coisas antes de criar nosso banco.





### Indo para o IntelliJ

Vamos editar o arquivo `src/main/resources/application.properties` e colocar

```
spring.datasource.url= jdbc:postgresql://localhost:5432/public
spring.datasource.username= postgres
spring.datasource.password= 123
spring.jpa.properties.hibernate.jdbc.lob.non_contextual_creation= true
spring.jpa.properties.hibernate.dialect= org.hibernate.dialect.PostgreSQLDialect
# Hibernate ddl auto (create, create-drop, validate, update)
spring.jpa.hibernate.ddl-auto= update
```