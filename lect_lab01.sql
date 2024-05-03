-- 4-4 셀렉션(행)
select * from emp;

-- 4-5 프로젝션(열)
select empno, ename, deptno
from emp;

-- 4-6 중복제거
select DISTINCT deptno
from emp;

-- 4-7 중복제거(직책, 부서번호)
select DISTINCT job, deptno
from emp;

-- 4-8 중복허용
select all job, deptno
from emp;

-- 4-9 실습 예제
-- 사원테이블에서 사원명, 월급, 연봉을 출력하세요
select ename, sal, sal*12+comm
from emp;

/*--------------5/3--------------*/

-- 4-11
-- 사원테이블에서 사원명, 월급, 연봉을 출력 연봉은 ANNSAL로 출력
select ename, sal, sal*12+NVL(comm, 0) as annsal
from emp;

-- 사원들의 정보 중 부서번호와 부서명을 출력하시오
-- 단, 항목명을 "부서명", "부서번호"로 출력하시오
select deptno as "부서번호", dname as "부서명"
from dept;

-- 4-12
-- 사원정보를 월급순으로 정렬하여 출력
select *
from emp
order by sal;   --asc

-- 4-13
-- 사원정보를 월급역순으로 정렬하여 출력
select *
from emp
order by sal desc;

-- 4-14
-- 사원테이블에서 전체열을 부서번호(오름차순), 급여(내림차순)으로 정렬하여 출력
select *
from emp
order by deptno asc, sal desc;

-- p92, Q2
select DISTINCT job
from emp

-- p92, Q3
select EMPNO EMPLOYEE_NO, 
        ENAME EMPLOYEE_NAME,
        MGR MANAGER,
        SAL SALARY, 
        COMM COMMISSION,
        DEPTNO DEPARTMENT_NO,
        sal*12+comm ANNSAL
from emp
order by deptno desc, ename, annsal;

SELECT DEPTNO AS 부서번호,
           DEPTNO AS "부서 번호1",
           SAL*12+COMM AS ANNSAL,
           SAL*12+COMM AS "ANNSAL1"
FROM EMP
ORDER BY "부서 번호1" DESC;

-- 5-2
-- 사원 중 부서번호가 30인 사원을 출력
SELECT *
FROM EMP
WHERE DEPTNO=30;

-- 사원번호가 7782인 사원을 출력
SELECT *
FROM EMP
WHERE EMPNO = 7782;

-- 5-4
-- 부서번호가 20이거나 직책이 SALESMAN인 사원
SELECT *
FROM EMP
WHERE DEPTNO = 20 OR
            JOB = 'SALESMAN';
            
-- 5-5
-- 연봉이 36000인 사원
SELECT *
FROM EMP
WHERE (SAL*12) = 36000;

SELECT *
FROM EMP
WHERE SAL >= 2500 AND
           JOB = 'ANALYST';
            
/* 모든 사원정보와 1년 월급 총액을 ANNSAL로 월급 총액순으로 정렬해서 출력하시오
    단, 월급 총액은 36000 이어야 함 */

SELECT EMP.*, SAL*12 AS ANLSAL
FROM EMP
WHERE SAL*12 = 36000
ORDER BY ANLSAL DESC;

-- 5-7
-- 이름 첫글자가 'F' 이후로 시작하는 사원을 출력
SELECT *
FROM EMP
WHERE ENAME >= 'F';

-- 5-9
-- 급여가 3000이 아닌 사원을 출력
-- 1) != 사용
SELECT *
FROM EMP
WHERE SAL != 3000;

-- 2) <> 사용
SELECT *
FROM EMP
WHERE SAL <> 3000;

-- 3) ^= 사용
SELECT *
FROM EMP
WHERE SAL ^= 3000;

-- 4) NOT 사용
SELECT *
FROM EMP
WHERE NOT SAL = 3000;

-- 5-12
SELECT *
FROM EMP
WHERE NOT SAL = 3000;

-- 직책이 'MANAGER', 'SALESMAN'인 사원을 출력하시오(두가지 방법)
-- 1)
SELECT *
FROM EMP
WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN';

-- 2)
SELECT *
FROM EMP
WHERE JOB IN ('MANAGER', 'SALESMAN');

-- 직책이 'MANAGER', 'SALESMAN'를 제외한 사원을 출력하시오(두가지 방법)
-- 1)
SELECT *
FROM EMP
WHERE JOB != 'MANAGER' AND JOB != 'SALESMAN';

-- 2)
SELECT *
FROM EMP
WHERE JOB NOT IN ('MANAGER', 'SALESMAN');

-- 급여가 2000에서 3000 사이의 사원을 모두 출력하시오
SELECT *
FROM EMP
WHERE SAL >= 2000 AND
            SAL <= 3000;

