SET SERVEROUTPUT ON;

DECLARE
    v_ID NUMBER(5) := 1;

BEGIN

    v_ID := 2;
    DBMS_OUTPUT.PUT_LINE(v_ID);
    
END;