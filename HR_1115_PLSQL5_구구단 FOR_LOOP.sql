

DECLARE
    
            
BEGIN
    FOR I IN 1..9 LOOP
        FOR J IN 1..9 LOOP
        DBMS_OUTPUT.PUT_LINE(I || ' * ' || J || ' = ' || (I*J));
        END LOOP;
    END LOOP;
END;
/