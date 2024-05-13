--8-1
select *
from emp, dept
order by empno;

select *
from emp,dept
where emp.deptno = dept.deptno
order by empno;


select e.empno, e.ename, e.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno 
            and e.sal >= 3000
order by e.deptno, e.empno;


-- 비등가 조인
--8-7
select 
    *
from salgrade;


select *
from emp e, salgrade s
where e.sal between s.losal and s.hisal and
         s.grade = 3;


/* 사원번호, 사원명, 월급, 급여등급, 부서명을 출력하세요. 단 부서명이 S로 시작되어야 합니다 .*/
select
    empno,
    ename,
    sal,
    grade,
    dname
from 
    emp e,
    salgrade s,
    dept d
where
    e.sal between s.losal and s.hisal and
    e.deptno = d.deptno and
   d.dname >= 'S';
   
   
--8-8
/*사원의 모든 항목을 출력하고, 매니저 성명을 출력하세요*/
select 
    e1.*,
    e2.ename as mgr_name
from 
    emp e1,
    emp e2
where 
    e1.mgr = e2.empno;
    


--8-9
-- 외부조인
/*사원의 모든 항목을 출력하고, 매니저 성명을 출력하세요*/
select 
    e1.*,
    e2.ename as mgr_name
from 
    emp e1,
    emp e2
where 
    e1.mgr = e2.empno(+);
    
    
--SQL-99
/* 사원번호, 사원명, 직책, 매니저, 입사일, 월급, 커미션, 부서번호, 부서명, 부서지역을 출력하세요*/
select
        e.empno,
        e.ename,
        e.job,
        e.mgr,
        e.hiredate,
        e.sal,
        e.comm,
        deptno,
        d.dname,
        d.loc
from
        emp e natural join dept d
order by deptno, e.empno;


select
        e.empno,
        e.ename,
        e.job,
        e.mgr,
        e.hiredate,
        e.sal,
        e.comm,
        deptno,
        d.dname,
        d.loc
from
        emp e join dept d using(deptno)
order by deptno, e.empno;


select
        e.empno,
        e.ename,
        e.job,
        e.mgr,
        e.hiredate,
        e.sal,
        e.comm,
        d.deptno,
        d.dname,
        d.loc
from
        emp e join dept d on (e.deptno = d.deptno)
order by deptno, e.empno;


select
        e.empno,
        e.ename,
        e.job,
        e.mgr,
        e.hiredate,
        e.sal,
        e.comm,
        d.deptno,
        d.dname,
        d.loc
from
        emp e inner join dept d on (e.deptno = d.deptno)
order by deptno, e.empno;


select *
from emp e
    join salgrade s on e.sal between s.losal and s.hisal;
    
    
/*사원번호, 사원명, 월급, 급여등급, 부서명을 출력하세요. 단 부서명이 S로 시작되어야 합니다. */
select empno, ename, sal, grade, dname
from emp e 
join salgrade s on (e.sal between s.losal and s.hisal)
join dept d on (e.deptno = d.deptno)
where dname like 'S%';



// p.239
// Q1
select 
    d.deptno,
    d.dname,
    e.empno,
    e.ename,
    e.sal
from 
    emp e join dept d on(e.deptno = d.deptno)
where
    e.sal > 2000;
    
    
//Q2
select 
    deptno,
    d.dname,
    avg(e.sal) as avg_sal,
    max(e.sal) as max_sal,
    count(*) as cnt
from 
     emp e join dept d using(deptno)
group by  deptno, dname;


//Q3
select 
    d.deptno,
    d.dname,
    e.empno,
    e.ename,
    e.job,
    e.sal
from 
    emp e right outer join dept d on (e.deptno = d.deptno);

//Q4
select 
    d.deptno,
    d.dname,
    e.empno,
    e.ename,
    e.mgr,
    e.sal,
    e.deptno as deptno_1,
    s.losal,
    s.hisal,
    s.grade,
    e1.empno as mgr_empno,
    e1.ename as mgr_ename
from 
    emp e join emp e1 on (e.mgr = e1.empno)
                join salgrade s on (e.sal between s.losal and s.hisal)
                right outer join dept d on (e.deptno = d.deptno);
                
                
select 
    d.deptno,
    dname,
    e.empno,
    e.ename,
    e.mgr,
    e.sal,
    losal,
    hisal,
    grader,
    e1.empno as mgr_empno,
    e1.ename as mgr_ename
from 
    dept d, emp e, salgrade s, emp e1
where 
    d.deptno = e.deptno (+)
    and e.sal between s.losal(+) and s.hisal(+)
    and e.mgr = e1.empno(+)
order by d.deptno ,e.empno;


select 
    d.deptno,
    dname,
    e.empno,
    e.ename,
    e.mgr,
    e.sal,
    losal,
    hisal,
    grade,
    e1.empno as mgr_empno,
    e1.ename as mgr_ename
from 
    dept d 
    left outer join emp e on (d.deptno = e.deptno)
    left outer join salgrade s on (e.sal between s.losal and s.hisal)
    left outer join emp e1 on (e.mgr = e1.empno)
