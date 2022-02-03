# SQL exercises with SQL Zoo

[SQL zoo link](https://sqlzoo.net/wiki/SELECT_basics)

## SELECT

### Selecionar um valor específico

```
SELECT atributo1 FROM nome_da_tabela
  WHERE atributo2 = valor
  ;;Pode usar símbolos como >= <= > <
```

### Selecionar um conjunto de valores

```
SELECT atributo1 FROM nome_da_tabela
  WHERE atributo2 IN array_de_string;
  
// Considere o array de string como ('Sweden', 'Norway', 'Denmark')
```

### Selecionar um conjunto de valores

```
SELECT atributo1, atributo2 FROM nome_da_tabela
  WHERE atributo3 BETWEEN valor1 AND valor2;
```
Podemos customizar o valor da coluna

```
SELECT name, (population / 1000000) FROM world
  WHERE continent = 'South America'
```

### SELECT by name

```
// seleciona todos os nomes
SELECT name FROM world
  WHERE name LIKE '%'
  
// seleciona todos os nomes a partir da letra B
// Se adicionar mais letras ele vai buscar pelo padrão esperado como %Br e achar Brasil e Brunei
SELECT name FROM world
  WHERE name LIKE 'B%'

// seleciona todos os nomes que terminam com i
SELECT name FROM world
  WHERE name LIKE '%i'
  
// Com dois %% voce pode encontrar um padrão no meio das palavras
SELECT name FROM world
  WHERE name LIKE '%x%'
```

### LENGHT, LEFT/RIGHT

```
SELECT name, LENGTH(name), LEFT(name,1) FROM world
```

### NOT EQUALS: <>

```
SELECT name FROM world WHERE name <> 'Brazil'
```


