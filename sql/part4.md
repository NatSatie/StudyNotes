# Alura PL/SQL

## Primeiro bloco de código



```
SET SERVEROUTPUT ON;

DECLARE
    v_ID NUMBER(5) := 1;

BEGIN

    v_ID := 2;
    DBMS_OUTPUT.PUT_LINE(v_ID);
    
END;

```

Resultado impresso:

```
2

Procedimento PL/SQL concluído com sucesso.
```

## Primeiro comando SQL



```
INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (1,'varejo');

SELECT * FROM SEGMERCADO;

DELETE FROM SEGMERCADO;

DECLARE
    v_ID NUMBER(5) := 1;
    v_DESCRICAO VARCHAR(100) := 'Varejo';

BEGIN
    INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (v_ID, v_DESCRICAO);
    COMMIT;
END;
```

## Testes com PLSQL: Escrevendo testes


### Em um arquivo de testes 

Não é necessário a criação de uma chamada de EXEC ou CALL. 

```
BEGIN
   myfunction();
END;
```

Em caso de procedures com parametros:

```
DECLARE
  sabor varchar2(50);

BEGIN
  sabor := 'CHOCOLATE';
  insertSorvete(sabor);
END;
```
### Considere a inserção de valores em uma tabela de sorveteria

Procedure
 
```
create or replace procedure insertSorvete(pid in out number, psabor in out varchar2) is
begin
  insert into sorveteria (id, sabor) values (pid, psabor);
  commit;
end insertSorvete;
```

Arquivo de teste
```
DECLARE
  id number;
  sabor varchar2(50);

BEGIN
  id := 3;
  sabor := 'napolitano';
  insertSorvete(id, sabor);
END;
```

Para conferir se está inserido:

```
select * from sorveteria
```
