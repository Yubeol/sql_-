DROP DATABASE IF EXISTS scott;

CREATE DATABASE scott;

USE scott;

CREATE TABLE DEPT (
                      DEPTNO DECIMAL(2),
                      DNAME VARCHAR(14),
                      LOC VARCHAR(13),
                      CONSTRAINT PK_DEPT PRIMARY KEY (DEPTNO)
);
CREATE TABLE EMP (
                     EMPNO DECIMAL(4),
                     ENAME VARCHAR(10),
                     JOB VARCHAR(9),
                     MGR DECIMAL(4),
                     HIREDATE DATE,
                     SAL DECIMAL(7,2),
                     COMM DECIMAL(7,2),
                     DEPTNO DECIMAL(2),
                     CONSTRAINT PK_EMP PRIMARY KEY (EMPNO),
                     CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO)
);
CREATE TABLE SALGRADE (
                          GRADE TINYINT,
                          LOSAL SMALLINT,
                          HISAL SMALLINT
);
INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,STR_TO_DATE('17-12-1980','%d-%m-%Y'),800,NULL,20);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,STR_TO_DATE('20-2-1981','%d-%m-%Y'),1600,300,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,STR_TO_DATE('22-2-1981','%d-%m-%Y'),1250,500,30);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,STR_TO_DATE('2-4-1981','%d-%m-%Y'),2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,STR_TO_DATE('28-9-1981','%d-%m-%Y'),1250,1400,30);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,STR_TO_DATE('1-5-1981','%d-%m-%Y'),2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,STR_TO_DATE('9-6-1981','%d-%m-%Y'),2450,NULL,10);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,STR_TO_DATE('13-7-1987','%d-%m-%Y')-85,3000,NULL,20);
INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,STR_TO_DATE('17-11-1981','%d-%m-%Y'),5000,NULL,10);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,STR_TO_DATE('8-9-1981','%d-%m-%Y'),1500,0,30);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,STR_TO_DATE('13-7-1987', '%d-%m-%Y'),1100,NULL,20);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,STR_TO_DATE('3-12-1981','%d-%m-%Y'),950,NULL,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,STR_TO_DATE('3-12-1981','%d-%m-%Y'),3000,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,STR_TO_DATE('23-1-1982','%d-%m-%Y'),1300,NULL,10);
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);


#1. 사원 테이블의 모든 레코드를 조회하시오.
SELECT *
FROM emp

SELECT *
FROM dept

SELECT *
FROM salgrade

    #2. 사원명과 입사일을 조회하시오.
SELECT eName, hiredate
FROM emp ;

#3. 사원번호와 이름을 조회하시오.
SELECT empNo, eName
FROM emp;

#4. 사원테이블에 있는 직책의 목록을 조회하시오. (hint : distinct, group by)
SELECT DISTINCT job
FROM emp

    #5. 총 사원수를 구하시오. (hint : count)
SELECT COUNT(empNo) AS '총 사원수'
FROM emp;

#6. 부서번호가 10인 사원을 조회하시오.
SELECT eName, deptNo
FROM emp
WHERE empNo = 10;

#7. 월급여가 2500이상 되는 사원을 조회하시오.
SELECT ename AS '이름'
FROM emp
WHERE sal >= 2500;

#8. 이름이 'KING'인 사원을 조회하시오.
SELECT eName AS '이름'
FROM emp
WHERE eName = 'KING';

#9. 사원들 중 이름이 S로 시작하는 사원의 사원번호와 이름을 조회하시오. (hint : like)
SELECT empNo AS '사원번호', eName AS '이름'
FROM emp
WHERE UPPER(eName) LIKE 's%';

#10. 사원 이름에 T가 포함된 사원의 사원번호와 이름을 조회하시오. (hint : like)
SELECT empNo AS '사원번호', eName AS '이름'
FROM emp
WHERE eName LIKE '%t%';

#11. 커미션이 300, 500, 1400 인 사원의 사번,이름,커미션을 조회하시오. (hint : OR, in )
SELECT comm AS '커미션', empNo AS '사원번호' , ename AS '이름'
FROM emp
WHERE comm IN(300, 500, 1400);

#12. 월급여가 1200 에서 3500 사이의 사원의 사번,이름,월급여를 조회하시오. (hint : AND, between)
SELECT empNo AS '사원번호', eName AS '이름', sal AS '월급여'
FROM emp
WHERE SAL BETWEEN 1200 AND 3500;

#13. 직급이 매니저이고 부서번호가 30번인 사원의 이름,사번,직급,부서번호를 조회하시오.
SELECT eName AS '이름', empNo AS '사원번호', job AS '직급', deptNo AS '부서번호'
FROM emp
WHERE job = 'manager' AND deptNo = 30;

#14. 부서번호가 30인 아닌 사원의 사번,이름,부서번호를 조회하시오. (not)
SELECT empNo AS '사원번호', eName AS '이름', deptNo AS '부서번호'
FROM emp
WHERE deptNo NOT 30;

#15. 커미션이 300, 500, 1400 이 모두 아닌 사원의 사번,이름,커미션을 조회하시오. (hint : not in)
SELECT eName AS '이름', empNo AS '사원번호',comm '커미션'
FROM emp
WHERE comm NOT IN (300, 500, 1400);

