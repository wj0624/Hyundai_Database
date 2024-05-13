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


-- �� ����
--8-7
select 
    *
from salgrade;


select *
from emp e, salgrade s
where e.sal between s.losal and s.hisal and
         s.grade = 3;


/* �����ȣ, �����, ����, �޿����, �μ����� ����ϼ���. �� �μ����� S�� ���۵Ǿ�� �մϴ� .*/
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
/*����� ��� �׸��� ����ϰ�, �Ŵ��� ������ ����ϼ���*/
select 
    e1.*,
    e2.ename as mgr_name
from 
    emp e1,
    emp e2
where 
    e1.mgr = e2.empno;
    


--8-9
-- �ܺ�����
/*����� ��� �׸��� ����ϰ�, �Ŵ��� ������ ����ϼ���*/
select 
    e1.*,
    e2.ename as mgr_name
from 
    emp e1,
    emp e2
where 
    e1.mgr = e2.empno(+);
    
    
--SQL-99
/* �����ȣ, �����, ��å, �Ŵ���, �Ի���, ����, Ŀ�̼�, �μ���ȣ, �μ���, �μ������� ����ϼ���*/
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
    
    
/*�����ȣ, �����, ����, �޿����, �μ����� ����ϼ���. �� �μ����� S�� ���۵Ǿ�� �մϴ�. */
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
-- ��������
/* �޿��� 'JONES'���� ū ����� ����ϼ��� */
select *
from emp
where sal > (select sal from emp where ename='JONES');

/* SCOTT �Ի��� ������ �Ի��� ����� ����ϼ��� */
select *
from emp
where hiredate < (select hiredate from emp where ename='SCOTT');

/* ��� �޿����� ���� ����� ����ϼ���. 
    �����ȣ, �����, ����, �޿�, �μ���ȣ, �μ���, �μ���ġ�� ����մϴ�. */
select 
    emp.*,
    dname,
    loc
from emp join dept on(emp.deptno = dept.deptno)
where sal > (select avg(sal) from emp);


/* 'RESEARCH' �μ����� ��ü �޿� ��պ��� ���� ����� ����ϼ��� */

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



-- ������
/* �� �μ����� �޿��� ���� ���� ����� ��� �׸��� ����ϼ���*/
select 
    *
from 
   emp
where
    (deptno, sal) in (select deptno, max(sal) from emp group by deptno);
    
    
/* �� �μ����� �޿��� ���� ���� ����� ��� �׸��� ����ϼ���*/
select 
    *
from 
   emp
where
    (deptno, sal) = any(select deptno, max(sal) from emp group by deptno);
    



/* 30�� �μ� �ּ� �޿����� ���� ����� ����ϼ��� */
select 
    *
from 
    emp
where 
    sal > any(select sal from emp where deptno=30);
// any�� �Ϻθ� true���� �ȴ�. 
// deptno�� 30�� �޿��� ���ؼ� �ּڰ��� ���ؼ� true�� �Ǹ� ��ü true��.
    
    
/* 30�� �μ� �����޿����� ���� ����� ����ϼ��� */
select 
    *
from 
    emp
where 
    sal < all(select sal from emp where deptno=30);
// all�� ��� true�� �Ǿ�� �Ѵ� 
// deptno�� 30�� �޿��� ���ؼ� ��ΰ� �۾ƾ��Ѵ�. 
    
    
/* 30�� �μ� �ִ�޿����� ���� ����� ����ϼ��� */
select 
    *
from 
    emp
where 
    sal > all(select sal from emp where deptno=30);
// all�� ��� true�� �Ǿ�� �Ѵ� 
// deptno�� 30�� �޿��� ���ؼ� ��ΰ� Ŀ���Ѵ�. 


select *
from emp
where exists (select dname from dept where deptno = 0);
// exists : �������� ��� ���� �����ϴ� ��� true, �������� ���� ��� false
// 'Ư�� ���� ������ �� select�϶�' ��� �������� © �� �����ϴ�. 



/* �μ��� �μ���ȣ�� �ִ� �޿��� ���� ����� ����ϼ��� */
select *
from emp
where (deptno, sal) in (select deptno, max(sal) from emp group by deptno);



/* �μ��� �μ���ȣ�� �ִ� �޿��� ���� ����� ����ϼ���*/
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


-- with ����ϱ�
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



/* �μ���ȣ�� 30���� ����� �μ���ȣ, �μ���, �����ȣ, �����, �Ŵ���, ����, ���޵��, �Ŵ��� �� */

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


-- ������
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
-- ������ �� ���� ����
CREATE TABLE DEPT_TEMP
	AS SELECT * FROM DEPT;
SELECT * FROM DEPT_TEMP;

-- ������ ���� ������ ����
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
---- ������ ���� ������ ����
--CREATE TABLE EMP_TEMP
--    AS SELECT * FROM EMP WHERE 1=2;
--SELECT * FROM EMP_TEMP;
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(9999,'ȫ�浿', 'PRESIDENT', NULL, '2001/01/01' ,5000, 1000, 10);

SELECT * FROM EMP_TEMP;


SELECT VALIDATE_CONVERSION('2001-01-05' AS DATE, 'YYYY-MM-DD') from DUAL;
// ��¥�� �´��� Ȯ���ϴ� �۾�.
// ���ڿ��ε� date�� �ڵ���ȯ

SELECT sysdate from dual;

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(1111,'������', 'MANAGER', 9999, to_date('01/01/2005', 'MM/DD/YYYY') ,4000, NULL, 20);


INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(2111,'�̼���', 'MANAGER', 9999, to_date('07/01/2001', 'MM/DD/YYYY') ,4000, NULL, 20);


insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values(3111,'��û��', 'MANAGER', 9999, SYSDATE, 4000, NULL, 30);

select * from emp_temp;


/* �޿� ����� 1����� ����� �߰��ϼ���. EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO*/
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, GRADE
FROM EMP_TEMP, SALGRADE SA
WHERE 
    SAL BETWEEN SA.LOSAL AND SA.HISAL AND
    GRADE  = 1;
    

//insert�� �ϸ� �αװ� �����ȴ�. 
//commit, rollback
// undo��� ���̺��� �ִ�. (rollback�� commit�� ���ؼ�)
// �ϴ� undo ���̺� ����ȴ�. 
// ����� ���� ���. => �� ���� ���̺� ����Ǳ� ������
// �ܺο��� 1000��¥�� �����͸� �����ͼ� insert �ϰ� �Ǹ� 
// insert ���ٸ��� transaction�� �߻�. ��, undo ����, commit, rollback �� ���� �۾����� ������
// BULK INSERT -> ���� �����͸� �ѹ��� �����ϹǷν� ����� ������ �� �ִ�. 

// BULK INSERT ����  (BULK INSERT = BATCH INSERT)
// INSERT ALL�̶�� ��ɾ ����Ѵ�. 
// Ư��, �ʱ� �����͸� �Է��� �� INSERT ALL�� ���� ����. 

INSERT ALL 
INTO DEPT_TEMP VALUES(50, '�μ�1', '����')
INTO DEPT_TEMP VALUES(60,'�μ�2', '�λ�')
SELECT * FROM DUAL;

// �������� SELECT * FROM DUAL�� �� ���� �Ѵ�. 


MERGE INTO DEPT_TEMP D
    USING DUAL
        ON (D.DEPTNO = 50)
    WHEN MATCHED THEN
        UPDATE SET D.DNAME = '�μ�1'
    WHEN NOT MATCHED THEN
        INSERT (DEPTNO, DNAME, LOC)
        VALUES (70,'�μ�3', '����');



    


