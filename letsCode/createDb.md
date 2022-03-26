# Aprenda banco de dados com Docker e Postgres

1. Instalar DBeaber
2. Instalar Desktop Docker
3. Instalar Windows Terminal
4. Rodar as seguintes linhas

```
docker pull postgres
docker run --name postgres-db -e POSTGRES_PASSWORD=docker -p 5416:5432 -d postgres
docker ps -a
```

Tive que trocar a porta porque 5432 estava protegida de alguma forma. Ver https://stackoverflow.com/questions/37694987/connecting-to-postgresql-in-a-docker-container-from-outside



