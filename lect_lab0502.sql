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