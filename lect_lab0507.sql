/* p.125 ���� Ǯ�� */
--INSERT INTO EMP VALUES
--            (7876, 'ADAMS', 'CLERK', 7788,
--            TO_DATE('12-01-1983', 'DD-MM-YYYY'), 1100, NULL, 20);
--INSERT INTO EMP VALUES
--            (7788, 'SCOTT', 'ANALYST', 7566,
--            TO_DATE('09-12-1982', 'DD-MM-YYYY'), 3000, NULL, 20);

-- Q1. ��� �̸��� S�� ������ ��� �����͸� ���
SELECT *
FROM EMP
WHERE ENAME LIKE '%S';

-- Q2. 30�� �μ����� �ٹ��ϴ� ��� �� SALESMAN�� �����
--      �����ȣ, �̸�, ��å, �޿�, �μ���ȣ ���
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 30 AND JOB = 'SALESMAN';

-- Q3. 20, 30�� �μ��� �ٹ��ϴ� ��� �� �޿��� 2000 �ʰ��� �����
--      �ΰ��� ������� ��� ��ȣ, �̸�, �޿�, �μ���ȣ ���
-- 1) ���տ����� ��� X
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN (20, 30) AND SAL > 2000;

-- 2) ���տ����� ��� O
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN (20, 30)
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL > 2000;

-- Q4. NOT BETWEEN A AND B �����ڸ� ���� �ʰ�, SAL�� 2000 �̻� 3000 ����
--      ���� �̿��� ���� ���� ������ ���
SELECT *
FROM EMP
WHERE SAL < 2000 OR SAL > 3000
ORDER BY EMPNO;

-- Q5. ����̸��� E�� ���ԵǾ� �ִ� 30�� �μ� ��� �� 
--       �޿��� 1000~2000 ���̰� �ƴ� ����̸�, �����ȣ, �޿�, �μ���ȣ�� ���
SELECT ENAME, EMPNO, SAL, DEPTNO
FROM EMP
WHERE  ENAME LIKE '%E%'
            AND DEPTNO = 30
            AND SAL NOT BETWEEN 1000 AND 2000;
            
-- Q6. �߰� ������ �������� �ʰ�, ����ڰ� �ְ�, ��å�� MANAGER, CLERK�̰�
--      �ι�° ���ڰ� L�� �ƴ� ��� ���
SELECT *
FROM EMP
WHERE COMM IS NULL
            AND MGR IS NOT NULL
            AND JOB IN ('MANAGER', 'CLERK')
            AND ENAME NOT LIKE '_L%';


/* ----- ����Ŭ �Լ� ------ */
-- 6-1
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
FROM EMP;

-- 6-2
SELECT *
FROM EMP
WHERE ENAME = UPPER('scott');

SELECT *
FROM EMP
WHERE LOWER(ENAME) = LOWER('scott');

-- 6-3
SELECT *
FROM EMP
WHERE UPPER(ENAME) LIKE UPPER('%scott%');

-- 6-4
SELECT ENAME, LENGTH(ENAME)
FROM EMP;

-- 6-5
SELECT ENAME, LENGTH(ENAME)
FROM EMP
WHERE LENGTH(ENAME) >= 5;

-- 6-6
SELECT LENGTH('�ѱ�'), LENGTHB('�ѱ�'),
           LENGTH('ABCD'), LENGTHB('ABCD'),
           LENGTH('ABCD�����ٶ�'), LENGTHB('ABCD�����ٶ�')
FROM dual;

desc dual;

-- 6-7
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5)
FROM EMP;

-- 6-8
SELECT JOB,
          SUBSTR(JOB, -5),
          SUBSTR(JOB, -5, 2),
          SUBSTR(JOB, -LENGTH(JOB)),
          SUBSTR(JOB, -LENGTH(JOB), 2)
FROM EMP;

-- 6-9
SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,
           INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2,
           INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3,
           INSTR('HELLO, ORACLE!', 'Z') AS INSTR_4,
           INSTR('HELLO, ORACLE!', 'OR') AS IDX
FROM DUAL;

-- 6-10
/* ����� �� 'S'�� ���Ե� ����� ��� �Ͻÿ�(INSTR ���) */
SELECT *
FROM EMP
WHERE INSTR(ENAME, 'S') != 0;

-- 6-11
/* ����� �� 'S'�� ���Ե� ����� ��� �Ͻÿ�(LIKE ���) */
SELECT *
FROM EMP
WHERE ENAME LIKE '%S%';

-- 6-12
SELECT '010-1234-5678' AS ORG,
           REPLACE('010-1234-5678', '-', ' ') AS REPLACE_1,
           REPLACE('010-1234-5678', '-') AS REPLACE_2
FROM DUAL;

/* 01012345678 => tel1: 010, tel2: 1234, tel3: 5678 */
SELECT '01012345678' AS TEL,
           SUBSTR('01012345678', 1, 3) AS TEL1,
           SUBSTR('01012345678', 4, 4) AS TEL2,
           SUBSTR('01012345678', -4) AS TEL3
FROM DUAL;

/* abcd@host.com => addr: abcd, host: host.com */
SELECT 'abcd@host.com' as EMAIL,
           INSTR('abcd@host.com', '@') as ATSIGN,
           SUBSTR('abcd@host.com', 1,  INSTR('abcd@host.com', '@')-1) as ADDR,
           SUBSTR('abcd@host.com', INSTR('abcd@host.com', '@')+1) as HOST
FROM DUAL;

