-- INSERT INTO 테이블명(컬럼명, ,) VALUES (컬럼값, ,,)
CREATE TABLE IT(
    NO1 NUMBER,
    NO2 NUMBER,
    NO3 NUMBER 
);
DESC IT;
INSERT INTO IT VALUES(1,2,3);
INSERT INTO IT VALUES(1,2,NULL);
INSERT INTO IT(NO1,NO2) VALUES(11,22);
INSERT INTO IT(NO1,NO2) VALUES(11,'문자');
INSERT INTO IT(NO1,NO2) VALUES(111);
INSERT INTO IT(NO1,NO2) VALUES(111,222,333);
INSERT INTO IT(NO1,NO2) VALUES(1111,2222);
INSERT INTO IT(NO1,NO2) VALUES(1111,NULL,3333);
SELECT * FROM IT;

--NO3 NOT NULL 제약조건 걸기
ALTER TABLE IT MODIFY NO3 NUMBER NOT NULL;
DELETE FROM IT WHERE NO3 IS NULL;

--DEPT 테이블 생성
CREATE TABLE DEPT AS SELECT 
DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID FROM DEPARTMENTS;
SELECT * FROM DEPT;
DELETE FROM DEPT;
TRUNCATE TABLE DEPT;
ROLLBACK;