-- PL/SQL 
-- DEPARTMENTS 테이블에 전체내용을 CURSOR 저장하고 FETCH해서 전체정보를 출력하시오.

DECLARE
    VDEPARTMENTS DEPARTMENTS%ROWTYPE;
    CURSOR C1 IS SELECT * FROM DEPARTMENTS;
BEGIN
    OPEN C1;
    LOOP
        FETCH C1 INTO VDEPARTMENTS;
        EXIT WHEN C1%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(VDEPARTMENTS.DEPARTMENT_ID || ' / ' || VDEPARTMENTS.DEPARTMENT_NAME);
    END LOOP;
    CLOSE C1;
END;
/

-- 향상된 FOR문으로 변환

DECLARE
    VDEPARTMENTS DEPARTMENTS%ROWTYPE;
    CURSOR C1 IS SELECT * FROM DEPARTMENTS;
BEGIN
    FOR VDEPARTMENTS IN C1 LOOP
        DBMS_OUTPUT.PUT_LINE(VDEPARTMENTS.DEPARTMENT_ID || ' / ' || VDEPARTMENTS.DEPARTMENT_NAME);
    END LOOP;
END;
/
-- 세번째 방법 CURSOR없이 데이터값 출력하기
DECLARE
    VDEPARTMENTS DEPARTMENTS%ROWTYPE;
BEGIN
    FOR VDEPARTMENTS IN (SELECT * FROM DEPARTMENTS) LOOP
        DBMS_OUTPUT.PUT_LINE(VDEPARTMENTS.DEPARTMENT_ID || ' / ' || VDEPARTMENTS.DEPARTMENT_NAME);
    END LOOP;
END;
/