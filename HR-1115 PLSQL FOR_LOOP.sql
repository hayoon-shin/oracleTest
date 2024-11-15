-- PL/SQL
-- DEPARTMENTS 에서 반복무능ㄹ 이용해서 부서 10,20,30,40 정보를 출력하시오.

DECLARE
    VDEPARTMENTS DEPARTMENTS%ROWTYPE;
BEGIN
    FOR I IN REVERSE 1..9 LOOP
        SELECT * INTO VDEPARTMENTS FROM DEPARTMENTS WHERE DEPARTMENT_ID = I * 10;
        DBMS_OUTPUT.PUT_LINE(VDEPARTMENTS.DEPARTMENT_ID || '  /  ' || VDEPARTMENTS.DEPARTMENT_NAME);
            END LOOP;
END;
/

SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID = 10;
SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID = 20;
SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID = 30;
SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID = 40;