order by d.deptno, e.empno;



-- chap.9
-- 서브퀴리
/* 급여가 'JONES'보다 큰 사원을 출력하세요 */
select *
from emp
where sal > (select sal from emp where ename='JONES');

/* SCOTT 입사일 이전에 입사한 사원을 출력하세요 */
select *
from emp
where hiredate < (select hiredate from emp where ename='SCOTT');

/* 평균 급여보다 높은 사원을 출력하세요. 
    사원번호, 사원명, 직위, 급여, 부서번호, 부서명, 부서위치로 출력합니다. */
select 
    emp.*,
    dname,
    loc
from emp join dept on(emp.deptno = dept.deptno)
where sal > (select avg(sal) from emp);


/* 'RESEARCH' 부서에서 전체 급여 평균보다 높은 사원을 출력하세요 */

select 
    *
from 
    emp join dept on (emp.deptno = dept.deptno)
where 
    dname = 'RESEARCH' and
    sal > (select avg(sal) from emp);
    
select  
    empno, ename, job, sal, e.deptno, d.dname, d.loc
from 
    emp e, dept d
where
    e.deptno = d.deptno
    and d.dname = 'RESEARCH'
    and e.sal > (
        select avg(sal) from emp
    );
    

select 
    empno,
    ename,
    deptno,
    dname
from 
    emp join dept using (deptno)
where 
    dname = 'RESEARCH' and
    sal > (select avg(sal) from emp);



-- 다중행
/* 각 부서별로 급여가 제일 높은 사원의 모든 항목을 출력하세요*/
select 
    *
from 
   emp
where
    (deptno, sal) in (select deptno, max(sal) from emp group by deptno);
    
    
/* 각 부서별로 급여가 제일 높은 사원의 모든 항목을 출력하세요*/
select 
    *
from 
   emp
where
    (deptno, sal) = any(select deptno, max(sal) from emp group by deptno);
    



/* 30번 부서 최소 급여보다 많은 사원을 출력하세요 */
select 
    *
from 
    emp
where 
    sal > any(select sal from emp where deptno=30);
// any는 일부만 true여도 된다. 
// deptno가 30인 급여에 대해서 최솟값에 대해서 true가 되면 전체 true다.
    
    
/* 30번 부서 최저급여보다 적은 사원을 출력하세요 */
select 
    *
from 
    emp
where 
    sal < all(select sal from emp where deptno=30);
// all은 모두 true가 되어야 한다 
// deptno가 30인 급여에 대해서 모두가 작아야한다. 
    
    
/* 30번 부서 최대급여보다 많은 사원을 출력하세요 */
select 
    *
from 
    emp
where 
    sal > all(select sal from emp where deptno=30);
// all은 모두 true가 되어야 한다 
// deptno가 30인 급여에 대해서 모두가 커야한다. 


select *
from emp
where exists (select dname from dept where deptno = 0);
// exists : 서브쿼리 결과 값이 존재하는 경우 true, 존재하지 않을 경우 false
// '특정 값이 존재할 때 select하라' 라는 쿼리문을 짤 때 유용하다. 



/* 부서별 부서번호와 최대 급여가 같은 사원을 출력하세요 */
select *
from emp
where (deptno, sal) in (select deptno, max(sal) from emp group by deptno);



/* 부서별 부서번호와 최대 급여가 같은 사원을 출력하세요*/
select *
from 
    emp
where (deptno,sal) in (
    select deptno, max(sal)
    from emp
    group by deptno);
    

select empno, ename, deptno
from (
    select empno, ename, deptno
    from emp
    where detpno = 10) emp10,
    dept d
where emp10.deptno = d.deptno;


-- with 사용하기
with 
    emp10 as (
        select empno, ename, deptno
        from emp 
        where deptno = 10
    ),
    d as (
        select * from dept
    )
    
select empno, ename, d.deptno, dname
from emp10, d
where emp10.deptno = d.deptno;



/* 부서번호가 30번인 사원의 부서번호, 부서명, 사원번호, 사원명, 매니저, 월급, 월급등급, 매니저 명 */

with
    emps as (
        select d.deptno, dname, e.empno, e.ename, e.mgr, e.sal, losal, hisal, grade, e1.empno as mgr_empno, e1.ename as mgr_ename
        from dept d, emp e, salgrade s, emp e1
        where d.deptno = e.deptno(+)
                    and e.sal between s.losal(+) and s.hisal(+)
                    and e.mgr = e1.empno(+)
    )
    
select *
from emps
where deptno = 30;


-- 부쿼리
select deptno, 
            (select dname from dept where deptno = emp.deptno) as dname,
            sal,
            (select grade from salgrade where emp.sal between losal and hisal) as salgrade
from emp;


-- p.263
// Q1
select 
    job, 
    empno,
    ename,
    sal,
    d.deptno,
    dname
from emp left join dept d on (emp.deptno = d.deptno)
where 
    job = (select job from emp where ename = 'ALLEN');