SELECT *
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;

-- 급여가 2000 미만 3000보다 큰 사원을 모두 출력하시오
SELECT *
FROM EMP
WHERE SAL < 2000 OR
            SAL > 3000;
            
SELECT *
FROM EMP
WHERE SAL NOT BETWEEN 2000 AND 3000;

-- 사원명 'S'로 시작되는 사원을 출력하시오
SELECT *
FROM EMP
WHERE ENAME LIKE 'S%';

-- 사원명의 두번째 글자가 L인 사원을 출력하시오
SELECT *
FROM EMP
WHERE ENAME LIKE '_L%';

-- 사원명 중 AM이 포함된 사원을 출력하시오
SELECT *
FROM EMP
WHERE ENAME LIKE '%AM%';

SELECT *
FROM EMP
WHERE ENAME LIKE '%\%%';

-- 사원명 중 AM이 포함되지 않는 사원을 출력하시오
SELECT *
FROM EMP
WHERE ENAME NOT LIKE '%AM%';

-- 사원의 모든 정보를 출력하고, 연봉(월급*12 +수당)을 계산하여 출력
-- 단, 연봉이 NULL 인 사원은 제외하시오
SELECT EMP.*, SAL*12+COMM AS ANNSAL
FROM EMP
WHERE COMM IS NOT NULL;

SELECT EMP.*, SAL*12+COMM AS ANNSAL
FROM EMP
WHERE COMM = NULL;

-- 매니저가 없는 사원
SELECT *
FROM EMP
WHERE MGR IS NULL;

-- 5-28
SELECT *
FROM EMP
WHERE SAL > NULL AND
    COMM IS NULL;
    
SELECT *
FROM EMP
WHERE SAL > NULL;

SELECT *
FROM EMP
WHERE COMM IS NULL;

SELECT *
FROM EMP
WHERE SAL > NULL
            OR COMM IS NULL;
            
-- 5-34            
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO =10
UNION
SELECT MGR, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 20
UNION
SELECT DEPTNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 30
UNION
SELECT DEPTNO, DNAME, 0, DEPTNO
FROM DEPT
WHERE DEPTNO = 30;

-- 5-35
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO =10
UNION ALL
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

-- 5-37
-- 전체 사원 중 부서번호가 10인 사원들을 출력 - 교집합
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO=10;


-- 전체 사원 중 부서번호가 10이 아닌 사원들을 출력
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO=10;

/* p.125 문제 */
--INSERT INTO EMP VALUES
--            (7876, 'ADAMS', 'CLERK', 7788,
--            TO_DATE('12-01-1983', 'DD-MM-YYYY'), 1100, NULL, 20);
--INSERT INTO EMP VALUES
--            (7788, 'SCOTT', 'ANALYST', 7566,
--            TO_DATE('09-12-1982', 'DD-MM-YYYY'), 3000, NULL, 20);

-- Q1. 사원 이름이 S로 끝나는 사원 데이터를 출력
SELECT *
FROM EMP
WHERE ENAME LIKE '%S';

-- Q2. 30번 부서에서 근무하는 사원 중 SALESMAN인 사원의
--      사원번호, 이름, 직책, 급여, 부서번호 출력
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 30 AND JOB = 'SALESMAN';

-- Q3. 20, 30번 부서에 근무하는 사원 중 급여가 2000 초과인 사원을
--      두가지 방식으로 사원 번호, 이름, 급여, 부서번호 출력
-- 1) 집합연산자 사용 X
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN (20, 30) AND SAL > 2000;

-- 2) 집합연산자 사용 O
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN (20, 30)
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL > 2000;

-- Q4. NOT BETWEEN A AND B 연산자를 쓰지 않고, SAL이 2000 이상 3000 이하
--      범위 이외의 값을 가진 데이터 출력
SELECT *
FROM EMP
WHERE SAL < 2000 OR SAL > 3000
ORDER BY EMPNO;

-- Q5. 사원이름에 E가 포함되어 있는 30번 부서 사원 중 
--       급여가 1000~2000 사이가 아닌 사원이름, 사원번호, 급여, 부서번호를 출력
SELECT ENAME, EMPNO, SAL, DEPTNO
FROM EMP
WHERE  ENAME LIKE '%E%'
            AND DEPTNO = 30
            AND SAL NOT BETWEEN 1000 AND 2000;
            
-- Q6. 추가 수당이 존재하지 않고, 상급자가 있고, 직책이 MANAGER, CLERK이고
--      두번째 글자가 L이 아닌 사원 출력
SELECT *
FROM EMP
WHERE COMM IS NULL
            AND MGR IS NOT NULL
            AND JOB IN ('MANAGER', 'CLERK')
            AND ENAME NOT LIKE '_L%';