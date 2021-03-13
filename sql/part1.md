# SQL com CodeSignal: Fundamentos
Já fiz minha disciplina de Banco de Dados, mas não cheguei a praticar devidamente com o SQL então vamos brincar usando o [CodeSignal](https://app.codesignal.com/arcade/db/welcome-to-the-table).
Gostaria de agradecer ao [wachino](https://github.com/wachino/codefights-arcade-databases) por ajudar a fornecer parte dos textos e das soluções.

## 1) projectList
Considere que temos uma tabela chama **Projects** que tem algumas informações. Mas precisamos remover as colunas **internal_id** e **team_size**.

internal_id | project_name | team_size | team_lead | income
-------- | -------- | -------- | -------- | --------
1384 | MapReduce | 100 | Jeffrey Dean | 0
2855 | Windows | 1000 | Bill Gates | 100500
5961 | Snapchat | 3 | Evan Spiegel | 2000

Para isso, precisamos usar a função [SELECT](https://dev.mysql.com/doc/refman/8.0/en/select-into.html) que gera o resultado de uma busca com determinadas variáveis.

``` javascript
CREATE  PROCEDURE  projectList()
BEGIN
	SELECT  project_name, team_lead, income  FROM  Projects;
END
```

E nosso resultado segue na tabela logo abaixo:

 project_name | team_lead | income
 -------- |  -------- | --------
 MapReduce | Jeffrey Dean | 0
 Windows |  Bill Gates | 100500
 Snapchat | Evan Spiegel | 2000

## 2) countriesSelected
Nesse problema temos que encontrar quais são os países africanos na tabela.

name | continent | population
 -------- |  -------- | --------
 Austria | Europe | 8767919
 Belize |  North America | 375909
 Botswana | Africa | 2230905
 Cambodia |  Asia | 15626444
 Cameron | Africa | 22709892

Nesse caso usamos o **SELECT*** que seleciona todas as colunas, e filtramos a partir do uso do **WHERE**.

``` javascript
CREATE  PROCEDURE  countriesSelection()
BEGIN
	SELECT * FROM  countries  WHERE  continent="Africa" order by name;
END
```

Nesse caso específico já temos a tabela ordenada alfabeticamente, mas precisamos colocar **[order by](https://www.devmedia.com.br/sql-order-by/41225) name**, para garantir que nossos dados estejam organizados.

name | continent | population
 -------- |  -------- | --------
 Botswana | Africa | 2230905
 Cameron | Africa | 22709892

## 3) monthlyScholarship
 Dada uma tabela de alunos com suas respectivos id e bolsas anuais, encontre a média do consumo mensal dos alunos. Ou seja, dividir o valor da bolsa anual em 12.
 
 id | scholarship 
 -------- |  -------- 
 1 | 12000
 2 | 18000
 3 | 24000

Nesse caso, podemos modificar a coluna diretamente usando **scholarship/12**. 

``` javascript
BEGIN
	SELECT id, scholarship/12 FROM scolarships order by id;
END
```

Temos um problema, nossa tabela fica com esse resultado:

 id | scholarship/12
 -------- |  -------- 
 1 | 1000
 2 | 1500
 3 | 2000

Portanto, precisamos renomear a coluna usando **AS**.

``` javascript
BEGIN
	SELECT id, scholarship/12 as scholarships FROM scolarships order by id;
END
```

## 4) projectTeam

Temos uma tabela que apresenta os nomes dos colegas de trabalho e os respectivos projetos acessados com sua data e horário. Encontre quais serão os colegas de trabalho que você interagiu.

| id  | name             | description           | timestamp           |
| --- | ---------------- | --------------------- | ------------------- |
| 1   | James Smith      | add new logo          | 2015-11-10 15:24:32 |
| 2   | John Johnson     | update license        | 2015-11-10 15:50:01 |
| 3   | John Johnson     | fix typos             | 2015-11-10 15:55:01 |
| 4   | James Smith      | update logo           | 2015-11-10 17:53:04 |
| 5   | James Smith      | delete old logo       | 2015-11-10 17:54:04 |
| 6   | Michael Williams | fix the build         | 2015-11-12 13:37:00 |
| 7   | Mary Troppins    | add new feature       | 2015-11-08 17:54:04 |
| 8   | James Smith      | fix fonts             | 2015-11-14 13:54:04 |
| 9   | Richard Young    | remove unneeded files | 2015-11-14 00:00:00 |
| 10  | Michael Williams | add tests             | 2015-11-09 11:53:00 | 

Esse problema foi bem complicado de entender, mas basicamente temos que filtrar os nomes das pessoas que trabalhamos.

 - DISTINCT: Seleciona apenas valores diferentes
 - ASC & DESC: Ordem ascendente ou descrescente

``` javascript
CREATE  PROCEDURE  projectTeam()
BEGIN
	SELECT DISTINCT name
	FROM  projectLog 
	ORDER BY name ASC;
END
```

Resultado:

| name             |
| ---------------- |
| James Smith      |
| John Johnson     |
| Mary Troppins    |
| Michael Williams |
| Richard Young    |

> Written with [StackEdit](https://stackedit.io/).
