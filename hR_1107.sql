-- employees 복사 
create table emp03 as select * from employees;

-- 모든 사원의 부서번호를 30번으로 수정하자
select * from emp03;
update emp03 set department_id = 30;
ROLLBACK;

-- 모든 사원의 급여를 10% 인상한다.
UPDATE EMP03 SET SALARY = SALARY * 1.1;
ROLLBACK;

-- 입사일을 오늘로 수정한다 
UPDATE EMP03 SET HIRE_DATE = SYSDATE;
ROLLBACK;

-- 부서번호가 10번인 사원의 부서번호를 30번으로 수정
UPDATE EMP03 SET department_id = 30 WHERE department_id = 10;

-- 급여가 3000 이상인 사원만 급여를 10% 인상
UPDATE EMP03 SET SALARY = SALARY * 1.10 WHERE SALARY >= 3000;

