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