-- 6-13
SELECT 'Oracle',
           LPAD('Oracle', 10, '#') as lpad_1,
           RPAD('Oracle', 10, '*') as rpad_1,
           LPAD('Oracle', 10) as lpad_2,
           RPAD('Oracle', 10) as rpad_2
FROM dual;

/* �����ȣ�� ������� ����ϼ���. ��, ��������� �����ȣ:��������� ���� */
SELECT CONCAT(EMPNO, ENAME),
            CONCAT(EMPNO, CONCAT(':', ENAME)),
            EMPNO || ':' || ENAME
FROM EMP;

SELECT '[' || ' _ _Oracle_ _ ' || ']' AS STR,
           '[' || TRIM(' _ _Oracle_ _ ') || ']' AS TRIM01,
           '[' || TRIM(leading from ' _ _Oracle_ _ ') || ']' AS TRIM_LEADING,
           '[' || TRIM(TRAILING from ' _ _Oracle_ _ ') || ']' AS TRIM_TRAILING,
           '[' || TRIM(both from ' _ _Oracle_ _ ') || ']' AS TRIM_BOTH
FROM DUAL;

SELECT '[' || ' _ _Oracle_ _ ' || ']' AS STR,
           '[' || TRIM(' _ _Oracle_ _ ') || ']' AS TRIM01,
           '[' || LTRIM(' _ _Oracle_ _ ') || ']' AS TRIM_LTRIM,
           '[' || RTRIM(' _ _Oracle_ _ ') || ']' AS TRIM_RTRIM,
           '[' || RTRIM('<_Oracle_>', '_>') || ']' AS TRIM_RTRIM
FROM DUAL;

/* ���� */
-- �ݿø�
-- 6-19
SELECT 1234.56789 AS N1,
            ROUND(1234.56789) AS N2,
            ROUND(1234.56789, 2) AS N3,
            ROUND(1234.56789, -2) AS N4,
            ROUND(1234.56789, -1) AS N5,
            ROUND(-1234.56789, 2) AS N6
FROM DUAL;

-- 6-21
select ceil(1.6) as n1, ceil(-1.6) as n2,
         floor(1.6) as n3, floor(-1.6) as n4
from dual;

-- 6-22
select mod(15, 6) as m1, mod(3,4) as m2
from dual;

/* 12/5�� ��� �������� ����Ͻÿ� */
select trunc(12/5) as a, 
        mod(12, 5) as b
from dual;

-- 6-23
select sysdate as today,
        sysdate-1 as yesterday,
        sysdate+1 as tomorrow
from dual;

select empno, hiredate, trunc(sysdate-hiredate), trunc((sysdate-hiredate)/365)
from emp;

/* �ټ����� 15500�� �̻��� ����� ����ϼ��� */
select *
from emp
where trunc(sysdate-hiredate) >= 15500;

-- 6-24
select sysdate, add_months(sysdate, 3), add_months(sysdate, 10)
from dual;

/* �Ի��Ϸκ��� 10�ֳ��� �Ǵ� ��¥�� �����ȣ, �����, �Ի���, 10�ֳ���(tenyear)�� ��� */
SELECT EMPNO, ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 120)
FROM EMP;

/* �Ի� 42�� �̸��� ����� ����ϼ��� */
SELECT *
FROM EMP
WHERE ADD_MONTHS(HIREDATE, 504) > SYSDATE;

-- 6-27
SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
            MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MON1,
            MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MON2,
            TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MON3
FROM EMP;

-- 6-28
SELECT SYSDATE, NEXT_DAY(SYSDATE, '������'), LAST_DAY(SYSDATE)
FROM DUAL;

-- 6-29
SELECT SYSDATE,
    ROUND(SYSDATE, 'CC') AS FORMAT_CC,
    ROUND(SYSDATE, 'YYYY') AS FORMAT_YYYY,
    ROUND(SYSDATE, 'Q') AS FORMAT_Q,
    ROUND(SYSDATE, 'DDD') AS FORMAT_DDD,
    ROUND(SYSDATE, 'HH') AS FORMAT_HH
FROM DUAL;

-- 6-30
SELECT SYSDATE,
    TRUNC(SYSDATE, 'CC') AS FORMAT_CC,
    TRUNC(SYSDATE, 'YYYY') AS FORMAT_YYYY,
    TRUNC(SYSDATE, 'Q') AS FORMAT_Q,
    TRUNC(SYSDATE, 'DDD') AS FORMAT_DDD,
    TRUNC(SYSDATE, 'HH') AS FORMAT_HH
FROM DUAL;

-- 6-31
-- �ڵ�����ȯ
SELECT SAL, SAL+'100000', SAL || '100000'
FROM EMP;

-- ���ڿ� ��ȯ
-- 6-36
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI;SS') AS TODAY,
            TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') AS TODAY2,
            TO_CHAR(SYSDATE, 'MM') AS MONTH1,
            TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE=KOREAN') AS MONTH2,
            TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE=ENGLISH') AS MONTH3
FROM DUAL;

/* 1981�⿡ �Ի��� ����� ��� */
SELECT *
FROM EMP
WHERE TO_CHAR(HIREDATE, 'YYYY') = '1981';

/* 1981�� 2�� 22�Ͽ� �Ի��� ����� ��� */
SELECT *
FROM EMP
WHERE TO_CHAR(HIREDATE, 'YYYYMMDD') = '19810222';

-- 6-37
SELECT SYSDATE,
        TO_CHAR(SYSDATE, 'HH24:MI:SS') AS TIME01,
        TO_CHAR(SYSDATE, 'HH24:MI:SS AM') AS TIME02,
        TO_CHAR(SYSDATE, 'P.M. HH24:MI:SS') AS TIME03
FROM DUAL;