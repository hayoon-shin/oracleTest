-- 구구단 FOR LOOP 문
DECLARE
        I NUMBER(1) := 1;
        J NUMBER(1) := 0;
BEGIN
        DBMS_OUTPUT.PUT_LINE('------------------구구단------------------');
        FOR I IN 2..9 LOOP
        DBMS_OUTPUT.PUT_LINE('------------------' || I || '단------------------');
            FOR J IN 1..9 LOOP
                DBMS_OUTPUT.PUT_LINE(I || ' X ' ||  J || ' = '||  I*J);
            END LOOP;
        END LOOP;
END;
/