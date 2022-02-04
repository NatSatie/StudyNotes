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



```
sad
```