//Q2
select 
    empno,
    ename,
    dname,
    to_char(hiredate, 'YYYY-MM-DD') 
    loc, 
    sal,
    (select grade from salgrade where emp.sal between losal and hisal) as grade
from emp left join dept d on (emp.deptno = d.deptno)
where 
    sal > (select avg(sal) from emp);


    
    
//Q3
select
    empno,
    ename,
    job,
    d.deptno,
    dname,
    loc
from emp left join dept d on (emp.deptno = d.deptno)
where 
    job not in (select distinct job from emp where deptno = 30) and
    d.deptno = 10;
    
select e.empno, e.ename, e.job, e.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno
            and de.enptno = 10
            and job not in (select distinct job from emp where deptno = 30);


// Q4
select
    empno,
    ename,
    sal,
    (select grade from salgrade where emp.sal between losal and hisal) as grade
from emp
where 
    sal > (select max(sal)
        from emp
        where job = 'SALESMAN'
)
order by empno;


select
    empno,
    ename,
    sal,
    (select grade from salgrade where emp.sal between losal and hisal) as grade
from emp
where 
    sal > all(select distinct sal
        from emp
        where job = 'SALESMAN'
)
order by empno;




-- DML!!!!!!
-- 데이터 및 구조 복제
CREATE TABLE DEPT_TEMP
	AS SELECT * FROM DEPT;
SELECT * FROM DEPT_TEMP;

-- 데이터 말고 구조만 복제
CREATE TABLE DEPT_TEMP
    AS SELECT * FROM DEPT WHERE 1=2;
SELECT * FROM DEPT_TEMP;


INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
VALUES (50, 'DATABASE', 'SEOUL');

INSERT INTO DEPT_TEMP
VALUES (60, 'NETWORK', 'BUSAN');


-- NULL
--1
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
VALUES (50, 'WEB', NULL);

--2
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
VALUES (50, 'MOBILE', '');

--3
INSERT INTO DEPT_TEMP (DEPTNO, LOC)
VALUES (50, 'INCHEON');


--DROP TABLE EMP_TEMP;
--CREATE TABLE EMP_TEMP
--	AS SELECT * FROM EMP;
--SELECT * FROM EMP_TEMP;
--
---- 데이터 말고 구조만 복제
--CREATE TABLE EMP_TEMP
--    AS SELECT * FROM EMP WHERE 1=2;
--SELECT * FROM EMP_TEMP;
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(9999,'홍길동', 'PRESIDENT', NULL, '2001/01/01' ,5000, 1000, 10);

SELECT * FROM EMP_TEMP;


SELECT VALIDATE_CONVERSION('2001-01-05' AS DATE, 'YYYY-MM-DD') from DUAL;
// 날짜가 맞는지 확인하는 작업.
// 문자열인데 date로 자동변환

SELECT sysdate from dual;

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(1111,'성춘향', 'MANAGER', 9999, to_date('01/01/2005', 'MM/DD/YYYY') ,4000, NULL, 20);


INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(2111,'이순신', 'MANAGER', 9999, to_date('07/01/2001', 'MM/DD/YYYY') ,4000, NULL, 20);


insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values(3111,'심청이', 'MANAGER', 9999, SYSDATE, 4000, NULL, 30);

select * from emp_temp;


/* 급여 등급이 1등급인 사원을 추가하세요. EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO*/
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, GRADE
FROM EMP_TEMP, SALGRADE SA
WHERE 
    SAL BETWEEN SA.LOSAL AND SA.HISAL AND
    GRADE  = 1;
    

//insert를 하면 로그가 생성된다. 
//commit, rollback
// undo라는 테이블이 있다. (rollback과 commit을 위해서)
// 일단 undo 테이블에 저장된다. 
// 비용이 많이 든다. => 두 개의 테이블에 저장되기 때문에
// 외부에서 1000개짜리 데이터를 가져와서 insert 하게 되면 
// insert 한줄마다 transaction이 발생. 즉, undo 저장, commit, rollback 등 여러 작업들이 생성됨
// BULK INSERT -> 여러 데이터를 한번에 저장하므로써 비용을 절약할 수 있다. 

// BULK INSERT 예시  (BULK INSERT = BATCH INSERT)
// INSERT ALL이라는 명령어를 사용한다. 
// 특히, 초기 데이터를 입력할 때 INSERT ALL을 많이 쓴다. 

INSERT ALL 
INTO DEPT_TEMP VALUES(50, '부서1', '서울')
INTO DEPT_TEMP VALUES(60,'부서2', '부산')
SELECT * FROM DUAL;

// 마지막에 SELECT * FROM DUAL이 꼭 들어가야 한다. 


MERGE INTO DEPT_TEMP D
    USING DUAL
        ON (D.DEPTNO = 50)
    WHEN MATCHED THEN
        UPDATE SET D.DNAME = '부서1'
    WHEN NOT MATCHED THEN
        INSERT (DEPTNO, DNAME, LOC)
        VALUES (70,'부서3', '강원');



    