#16. 이름에 S가 포함되지 않는 사원의 사번,이름을 조회하시오. (hint : not like)
SELECT empNo AS '사원번호', eName AS '이름'
FROM emp
WHERE eName NOT LIKE 's%'

    #17. 급여가 1200보다 미만이거나 3700 초과하는 사원의 사번,이름,월급여를 조회하시오. (hint : not, between)
SELECT empNo AS '사원번호', eName AS '이름',  AS '월급여'
FROM emp
WHERE SAL NOT BETWEEN 1200 AND 3500;

#18. 직속상사가 NULL 인 사원의 이름과 직급을 조회하시오. (hint : is null, is not null)
SELECT empNo '사원번호', eName AS '이름', sal AS '급여'
FROM emp
WHERE mgr IS NULL;

#19. 부서별 평균월급여를 구하는 쿼리 (hint : group by, avg())
SELECT deptNo AS '부서', AVG(sal) AS '평균월급여'
FROM emp
GROUP BY deptNo;

#20. 부서별 전체 사원수와 커미션을 받는 사원들의 수를 구하는 쿼리 (hint : group by, count())
SELECT d.deptNo AS '부서'
    COUNT(e.empNo) AS total_employees,
COUNT(CASE WHEN e.comm IS NOT NULL THEN e.EMPNO END) AS COMMISSION_RECEIVING_EMPLOYEES
FROM dept d
    LEFT JOIN emp e
ON d.deptNo = e.deptNo
    gourp BY d.deptNo;

#21. 부서별 최대 급여와 최소 급여를 구하는 쿼리 (hint : group by, min(), max())
SELECT deptNo AS '부서', MAX(sal) AS '최대급여', MIN(sal) AS '최소급여'
FROM emp
GROUP BY deptNo;

#22. 부서별로 급여 평균 (단, 부서별 급여 평균이 2000 이상만) (hint : group by, having)
SELECT deptNo AS '부서', AVG(sal) AS '평균급여'
FROM emp
GROUP BY deptNo
HAVING AVG(sal) >= 2000;

#23. 월급여가 1000 이상인 사원만을 대상으로 부서별로 월급여 평균을 구하라. 단, 평균값이 2000 이상인 레코드만 구하라. (hint : group by, having)
SELECT deptNo AS '부서', AVG(sal) AS '평균급여'
FROM emp
WHERE sal >= 1000
GROUP BY deptNo
HAVING AVG(sal) >= 2000;

#24. 사원명과 부서명을 조회하시오. (hint : inner join)
SELECT eName '사원명', deptName '부서명'
FROM eName
         INNER JOIN dept
                    ON emp.deptName = dept.Name

    #25. 이름,월급여,월급여등급을 조회하시오. (hint : inner join, between)
SELECT eName, sal, salgrade
FROM emp, salgrade
WHERE sal BETWEEN losal,hisal;

#26. 이름,부서명,월급여등급을 조회하시오.
SELECT eName, deptName, salgrade
FROM emp, dept, salgrade
WHERE deptNo = deptNo AND sal BETWEEN losal AND hisal;

#27. 이름,직속상사이름을 조회하시오. (hint : self join
SELECT * FROM emp;
SELECT eName AS '이름', e
#28. 이름,직속상사이름을 조회하시오.(단 직속 상사가 없는 사람도 직속상사 결과가 null값으로 나와야 함) (hint : outer join)
###외부OUTER 조인. A LEFT JOIN B는 조인 조건에 만족하지 못하더라도 왼쪽 테이블 A의 행을 나타내고 싶을 때 사용한다. 반대로 A RIGHT JOIN B는 조인 조건에 만족하지 못하더라도 오른쪽 테이블 B의 행을 나타내고 싶을 때

#29. 이름,부서명을 조회하시오.단, 사원테이블에 부서번호가 40에 속한 사원이 없지만 부서번호 40인 부서명도 출력되도록 하시오. (hint : outer join)

#서브 쿼리는 SELECT 문 안에서 ()로 둘러싸인 SELECT 문을 말하며 쿼리문의 결과를 메인 쿼리로 전달하기 위해 사용된다.
#사원명 'JONES'가 속한 부서명을 조회하시오.
#부서번호를 알아내기 위한 쿼리가 서브 쿼리로 사용.

SELECT dName
FROM dept
WHERE deptNo = (SELECT deptNo FROM emp WHERE eName = 'JONES')

#30. 10번 부서에서 근무하는 사원의 이름과 10번 부서의 부서명을 조회하시오. (hint : sub query)

SELECT eName, deptName
FROM emp , (SELECT deptNo, deptName FROM dept WHERE deptNo =10)
WHERE deptNo = deptNo;

#31. 평균 월급여보다 더 많은 월급여를 받은 사원의 사원번호,이름,월급여 조회하시오. (hint : sub query)
SELECT empNo AS '사원번호', eName AS '이름', sal AS '월급여'
FROM emp
WHERE sal > (SELECT AVG(sal) FROM emp)
ORDER BY sal DESC

#32. 부서번호가 10인 사원중에서 최대급여를 받는 사원의 사원번호, 이름을 조회하시오. (hint : sub query)
SELECT empNo AS '사원번호', eName AS '이름'
FROM emp
WHERE sal = (SELECT MAX(sal) FROM emp WHERE deptNo = 10)